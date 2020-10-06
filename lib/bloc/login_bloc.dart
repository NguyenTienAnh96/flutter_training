import 'package:flutter_training/validators/validation.dart';
import 'dart:async';

class LoginBloc {
  StreamController _emailController = new StreamController();
  StreamController _passController = new StreamController();

  Stream get emailStream => _emailController.stream;

  Stream get passStream => _passController.stream;

  bool isInvalidInfo(String email, String pass) {
    if (!Validations.isValidEmail(email)) {
      _emailController.sink.addError('Email không hợp lệ!');
      return false;
    }
    _emailController.sink.add('ok');
    if (!Validations.isValidPassword(pass)) {
      _passController.sink.addError('Password không hợp lệ');
      return false;
    }
    _passController.sink.add('ok');
    return true;
  }

  void dispose() {
    _emailController.close();
    _passController.close();
  }
}
