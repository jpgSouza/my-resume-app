import 'package:my_resume_app/src/database/firebase.dart';
import 'package:my_resume_app/src/model/entities/user_model.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:my_resume_app/src/model/validators/user_input_validator.dart';
import 'package:rxdart/rxdart.dart';

enum CreateState { IDLE, LOADING, SUCCESS, FAIL }

class UserBloc extends BlocBase with UserInputValidator {
  User user;
  FirebaseDB firebaseDB;
  Map<String, dynamic> userData = Map();

  //Controllers
  final _nameController = BehaviorSubject<String>();
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();
  final _confirmPasswordController = BehaviorSubject<String>();
  final _stateController = BehaviorSubject<CreateState>();

  //Streams
  Stream<String> get outName => _nameController.stream.transform(validateName);
  Stream<String> get outEmail =>
      _emailController.stream.transform(validateEmail);
  Stream<String> get outPassword =>
      _passwordController.stream.transform(validatePassword);
  Stream<String> get outConfirmPassword =>
      _confirmPasswordController.stream.transform(validateConfirmPassword);
  Stream<CreateState> get outState => _stateController.stream;

  Function(String) get changeName => _nameController.sink.add;
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;
  Function(String) get changeConfirmPassword =>
      _confirmPasswordController.sink.add;

  UserBloc() {
    user = new User.def();
    firebaseDB = new FirebaseDB();
    _stateController.add(CreateState.IDLE);
  }

  @override
  void dispose() {
    _nameController.close();
    _emailController.close();
    _passwordController.close();
    _confirmPasswordController.close();
    _stateController.close();
  }

  void insert() async {
    String name = _nameController.value;
    String email = _emailController.value;
    String password = _passwordController.value;
    String confirmPassword = _confirmPasswordController.value;

    user = new User(name, email, password, confirmPassword);
    userData = user.toMap();

    _stateController.add(CreateState.LOADING);

    _createWithEmailAndPassword(email, password, userData, 'users');
  }

  void _createWithEmailAndPassword(String email, String password,
      Map<String, dynamic> data, String collection) async {
    firebaseDB.firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((currentUser) async {
      firebaseDB.firebaseUser = currentUser;
      await firebaseDB.saveOnCloudFirestore(data, collection);
      _stateController.add(CreateState.SUCCESS);
    }).catchError((err) {
      _stateController.add(CreateState.FAIL);
    });
  }
}
