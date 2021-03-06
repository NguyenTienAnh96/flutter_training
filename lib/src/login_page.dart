import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_training/dialog/loading_dialog.dart';
import 'package:flutter_training/providers/base_view.dart';
import 'package:flutter_training/providers/login_page_provicer.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends BaseView<LoginPage, LoginPageProvider> {
  bool _isShow = false;
  bool isLoggedIn = false;
  String name = '';
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  void initState() {
    super.initState();
    //_autoLogIn();
  }

  void onToggleShowPass() {
    setState(() {
      _isShow = !_isShow;
    });
  }

  void loginEvents(String username, String password) async {
    LoadingDialog.showLoadingDialog(context, 'Loading...');
    this.provider.checkUserNamePass(username, password);
    // if (a == true) {
    //   LoadingDialog.hideLoadingDialog(context);
    //   _setUsername(username);
    //   _setPassword(password);
    //   Navigator.of(context)
    //       .push(MaterialPageRoute(builder: (context) => HomePage()));
    // } else {
    //   _logout();
    //   LoadingDialog.hideLoadingDialog(context);
    //   MessageDialog.showMessageDialog(context, "Đăng nhập thất bại",
    //       "Tài khoản hoặc mật khẩu không chính xác!");
  }

  // void _setUsername(String user) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String username = user;
  //   await prefs.setString('username', username);
  // }

  // void _setPassword(String pass) async {
  //   SharedPreferences prefs = await SharedPreferences.getInstance();
  //   String password = pass;
  //   await prefs.setString('password', password);
  // }

  // void autologinEvents(String username, String password) async {
  //   LoadingDialog.showLoadingDialog(context, 'Loading...');
  //   bool a = await LoginServer.Signin(username, password);
  //   if (a == true) {
  //     LoadingDialog.hideLoadingDialog(context);

  //     Navigator.of(context)
  //         .push(MaterialPageRoute(builder: (context) => HomePage()));
  //   } else {
  //     LoadingDialog.hideLoadingDialog(context);
  //     MessageDialog.showMessageDialog(context, "Đăng nhập thất bại",
  //         "Tài khoản hoặc mật khẩu không chính xác!");
  //   }
  // }

  // void _autoLogIn() async {
  //   //LoadingDialog.showLoadingDialog(context, 'Loading...');
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final String userId = prefs.getString('username');
  //   final String password = prefs.getString('password');
  //   print('user" $userId password $password');
  //   bool a = await LoginServer.Signin(userId, password);
  //   if (userId != null && password != null) {
  //     setState(() {
  //       isLoggedIn = true;
  //       name = userId;

  //       if (a == true) {
  //         autologinEvents(userId, password);
  //       } else {
  //         LoadingDialog.hideLoadingDialog(context);
  //       }
  //     });
  //     return;
  //   }
  // }

  // Future<Null> _logout() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString('username', '');
  //   prefs.setString('password', '');
  //   setState(() {
  //     name = '';
  //     isLoggedIn = false;
  //   });
  // }

  // Future<Null> loginUser() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString('username', _usernameController.text);

  //   setState(() {
  //     name = _usernameController.text;
  //     isLoggedIn = true;
  //   });

  //   _usernameController.clear();
  // }

  Widget _text(
    String text,
    double size,
    Color color,
  ) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Text(
        text,
        style:
            TextStyle(color: color, fontSize: size, fontFamily: "Mali-Italic"),
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String labelText, String errorText) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        controller: controller,
        autofocus: false,
        style: TextStyle(color: Colors.white, fontFamily: "Mali-Italic"),
        decoration: InputDecoration(
          errorText: errorText,
          labelText: labelText,
        ),
      ),
    );
  }

  @override
  Widget body() {
    return GestureDetector(
      onTap: () {
        FocusScopeNode current = FocusScope.of(context);
        if (!current.hasPrimaryFocus) {
          current.unfocus();
        }
      },
      child: Scaffold(
          backgroundColor: Colors.white70,
          body: Container(
            child: Stack(
              children: [
                Center(
                    child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Container(
                    height: 300.0,
                    width: 250.0,
                    child: Image.network(
                      'https://res.cloudinary.com/dziablq1m/image/upload/v1563708785/Gardenex/catalogs/faux1.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                )),
                Positioned(
                    top: 30.0,
                    left: 0.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Container(
                        height: 300.0,
                        width: 250.0,
                        child: Image.network(
                          'https://res.cloudinary.com/dziablq1m/image/upload/v1563708785/Gardenex/catalogs/fresh1.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    )),
                Positioned(
                    bottom: 70.0,
                    right: -50.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: Container(
                        height: 300.0,
                        width: 250.0,
                        child: Image.network(
                          'https://res.cloudinary.com/dziablq1m/image/upload/v1563708787/Gardenex/catalogs/dried1.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    )),
                Center(
                  child: Container(
                    height: 400.0,
                    width: 300.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(color: Colors.blue[200]),
                        color: Colors.blue[200]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _text('Welcome to', 30.0, Colors.white),
                        _text('Gadenex', 50.0, Colors.white),
                        Consumer<ErrorUsernameNotifier>(
                            builder: (context, value, child) => _buildTextField(
                                _usernameController, 'User name', value.value)),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Consumer<ErrorPasswordNotifier>(
                              builder: (context, value, child) => Stack(
                                alignment: AlignmentDirectional.centerEnd,
                                children: [
                                  TextField(
                                    controller: _passwordController,
                                    obscureText: !_isShow,
                                    autofocus: false,
                                    style: TextStyle(
                                      fontFamily: "Mali-Italic",
                                      color: Colors.white,
                                    ),
                                    decoration: InputDecoration(
                                      errorText: value.value,
                                      labelText: 'Password',
                                    ),
                                  ),
                                  GestureDetector(
                                    child: Container(
                                        padding: EdgeInsets.only(right: 20),
                                        child: Icon(_isShow
                                            ? Icons.visibility
                                            : Icons.visibility_off)),
                                    onTap: onToggleShowPass,
                                  )
                                ],
                              ),
                            )),
                        Padding(
                          padding:
                              EdgeInsets.only(top: 30, left: 20, right: 20),
                          child: SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: RaisedButton(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Text(
                                'SiGN IN',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontFamily: "Mali-Italic"),
                              ),
                              onPressed: () => loginEvents(
                                  _usernameController.text,
                                  _passwordController.text),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }

  @override
  LoginPageProvider initProvider() => LoginPageProvider(this);
}
