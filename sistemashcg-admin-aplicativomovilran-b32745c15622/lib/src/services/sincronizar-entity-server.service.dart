import 'dart:convert';

import 'package:ranking_app/src/constant.dart';
import 'package:ranking_app/src/preference.dart';
import 'package:ranking_app/src/repositories/error.repository.dart';
import 'package:http/http.dart' as http;

class SincronizeEntityServerService {
  Map<String, String> headers;
  Preferences pref = Preferences();
  final ErrorRepository _errorRepository;
  final moduloService = 'SincronizeServerInformation';

  SincronizeEntityServerService(this._errorRepository);

  Future<bool> postTamanioBoton(var dataJson) async {
    String nameServiceServer = 'TamanioBoton ';
    this.headers = this.pref.headerAutentication ?? null;
    print("SALIDA");
    //print(jsonEncode(dataJson));
    try {
      final url =
          Uri.http(Constant.URL, ConstantServicesServer.PROCESO_TAMANO_BOTON_CONTROLLER);
      final respuesta = await http.post(url, body: jsonEncode(dataJson) , headers: this.headers);
      print(respuesta.toString());
      if (respuesta.statusCode >= 200 && respuesta.statusCode <= 299) {
        return true;
      }
      await this._errorRepository.addErrorWithDetalle(
          moduloService, nameServiceServer + respuesta.statusCode.toString());
      return false;
    } catch (ex) {
      await this._errorRepository.addErrorWithDetalle(
          moduloService, nameServiceServer + ex.toString());
      return false;
    }
  }

  Future<bool> postProcesoMaltrato(var dataJson) async {
    String nameServiceServer = 'ProcesoMaltrato ';
    this.headers = this.pref.headerAutentication ?? null;
    print("SALIDA");
    //print(jsonEncode(dataJson));
    try {
      final url =
          Uri.http(Constant.URL, ConstantServicesServer.PROCESO_MALTRATO_CONTROLLER);
      final respuesta = await http.post(url, body: jsonEncode(dataJson) , headers: this.headers);
      print(respuesta.toString());
      if (respuesta.statusCode >= 200 && respuesta.statusCode <= 299) {
        return true;
      }
      await this._errorRepository.addErrorWithDetalle(
          moduloService, nameServiceServer + respuesta.statusCode.toString());
      return false;
    } catch (ex) {
      await this._errorRepository.addErrorWithDetalle(
          moduloService, nameServiceServer + ex.toString());
      return false;
    }
  }

  Future<bool> postInformacionAdicional(var dataJson) async {
    String nameServiceServer = 'InformacionAdicional ';
    this.headers = this.pref.headerAutentication ?? null;
    try {
      final url =
          Uri.http(Constant.URL, ConstantServicesServer.INFORMACION_AUDITORIA_CONTROLLER);
      final respuesta = await http.post(url, body: jsonEncode(dataJson) , headers: this.headers);
      print(respuesta.toString());
      if (respuesta.statusCode >= 200 && respuesta.statusCode <= 299) {
        return true;
      }
      await this._errorRepository.addErrorWithDetalle(
          moduloService, nameServiceServer + respuesta.statusCode.toString());
      return false;
    } catch (ex) {
      await this._errorRepository.addErrorWithDetalle(
          moduloService, nameServiceServer + ex.toString());
      return false;
    }
  }

}