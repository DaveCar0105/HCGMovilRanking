import 'dart:convert';
import 'package:ranking_app/src/constant.dart';
import 'package:ranking_app/src/dtos/session.dto.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  static final Preferences _instancia = new Preferences._internal();
  Preferences._internal();
  SharedPreferences _prefs;

  factory Preferences() {
    return _instancia;
  }

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  get getAutentication {
    try {
      final value = _prefs.getString(Constant.NAME_PREFERENCE);
      return (value != null && value != "")
          ? SessionDto.fromJson(jsonDecode(value))
          : null;
    } catch (ex) {
      return null;
    }
  }

  get headerAutentication {
    final sessionDto = this.getAutentication as SessionDto;
    String token = sessionDto?.accessToken ?? "";
    return {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization": "Bearer " + token,
    };
  }

  set setAutentication(SessionDto sessionDto) {
    final value = jsonEncode(sessionDto);
    _prefs.setString(Constant.NAME_PREFERENCE, value);
  }

  get getSinc {
    return _prefs.getBool(Constant.BANDERA_PREFERENCE) ?? false;
  }

  set setSinc(bool value) {
    _prefs.setBool(Constant.BANDERA_PREFERENCE, value);
  }
}
