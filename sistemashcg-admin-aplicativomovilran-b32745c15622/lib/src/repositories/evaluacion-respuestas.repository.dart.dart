


import 'package:ranking_app/src/constant.dart';
import 'package:ranking_app/src/database-creator.dart';
import 'package:ranking_app/src/dtos/evaluacion-finca-parse.dto.dart';
import 'package:ranking_app/src/repositories/error.repository.dart';

class EvaluacionRespuestasRepository{
  final ErrorRepository _errorRepository;
  final moduloRepository = 'evaluacionRespuestas';

  EvaluacionRespuestasRepository(this._errorRepository);
  Future<bool> insert(EvaluacionFincaParseRespuestaDto evaluacionFincaParseRespuestaDto)async{

    final sql= ''' INSERT INTO ${DatabaseCreator.evaluacionRespuestasTable}(
     ${DatabaseCreator.itemId},
     ${DatabaseCreator.cantidadRespuesta},
     ${DatabaseCreator.totalRespuesta}
    )VALUES(
    ${evaluacionFincaParseRespuestaDto.itemId},
    ${evaluacionFincaParseRespuestaDto.cantidadRespuesta},
    ${evaluacionFincaParseRespuestaDto.totalRespuesta},
    ${ConstantDatabase.DB_COLUMN_ESTADO_DEAULT_ACTVIO}
    )''';
    int id = await db.rawInsert(sql);
    return id >0? true: false;
  }

    Future<List<EvaluacionFincaParseRespuestaDto>> selectAll()async{
    List<EvaluacionFincaParseRespuestaDto> evaluacionFincaParseRespuestaDto=[];
    try{
     final sql ='''SELECT * FROM ${DatabaseCreator.evaluacionDetalleTable}=${ConstantDatabase.DB_COLUMN_ESTADO_DEAULT_ACTVIO};''';
     final data = await db.rawQuery(sql);
     for(final node in data){
       var dto = EvaluacionFincaParseRespuestaDto.fromJson(node);
       evaluacionFincaParseRespuestaDto.add(dto);
     }
    }catch(ex){
     print("asd"+ ex);
    }
    return evaluacionFincaParseRespuestaDto;
  }
}