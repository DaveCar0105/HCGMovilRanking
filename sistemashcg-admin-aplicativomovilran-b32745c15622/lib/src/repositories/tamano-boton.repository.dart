import 'package:ranking_app/src/constant.dart';
import 'package:ranking_app/src/database-creator.dart';
import 'package:ranking_app/src/dtos/tamano-boton.dto.dart';
import 'package:ranking_app/src/repositories/error.repository.dart';

class TamanoBotonRepository {
  final ErrorRepository _errorRepository;
  final moduloRepository = 'TamanioBoton';

  TamanoBotonRepository(this._errorRepository);

  Future<bool> insert(TamanoBotonDto tamanoBotonDto) async {
    print("ingresando");
    final sql = '''INSERT INTO ${DatabaseCreator.procesoTamanioBotonTable}(
  ${DatabaseCreator.usuarioId},
  ${DatabaseCreator.procesoTamanioBotonFecha},
  ${DatabaseCreator.variedadId},
  ${DatabaseCreator.procesoTamanioBotonGradoVariedad},
  ${DatabaseCreator.procesoTamanioBotonLargoArea},
  ${DatabaseCreator.procesoTamanioBotonAnchoArea},
  ${DatabaseCreator.procesoTamanioBotonAreaRamo},
  ${DatabaseCreator.procesoTamanioBotonTamanoBoton1},
  ${DatabaseCreator.procesoTamanioBotonTamanoBoton2},
  ${DatabaseCreator.procesoTamanioBotonTamanoBoton3},
  ${DatabaseCreator.procesoTamanioBotonTamanoBotonPromedio},
  ${DatabaseCreator.procesoTamanioBotonNumeroPetalos},
  ${DatabaseCreator.procesoTamanioBotonEstado}
  )
  VALUES(
    ${tamanoBotonDto.usuarioId},
   '${tamanoBotonDto.procesoTamanioBotonFecha}',
    ${tamanoBotonDto.variedadId},
    ${tamanoBotonDto.procesoTamanioBotonGradoVariedad},
    ${tamanoBotonDto.procesoTamanioBotonLargoArea},
    ${tamanoBotonDto.procesoTamanioBotonAnchoArea},
    ${tamanoBotonDto.procesoTamanioBotonAreaRamo},
    ${tamanoBotonDto.procesoTamanioBotonTamanoBoton1},
    ${tamanoBotonDto.procesoTamanioBotonTamanoBoton2},
    ${tamanoBotonDto.procesoTamanioBotonTamanoBoton3},
    ${tamanoBotonDto.procesoTamanioBotonTamanoBotonPromedio},
    ${tamanoBotonDto.procesoTamanioBotonNumeroPetalos},
    ${ConstantDatabase.DB_COLUMN_ESTADO_DEAULT_ACTVIO}
  )''';
  print(sql);
    int id = await db.rawInsert(sql);
    return id > 0 ? true : false;
  }

  Future<List<TamanoBotonDto>> selectAll() async {
    List<TamanoBotonDto> tamanioBotonDto = [];
    try {
      final sql = ''' SELECT * FROM ${DatabaseCreator.procesoTamanioBotonTable}
    WHERE ${DatabaseCreator.procesoTamanioBotonEstado}=${ConstantDatabase.DB_COLUMN_ESTADO_DEAULT_ACTVIO};''';
      final data = await db.rawQuery(sql);
      for (final node in data) {
        var dto = TamanoBotonDto.fromJson(node);
        tamanioBotonDto.add(dto);
      }
    } catch (ex) {
      print("asd"+ex);
    }
    return tamanioBotonDto;
  }

  Future<void> delete() async {
    try {
      final sqlH = 'DELETE FROM ${DatabaseCreator.procesoTamanioBotonTable}';
      await db.rawDelete(sqlH);
    } catch (ex) {
      await this
          ._errorRepository
          .addErrorWithDetalle(moduloRepository, ex.toString());
    }
  }
}
