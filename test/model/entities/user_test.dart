import 'package:flutter_test/flutter_test.dart';
import 'package:my_resume_app/src/model/entities/user_model.dart';

void main() {
  group("Test user map", () {
    test("name", () {
      User user = new User('Joao Pedro', 'joao@gmail.com', '123456', '123456');
      Map<String, dynamic> userData = Map();
      userData = user.toMap();
      expect(userData['name'], 'Joao Pedro');
    });

    test("email", () {
      User user = new User('Joao Pedro', 'joao@gmail.com', '123456', '123456');
      Map<String, dynamic> userData = Map();
      userData = user.toMap();
      expect(userData['email'], 'joao@gmail.com');
    });
  });
}
