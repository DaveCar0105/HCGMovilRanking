import 'package:flutter/material.dart';
import 'package:ranking_app/src/constant.dart';
import 'package:ranking_app/src/database-creator.dart';
import 'package:ranking_app/src/preference.dart';
import 'package:ranking_app/src/repositories/carguera.repository.dart';
import 'package:ranking_app/src/repositories/causa.repository.dart';
import 'package:ranking_app/src/repositories/cliente.repository.dart';
import 'package:ranking_app/src/repositories/error.repository.dart';
import 'package:ranking_app/src/repositories/pais.repository.dart';
import 'package:ranking_app/src/repositories/postcosecha.repository.dart';
import 'package:ranking_app/src/repositories/producto.repository.dart';
import 'package:ranking_app/src/repositories/tipo-caja.repository.dart';
import 'package:ranking_app/src/repositories/variedad.repository.dart';
import 'package:ranking_app/src/services/sincronize-information-server.service.dart';
import 'package:ranking_app/src/ui/main.page.dart';
import 'package:ranking_app/src/ui/pages/login/login.page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DatabaseCreator databaseCreator = new DatabaseCreator();
  await databaseCreator.initDatabase();
  final pref = Preferences();
  await pref.initPrefs();
  if (pref.getAutentication != null &&
      (pref.getSinc == null || pref.getSinc == false)) {
    SincronizeServerInformation sincrnonizar = new SincronizeServerInformation(
        ErrorRepository(),
        CargueraRepository(ErrorRepository()),
        CausaRepository(ErrorRepository()),
        ClienteRepository(ErrorRepository()),
        PaisRepository(ErrorRepository()),
        PostcosechaRepository(ErrorRepository()),
        ProductoRepository(ErrorRepository()),
        TipoCajaRepository(ErrorRepository()),
        VariedadRepository(ErrorRepository()));
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
