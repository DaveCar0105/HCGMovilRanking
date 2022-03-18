import 'package:ranking_app/src/constant.dart';
import 'package:http/http.dart' as http;
import 'package:ranking_app/src/dtos/session.dto.dart';
import '../../locator.dart';
import '../dtos/evaluacion-finca-form-parse.dto.dart';
import '../preference.dart';

class FormService {
  final String nombreModelo = 'formulario/formulario';
  SessionDto sessionDto;
  Preferences pref = locator<Preferences>();

  Future<List<Forms>> retrieveForm() async {
    try {
      var url = Uri.http(Constant.URL, nombreModelo);
      final respuesta = await http.get(url);
      if (respuesta.statusCode >= 200 && respuesta.statusCode <= 299) {
        final forms = formsFromJson(respuesta.body.toString());
        return forms;
      }
      return [];
    } catch (ex) {
      print(ex.toString());
      return [];
    }
  }
}
