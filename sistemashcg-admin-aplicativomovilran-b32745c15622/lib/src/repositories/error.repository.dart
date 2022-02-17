import 'package:ranking_app/src/database-creator.dart';
import 'package:ranking_app/src/dtos/error.dto.dart';

class ErrorRepository {
  Future<bool> addError(ErrorDto errorT) async {
    try {
      final sql = '''INSERT INTO ${DatabaseCreator.errorTable}(
        ${DatabaseCreator.errorDetalle}
      ) 
      VALUES (
        '${errorT.errorDetalle}'
      )''';
      int id = await db.rawInsert(sql);
      return id > 0 ? true : false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> addErrorWithDetalle(String modulo, String detalle) async {
    try {
      ErrorDto errorDto = new ErrorDto();
      errorDto.errorDetalle = modulo + ": " + detalle;
      final sql = '''INSERT INTO ${DatabaseCreator.errorTable}(
        ${DatabaseCreator.errorDetalle}
      ) 
      VALUES (
        '${errorDto.errorDetalle}'
      )''';
      int id = await db.rawInsert(sql);
      return id > 0 ? true : false;
    } catch (e) {
      return false;
    }
  }
}
