import 'package:flutter/material.dart';
import 'package:ranking_app/locator.dart';
import 'package:ranking_app/src/constant.dart';
import 'package:ranking_app/src/database-creator.dart';
import 'package:ranking_app/src/preference.dart';
import 'package:ranking_app/src/services/sincronize-information-server.service.dart';
import 'package:ranking_app/src/ui/main.page.dart';
import 'package:ranking_app/src/ui/pages/login/login.page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUpDI();
  await locator<DatabaseCreator>().initDatabase();
  final pref = locator<Preferences>();
  await pref.initPrefs();
  if (pref.getAutentication != null &&
      (pref.getSinc == null || pref.getSinc == false)) {
    var sincrnonizar = locator<SincronizeServerInformation>();
    await sincrnonizar.sincronized();
    //pref.setSinc = true;
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //var initRouter = pref.getAutentication != null ? 'main' : 'login';
    var initRouter = 'main';
    return MaterialApp(
      title: 'RANKING APP',
      theme: ThemeData(
          primarySwatch: Constant.COLOR_SECONDARY,
          primaryColor: Constant.COLOR_PRIMARY),
      initialRoute: initRouter,
      routes: {
        'login': (BuildContext context) => LoginPage(),
        'main': (BuildContext context) => MainPage(),
      },
    );
  }
}
