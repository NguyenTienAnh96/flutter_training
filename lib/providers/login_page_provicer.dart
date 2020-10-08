import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_training/model/login.dart';
import 'package:flutter_training/model/user.dart';
import 'package:flutter_training/providers/base_notifier.dart';
import 'package:flutter_training/providers/base_provider.dart';
import 'package:flutter_training/src/home_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class LoginPageProvider extends BaseProvider {
  LoginPageProvider(State<StatefulWidget> state) : super(state) {
    checkLogin();
  }
  ErrorUsernameNotifier _errorUsername = ErrorUsernameNotifier(null);
  ErrorPasswordNotifier _errorPassword = ErrorPasswordNotifier(null);
  IsObscureNotifier _isObscure = IsObscureNotifier(false);
  IsLoadingNotifier _isLoading = IsLoadingNotifier(false);

  checkLogin() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    if (_preferences.containsKey('HasLogin') &&
        _preferences.getBool('HasLogin')) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomePage()));
    }
  }

  void setErrorText(String username, String password) {
    _errorUsername.value = username;
    _errorPassword.value = password;
  }

  void changeObscure() {
    _isObscure.value = !_isObscure.value;
  }

  checkUserNamePass(String username, String pass) {
    setErrorText(null, null);

    if (username.isEmpty && pass.isEmpty) {
      setErrorText('Enter your username', 'Enter your password');
    } else if (username.isEmpty) {
      setErrorText('Enter your username', null);
    } else if (pass.isEmpty) {
      setErrorText(null, "Enter your password");
    } else {
      _getlogin(User_Post(username, pass));
    }
  }

  void _getlogin(User_Post user) async {
    _isLoading.value = true;

    final response = await http.post(
        'https://gardenex.herokuapp.com/user/authenticate',
        body: user.toJson());

    Login data = Login.fromJson(json.decode(response.body));

    if (data.code != 200) {
      _isLoading.value = false;
      setErrorText("Wrong username or password", "Wrong username or password");
    } else {
      SharedPreferences _preferences = await SharedPreferences.getInstance();
      _preferences.setBool('HasLogin', true);
      _preferences.setString('token', data.data.token);
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => HomePage()));
    }
  }

  @override
  List<BaseNotifier> initNotifiers() =>
      [_errorUsername, _errorPassword, _isObscure, _isLoading];
}

class ErrorUsernameNotifier extends BaseNotifier<String> {
  ErrorUsernameNotifier(String value) : super(value);

  @override
  ListenableProvider<Listenable> provider() {
    return ChangeNotifierProvider<ErrorUsernameNotifier>(
      create: (context) => this,
    );
  }
}

class ErrorPasswordNotifier extends BaseNotifier<String> {
  ErrorPasswordNotifier(String value) : super(value);

  @override
  ListenableProvider<Listenable> provider() {
    return ChangeNotifierProvider<ErrorPasswordNotifier>(
      create: (context) => this,
    );
  }
}

class IsObscureNotifier extends BaseNotifier<bool> {
  IsObscureNotifier(bool value) : super(value);

  @override
  ListenableProvider<Listenable> provider() {
    return ChangeNotifierProvider(create: (context) => this);
  }
}

class IsLoadingNotifier extends BaseNotifier<bool> {
  IsLoadingNotifier(value) : super(value);

  @override
  ListenableProvider<Listenable> provider() {
    return ChangeNotifierProvider<IsLoadingNotifier>(
      create: (context) => this,
    );
  }
}
