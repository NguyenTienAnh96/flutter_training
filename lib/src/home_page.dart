import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_training/dialog/logout_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Page'),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: RaisedButton(
            color: Colors.red,
            onPressed: () {
              LogoutDialog.showLoadingDialog(context, 'Bạn muốn đăng xuất?');
            },
            child: Text(
              'Log out',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
