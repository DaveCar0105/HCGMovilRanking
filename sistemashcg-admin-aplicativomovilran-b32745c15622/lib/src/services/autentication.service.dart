import 'dart:convert';
import 'package:ranking_app/src/constant.dart';
import 'package:http/http.dart' as http;
import 'package:ranking_app/src/dtos/session.dto.dart';
import '../../locator.dart';
import '../preference.dart';

class AutenticationService {
  final String nombreModelo = 'autenticacion';
  SessionDto sessionDto;
  Preferences pref = locator<Preferences>();

  Future<bool> postLogin(String username, String password) async {
    const objetoAutentication = {
      'nickname': 'adminEc',
      'password': 'RankingHcg'
    };
    try {
      var url = Uri.http(Constant.URL, nombreModelo);
      final respuesta = await http.post(url, body: objetoAutentication);
      if (respuesta.statusCode >= 200 && respuesta.statusCode <= 299) {
        sessionDto = SessionDto.fromJson(jsonDecode(respuesta.body.toString()));
        //print(jsonEncode(sessionDto.usuarioDto));
        pref.setAutentication = sessionDto;
        return true;
      }
      return false;
    } catch (ex) {
      print(ex.toString());
      return false;
    }
  }
}
