import 'package:flutter/material.dart';
import 'package:flutter_training/src/home_page.dart';
import 'package:flutter_training/src/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogoutDialog {
  static void showLoadingDialog(BuildContext context, String msg) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => new Dialog(
              child: Container(
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(msg),
                    Padding(
                        padding: EdgeInsets.only(right: 10, left: 10, top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RaisedButton(
                              onPressed: () {
                                logout();
                                Navigator.of(context).pop(HomePage());
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                              },
                              child: Text('Có'),
                            ),
                            RaisedButton(
                              onPressed: () {
                                hideLogoutDialog(context);
                              },
                              child: Text('Thoát'),
                            )
                          ],
                        ))
                  ],
                ),
              ),
            ));
  }

  static hideLogoutDialog(BuildContext context) {
    Navigator.of(context).pop(LogoutDialog);
  }

  static logout() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', null);
    prefs.setString('password', null);
  }
}
