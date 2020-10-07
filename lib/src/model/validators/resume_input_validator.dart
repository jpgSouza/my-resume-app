import 'dart:async';

class ResumeInputValidator {
  final validatePhone =
      StreamTransformer<String, String>.fromHandlers(handleData: (phone, sink) {
    if (phone.length == 15) {
      sink.add(phone);
    } else {
      sink.addError("Telefone inválido");
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

  final validateTitle =
      StreamTransformer<String, String>.fromHandlers(handleData: (title, sink) {
    if (title.length >= 2 && title.length <= 12) {
      sink.add(title);
    } else {
      sink.addError("Min: 2 caracteres. Max: 12 caracteres");
    }
  });

  final validadeCourseTitle =
      StreamTransformer<String, String>.fromHandlers(handleData: (title, sink) {
    if (title.length >= 4 && title.length <= 20) {
      sink.add(title);
    } else {
      sink.addError("Min: 4 caracteres. Max: 14 caracteres");
    }
  });

  final validadeCourseDate =
      StreamTransformer<String, String>.fromHandlers(handleData: (date, sink) {
    if (date.length == 10) {
      sink.add(date);
    } else {
      sink.addError("Data inválida");
    }
  });
}
