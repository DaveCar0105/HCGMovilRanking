
import 'package:ranking_app/src/constant.dart';
import 'package:ranking_app/src/database-creator.dart';
import 'package:ranking_app/src/dtos/auditoria-agencia-parse.dart';
import 'package:ranking_app/src/repositories/error.repository.dart';

class AuditoriaAgenciaRepository{
  final ErrorRepository _errorRepository;
  final moduloRepository = 'EvaluacionFinca';

  AuditoriaAgenciaRepository(this._errorRepository);

  Future<bool> insert(AuditoriaAgenciaParseDto auditoriaAgenciaParseDto)async {

    final sql ='''INSERT INTO ${DatabaseCreator.evaluacionFincaTable}(

    ${DatabaseCreator.fechaAuditoriaAgencia},
    ${DatabaseCreator.postcosechaId},
    ${DatabaseCreator.usuarioId}
    )VALUES(
      '${auditoriaAgenciaParseDto.fechaAuditoriaAgencia}',
      ${auditoriaAgenciaParseDto.postcosechaId},
      ${auditoriaAgenciaParseDto.usuarioId},
      ${ConstantDatabase.DB_COLUMN_ESTADO_DEAULT_ACTVIO}

    )''';

    int id = await db.rawInsert(sql);
    return id > 0 ? true: false;
  }

  Future<List<AuditoriaAgenciaParseDto>> selectAll()async{
    List<AuditoriaAgenciaParseDto> auditoriaAgenciaParseDto=[];
    try{
     final sql =''' SELECT * FROM ${DatabaseCreator.auditoriaAgenciaTable}=${ConstantDatabase.DB_COLUMN_ESTADO_DEAULT_ACTVIO};''';
     final data = await db.rawQuery(sql);
     for(final node in data){
       var dto = AuditoriaAgenciaParseDto.fromJson(node);
       auditoriaAgenciaParseDto.add(dto);
     }
    }catch(ex){
      print("asd"+ex);
    }
    return auditoriaAgenciaParseDto;
  }
}