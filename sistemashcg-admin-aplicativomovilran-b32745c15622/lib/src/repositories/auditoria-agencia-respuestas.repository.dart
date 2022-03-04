
import 'package:ranking_app/src/constant.dart';
import 'package:ranking_app/src/database-creator.dart';
import 'package:ranking_app/src/dtos/auditoria-agencia-parse.dart';
import 'package:ranking_app/src/repositories/error.repository.dart';

class AuditoriaAgenciaRespuestasRepository{
  final ErrorRepository _errorRepository;
  final moduloRepository = 'EvaluacionFinca';

  AuditoriaAgenciaRespuestasRepository(this._errorRepository);

  Future<bool> insert(AuditoriaAgenciaParseRespuestaDto auditoriaAgenciaParseRespuestaDto)async {

    final sql ='''INSERT INTO ${DatabaseCreator.auditoriaRespuestasTable}(

    ${DatabaseCreator.auditoriaItemId},
    ${DatabaseCreator.auditoriaCatindadRespuesta},
    ${DatabaseCreator.auditoriaTotalRespuesta}
    )VALUES(
      ${auditoriaAgenciaParseRespuestaDto.auditoriaItemId},
      ${auditoriaAgenciaParseRespuestaDto.auditoriaCatindadRespuesta},
      ${auditoriaAgenciaParseRespuestaDto.auditoriaTotalRespuesta},
      ${ConstantDatabase.DB_COLUMN_ESTADO_DEAULT_ACTVIO}

    )''';

    int id = await db.rawInsert(sql);
    return id > 0 ? true: false;
  }

  Future<List<AuditoriaAgenciaParseRespuestaDto>> selectAll()async{
    List<AuditoriaAgenciaParseRespuestaDto> auditoriaAgenciaParseRespuestaDto=[];
    try{
     final sql =''' SELECT * FROM ${DatabaseCreator.auditoriaRespuestasTable}=${ConstantDatabase.DB_COLUMN_ESTADO_DEAULT_ACTVIO};''';
     final data = await db.rawQuery(sql);
     for(final node in data){
       var dto = AuditoriaAgenciaParseRespuestaDto.fromJson(node);
       auditoriaAgenciaParseRespuestaDto.add(dto);
     }
    }catch(ex){
      print("asd"+ex);
    }
    return auditoriaAgenciaParseRespuestaDto;
  }
}