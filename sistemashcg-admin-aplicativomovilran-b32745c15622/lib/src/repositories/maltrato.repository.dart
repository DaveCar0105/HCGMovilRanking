import 'package:ranking_app/src/constant.dart';
import 'package:ranking_app/src/database-creator.dart';
import 'package:ranking_app/src/dtos/generic.dto.dart';
import 'package:ranking_app/src/dtos/maltrato.dt.dart';
import 'package:ranking_app/src/dtos/tamano-boton.dto.dart';
import 'package:ranking_app/src/repositories/error.repository.dart';

class MaltratoRepository {
  final ErrorRepository _errorRepository;
  final moduloRepository = 'Maltrato';

  MaltratoRepository(this._errorRepository);

  Future<bool> insert(MaltratoDto maltratoDto) async {
    final sql = '''INSERT INTO ${DatabaseCreator.procesoMaltratoTable}(
      ${DatabaseCreator.postcosechaPadreId},
      ${DatabaseCreator.postcosechaId},
      ${DatabaseCreator.variedadNombre},
      ${DatabaseCreator.procesoMaltratoTallosMuestreadoRecepcion},
      ${DatabaseCreator.procesoMaltratoTallosMuestreadoRecepcion},
      ${DatabaseCreator.procesoMaltratoPorcentajeIndicenciaRecepcion},
      ${DatabaseCreator.procesoMaltratoTallosMuestreadoBoncheo},
      ${DatabaseCreator.procesoMaltratoTallosMaltratoBoncheo},
      ${DatabaseCreator.procesoMaltratoPorcentajeIndicenciaBoncheo},
      ${DatabaseCreator.procesoMaltratoTallosMuestreadoCuartoFrio},
      ${DatabaseCreator.procesoMaltratoTallosMaltratoCuartoFrio},
      ${DatabaseCreator.procesoMaltratoPorcentajeIndicenciaCuartoFrio},
      ${DatabaseCreator.procesoMaltratoTallosMuestreadoEmpaque},
      ${DatabaseCreator.procesoMaltratoTallosMaltratoEmpaque},
  Future<bool> insert(MaltratoDto maltratoDto)async{
    final sql='''INSERT INTO ${DatabaseCreator.procesoMaltratoTable}(
      
      ${DatabaseCreator.postcosechaPadreId},
      ${DatabaseCreator.postcosechaId},
      ${DatabaseCreator.variedadId},
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
      ${DatabaseCreator.procesoMaltratoPorcentajeIndicenciaEmpaque}
    )VALUES(
      ${maltratoDto.nombreFinca},
      ${maltratoDto.nombreSubFinca},
      '${maltratoDto.variedad}',
      ${maltratoDto.tallosMuestradosRecepcion},
      ${maltratoDto.precenciaMaltratoRecepcion},
      ${maltratoDto.porcentajeIncidenciaRecepcion},
      ${maltratoDto.tallosMuestradosClasificaciN},
      ${maltratoDto.precenciaMaltratoClasificaciN},
      ${maltratoDto.porcentajeIncidenciaClasificaciN},
      ${maltratoDto.tallosMuestreadosCuartoFrio},
      ${maltratoDto.presenciaMaltratoCuartoFrio},
      ${maltratoDto.porcentajeIncidenciaCuartoFrio},
      ${maltratoDto.tallosMuestreadosEmpaque},
      ${maltratoDto.presenciaMaltratoEmpaque},
      ${maltratoDto.porcentajeIncidenciaEmpaque},
      ${maltratoDto.postcosechaPadreId},
      ${maltratoDto.postcosechaId},
      ${maltratoDto.variedadId},
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
        maltratoDto.add(new MaltratoDto(
            nombreFinca: node[DatabaseCreator.postcosechaPadreId],
            nombreSubFinca: node[DatabaseCreator.postcosechaId],
            variedad: node[DatabaseCreator.variedadNombre],
            tallosMuestradosRecepcion:
                node[DatabaseCreator.procesoMaltratoTallosMuestreadoRecepcion],
            precenciaMaltratoRecepcion:
                node[DatabaseCreator.procesoMaltratoTallosMaltratoRecepcion],
            porcentajeIncidenciaRecepcion: node[
                DatabaseCreator.procesoMaltratoPorcentajeIndicenciaRecepcion],
            tallosMuestradosClasificaciN:
                node[DatabaseCreator.procesoMaltratoTallosMuestreadoBoncheo],
            precenciaMaltratoClasificaciN:
                node[DatabaseCreator.procesoMaltratoTallosMaltratoBoncheo],
            porcentajeIncidenciaClasificaciN: node[
                DatabaseCreator.procesoMaltratoPorcentajeIndicenciaBoncheo],
            tallosMuestreadosCuartoFrio:
                node[DatabaseCreator.procesoMaltratoTallosMuestreadoCuartoFrio],
            presenciaMaltratoCuartoFrio:
                node[DatabaseCreator.procesoMaltratoTallosMaltratoCuartoFrio],
            porcentajeIncidenciaCuartoFrio: node[
                DatabaseCreator.procesoMaltratoPorcentajeIndicenciaCuartoFrio],
            tallosMuestreadosEmpaque:
                node[DatabaseCreator.procesoMaltratoTallosMuestreadoEmpaque],
            presenciaMaltratoEmpaque:
                node[DatabaseCreator.procesoMaltratoTallosMaltratoEmpaque],
            porcentajeIncidenciaEmpaque: node[
                DatabaseCreator.procesoMaltratoPorcentajeIndicenciaEmpaque]));
          postcosechaPadreId: node[DatabaseCreator.postcosechaPadreId],
          postcosechaId: node[DatabaseCreator.postcosechaId],
          variedadId: node[DatabaseCreator.variedadId],
          procesoMaltratoTallosMuestreadoRecepcion: node[DatabaseCreator.procesoMaltratoTallosMuestreadoRecepcion],
          procesoMaltratoTallosMaltratoRecepcion: node[DatabaseCreator.procesoMaltratoTallosMaltratoRecepcion],
          procesoMaltratoPorcentajeIndicenciaRecepcion: node[DatabaseCreator.procesoMaltratoPorcentajeIndicenciaRecepcion],
          procesoMaltratoTallosMuestreadoBoncheo: node[DatabaseCreator.procesoMaltratoTallosMuestreadoBoncheo],
          procesoMaltratoTallosMaltratoBoncheo: node[DatabaseCreator.procesoMaltratoTallosMaltratoBoncheo],
          procesoMaltratoPorcentajeIndicenciaBoncheo: node[DatabaseCreator.procesoMaltratoPorcentajeIndicenciaBoncheo],
          procesoMaltratoTallosMuestreadoCuartoFrio: node[DatabaseCreator.procesoMaltratoTallosMuestreadoCuartoFrio],
          procesoMaltratoTallosMaltratoCuartoFrio: node[DatabaseCreator.procesoMaltratoTallosMaltratoCuartoFrio],
          procesoMaltratoPorcentajeIndicenciaCuartoFrio: node[DatabaseCreator.procesoMaltratoPorcentajeIndicenciaCuartoFrio],
          procesoMaltratoTallosMuestreadoEmpaque: node[DatabaseCreator.procesoMaltratoTallosMuestreadoEmpaque],
          procesoMaltratoTallosMaltratoEmpaque: node[DatabaseCreator.procesoMaltratoTallosMaltratoEmpaque],
          procesoMaltratoPorcentajeIndicenciaEmpaque: node[DatabaseCreator.procesoMaltratoPorcentajeIndicenciaEmpaque]

        ));
      }
    } catch (ex) {
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
}
//falta nombre de la finca y subfinca