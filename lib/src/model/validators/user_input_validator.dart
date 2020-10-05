import 'dart:async';

class UserInputValidator {
  static String _password;

  final validateName =
      StreamTransformer<String, String>.fromHandlers(handleData: (name, sink) {
    if (name.isNotEmpty) {
      sink.add(name);
    } else {
      sink.addError("Nome inválido");
    }
  });

  final validateEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    if (email.contains("@")) {
      sink.add(email);
    } else {
      sink.addError("E-mail inválido");
    }
  });

  final validatePassword =
      StreamTransformer<String, String>.fromHandlers(handleData: (
    password,
    sink,
  ) {
    if (password.length >= 6) {
      sink.add(password);
      _password = password;
    } else {
      sink.addError("A senha deve conter 6 ou mais caracteres");
    }
  });

  final validateConfirmPassword =
      StreamTransformer<String, String>.fromHandlers(handleData: (
    confirmPassword,
    sink,
  ) {
    if (confirmPassword == _password && _password.isNotEmpty) {
      sink.add(confirmPassword);
    } else {
      sink.addError("Senha diferente");
    }
  });
}
