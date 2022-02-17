import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:ranking_app/src/services/autentication.service.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState(AutenticationService());
}

class _LoginPageState extends State<LoginPage> {
  bool idUsuario = false;
  final AutenticationService _autenticationService;
  final user = TextEditingController();
  final pass = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  static String router = 'main';

  _LoginPageState(this._autenticationService);

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }

  login(BuildContext context) async {
    final progress = ProgressHUD.of(context);
    progress?.showWithText('Loading...');
    try {
      bool userId =
          await this._autenticationService.postLogin(user.text, pass.text);
      if (userId) {
        progress?.dismiss();
        Navigator.pushReplacementNamed(context, router);
      } else {
        progress?.dismiss();
        //mostrarSnackbar("Credenciales incorrectas!!!", Colors.redAccent, scaffoldKey);
      }
    } catch (e) {
      progress?.dismiss();
      //mostrarSnackbar("Credenciales incorrectas!!!", Colors.redAccent, scaffoldKey);
    }
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        key: scaffoldKey,
        body: ProgressHUD(
            child: Builder(
          builder: (context) => Center(
              child: Scrollbar(
                  child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: h * 0.2),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          spreadRadius: 2,
                          offset: Offset(1, 1),
                          blurRadius: 7,
                        )
                      ],
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                    height: 80,
                    width: 350,
                    child: Image.asset(
                      'assets/img/logo_login.png',
                      width: width * 0.7,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 40),
                  ),
                  Container(
                    width: 300,
                    child: Center(
                      child: Column(
                        children: <Widget>[
                          TextField(
                            decoration: InputDecoration(hintText: 'User'),
                            controller: user,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 40),
                          ),
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(hintText: 'Password'),
                            controller: pass,
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: h * 0.08),
                  ),
                  InkWell(
                      onTap: () {
                        login(context);
                      },
                      child: Container(
                        height: 35,
                        width: 100,
                        alignment: Alignment(0, 0),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              offset: Offset(1, 1),
                              blurRadius: 7,
                            )
                          ],
                        ),
                        child: Text(
                          'Login',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.only(top: h * 0.1),
                  ),
                ],
              ),
            ],
          ))),
        )));
  }
}
