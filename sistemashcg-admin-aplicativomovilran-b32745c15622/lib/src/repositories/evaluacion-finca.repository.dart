import '../database-creator.dart';
import '../dtos/evaluacion-finca-parse.dto.dart';
import 'error.repository.dart';

class EvaluacionFincaRepository {
  final ErrorRepository _errorRepository;
  final moduloRepository = 'EvaluacionFinca';

  EvaluacionFincaRepository(this._errorRepository);

  Future<bool> insert(EvaluacionFincaParseDto evaluacionFincaParseDto) async {
    final sql = '''INSERT INTO ${DatabaseCreator.evaluacionFincaTable}(

    ${DatabaseCreator.fechaAuditoria},
    ${DatabaseCreator.tipoEvaluacion},
    ${DatabaseCreator.postcosechaId},
    ${DatabaseCreator.usuarioId}
    )VALUES(
      '${evaluacionFincaParseDto.fechaAuditoria}',
      '${evaluacionFincaParseDto.tipoEvaluacion}',
      ${evaluacionFincaParseDto.postcosechaId},
      ${evaluacionFincaParseDto.usuarioId}
    )''';

    int id = await db.rawInsert(sql);
    return id > 0 ? true : false;
  }

  Future<List<EvaluacionFincaParseDto>> selectAll() async {
    List<EvaluacionFincaParseDto> evaluacionFincaPaserDto = [];
    try {
      final sql = 'SELECT * FROM ${DatabaseCreator.evaluacionFincaTable};';
      final data = await db.rawQuery(sql);
      for (final node in data) {
        var dto = EvaluacionFincaParseDto.fromJson(node);
        evaluacionFincaPaserDto.add(dto);
      }
    } catch (ex) {
      await this
          ._errorRepository
          .addErrorWithDetalle(moduloRepository, ex.toString());
    }
    return evaluacionFincaPaserDto;
  }
}
