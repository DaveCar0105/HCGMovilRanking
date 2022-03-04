import '../database-creator.dart';
import '../dtos/evaluacion-finca-parse.dto.dart';
import 'error.repository.dart';

class EvaluacionDetalleRepository {
  final ErrorRepository _errorRepository;
  final moduloRepository = 'evaluacionDetalle';

  EvaluacionDetalleRepository(this._errorRepository);

  Future<bool> insert(
      EvaluacionFincaParseDetalleDto evaluacionFincaParseDetalleDto) async {
    final sql = '''INSERT INTO ${DatabaseCreator.evaluacionDetalleTable}(
     ${DatabaseCreator.numeroMesa},
     ${DatabaseCreator.gradoVariedad},
     ${DatabaseCreator.tallosPorRamo},
     ${DatabaseCreator.variedadId}
   )VALUES(
     ${evaluacionFincaParseDetalleDto.numeroMesa},
     ${evaluacionFincaParseDetalleDto.gradoVariedad},
     ${evaluacionFincaParseDetalleDto.tallosPorRamo},
     ${evaluacionFincaParseDetalleDto.variedadId}
   )''';
    int id = await db.rawInsert(sql);
    return id > 0 ? true : false;
  }

  Future<List<EvaluacionFincaParseDetalleDto>> selectAll() async {
    List<EvaluacionFincaParseDetalleDto> evaluacionFincaParseDetalleDto = [];
    try {
      final sql = 'SELECT * FROM ${DatabaseCreator.evaluacionDetalleTable};';
      final data = await db.rawQuery(sql);
      for (final node in data) {
        var dto = EvaluacionFincaParseDetalleDto.fromJson(node);
        evaluacionFincaParseDetalleDto.add(dto);
      }
    } catch (ex) {
      await this
          ._errorRepository
          .addErrorWithDetalle(moduloRepository, ex.toString());
    }
    return evaluacionFincaParseDetalleDto;
  }
}
