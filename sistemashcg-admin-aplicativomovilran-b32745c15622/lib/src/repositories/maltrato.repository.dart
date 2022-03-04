import '../constant.dart';
import '../database-creator.dart';
import '../dtos/generic.dto.dart';
import '../dtos/maltrato.dt.dart';
import 'error.repository.dart';

class MaltratoRepository {
  final ErrorRepository _errorRepository;
  final moduloRepository = 'Maltrato';

  MaltratoRepository(this._errorRepository);

  Future<bool> insert(MaltratoDto maltratoDto) async {
    final sql = '''INSERT INTO ${DatabaseCreator.procesoMaltratoTable}(
      ${DatabaseCreator.postcosechaId},
      ${DatabaseCreator.variedadId},
      ${DatabaseCreator.usuarioId},
      ${DatabaseCreator.procesoMaltratoFecha},
      ${DatabaseCreator.procesoMaltratoTallosMuestreadoRecepcion},
      ${DatabaseCreator.procesoMaltratoTallosMaltratoRecepcion},
      ${DatabaseCreator.procesoMaltratoPorcentajeIndicenciaRecepcion},
      ${DatabaseCreator.procesoMaltratoTallosMuestreadoBoncheo},
      ${DatabaseCreator.procesoMaltratoTallosMaltratoBoncheo},
      ${DatabaseCreator.procesoMaltratoPorcentajeIndicenciaBoncheo},
      ${DatabaseCreator.procesoMaltratoTallosMuestreadoCuartoFrio},
      ${DatabaseCreator.procesoMaltratoTallosMaltratoCuartoFrio},
      ${DatabaseCreator.procesoMaltratoPorcentajeIndicenciaCuartoFrio},
      ${DatabaseCreator.procesoMaltratoTallosMuestreadoEmpaque},
      ${DatabaseCreator.procesoMaltratoTallosMaltratoEmpaque},
      ${DatabaseCreator.procesoMaltratoPorcentajeIndicenciaEmpaque},
      ${DatabaseCreator.estado}
    )VALUES(
      ${maltratoDto.postcosechaId},
      ${maltratoDto.variedadId},
      ${maltratoDto.usuarioId},
      '${maltratoDto.procesoMaltratoFecha}',
      ${maltratoDto.procesoMaltratoTallosMuestreadoRecepcion},
      ${maltratoDto.procesoMaltratoTallosMaltratoRecepcion},
      ${maltratoDto.procesoMaltratoPorcentajeIndicenciaRecepcion},
      ${maltratoDto.procesoMaltratoTallosMuestreadoBoncheo},
      ${maltratoDto.procesoMaltratoTallosMaltratoBoncheo},
      ${maltratoDto.procesoMaltratoPorcentajeIndicenciaBoncheo},
      ${maltratoDto.procesoMaltratoTallosMuestreadoCuartoFrio},
      ${maltratoDto.procesoMaltratoTallosMaltratoCuartoFrio},
      ${maltratoDto.procesoMaltratoPorcentajeIndicenciaCuartoFrio},
      ${maltratoDto.procesoMaltratoTallosMuestreadoEmpaque},
      ${maltratoDto.procesoMaltratoTallosMaltratoEmpaque},
      ${maltratoDto.procesoMaltratoPorcentajeIndicenciaEmpaque},
      ${ConstantDatabase.DB_COLUMN_ESTADO_DEAULT_ACTVIO}
    )''';

    int id = await db.rawInsert(sql);
    return id > 0 ? true : false;
  }

  Future<List<MaltratoDto>> selectAll() async {
    List<MaltratoDto> maltratoDto = [];
    try {
      final sql = '''SELECT * FROM ${DatabaseCreator.procesoMaltratoTable} 
      WHERE ${DatabaseCreator.procesoMaltratoEstado}=${ConstantDatabase.DB_COLUMN_ESTADO_DEAULT_ACTVIO}''';
      final data = await db.rawQuery(sql);
      for (final node in data) {
        maltratoDto.add(MaltratoDto.fromJson(node));
      }
    } catch (ex) {
      print(ex.toString());
      await this
          ._errorRepository
          .addErrorWithDetalle(moduloRepository, ex.toString());
    }
    return maltratoDto;
  }

  Future<List<GenericDto>> selectAllGeneric() async {
    List<GenericDto> maltratoDto = [];
    try {
      final sql = ''' SELECT * FROM ${DatabaseCreator.procesoMaltratoTable}
      WHERE ${DatabaseCreator.procesoMaltratoEstado}=${ConstantDatabase.DB_COLUMN_ESTADO_DEAULT_ACTVIO}''';
      final data = await db.rawQuery(sql);
      for (final node in data) {
        maltratoDto.add(new GenericDto(
          id: node[DatabaseCreator.procesoMaltratoId],
          // nombre: node[DatabaseCreator.procesoMaltrato]
        ));
      }
    } catch (ex) {
      await this
          ._errorRepository
          .addErrorWithDetalle(moduloRepository, ex.toString());
    }
    return maltratoDto;
  }

  Future<void> delete() async {
    try {
      final sqlH = 'DELETE FROM ${DatabaseCreator.procesoMaltratoTable}';
      await db.rawDelete(sqlH);
    } catch (ex) {
      await this
          ._errorRepository
          .addErrorWithDetalle(moduloRepository, ex.toString());
    }
  }
}
//falta nombre de la finca y subfinca