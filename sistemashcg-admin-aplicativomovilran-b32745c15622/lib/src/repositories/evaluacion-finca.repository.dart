


import 'package:ranking_app/src/constant.dart';
import 'package:ranking_app/src/database-creator.dart';
import 'package:ranking_app/src/dtos/evaluacion-finca-parse.dto.dart';
import 'package:ranking_app/src/repositories/error.repository.dart';
import 'package:sqflite/sqflite.dart';

class EvaluacionFincaRepository{
  final ErrorRepository _errorRepository;
  final moduloRepository = 'EvaluacionFinca';

  EvaluacionFincaRepository(this._errorRepository);

  Future<bool> insert(EvaluacionFincaParseDto evaluacionFincaParseDto)async {

    final sql ='''INSERT INTO ${DatabaseCreator.evaluacionFincaTable}(

    ${DatabaseCreator.fechaAuditoria},
    ${DatabaseCreator.tipoEvaluacion},
    ${DatabaseCreator.postcosechaId},
    ${DatabaseCreator.usuarioId}
    )VALUES(
      '${evaluacionFincaParseDto.fechaAuditoria}',
      ${evaluacionFincaParseDto.tipoEvaluacion},
      ${evaluacionFincaParseDto.postcosechaId},
      ${evaluacionFincaParseDto.usuarioId},
      ${ConstantDatabase.DB_COLUMN_ESTADO_DEAULT_ACTVIO}

    )''';

    int id = await db.rawInsert(sql);
    return id > 0 ? true: false;
  }

  Future<List<EvaluacionFincaParseDto>> selectAll()async{
    List<EvaluacionFincaParseDto> evaluacionFincaPaserDto=[];
    try{
     final sql =''' SELECT * FROM ${DatabaseCreator.evaluacionFincaTable}=${ConstantDatabase.DB_COLUMN_ESTADO_DEAULT_ACTVIO};''';
     final data = await db.rawQuery(sql);
     for(final node in data){
       var dto = EvaluacionFincaParseDto.fromJson(node);
       evaluacionFincaPaserDto.add(dto);
     }
    }catch(ex){
      print("asd"+ex);
    }
    return evaluacionFincaPaserDto;
  }
}