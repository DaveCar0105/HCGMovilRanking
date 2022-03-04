
import 'package:ranking_app/src/constant.dart';
import 'package:ranking_app/src/database-creator.dart';
import 'package:ranking_app/src/dtos/auditoria-agencia-parse.dart';
import 'package:ranking_app/src/repositories/error.repository.dart';

class AuditoriaAgenciaDetalleRepository{
  final ErrorRepository _errorRepository;
  final moduloRepository = 'EvaluacionFinca';

  AuditoriaAgenciaDetalleRepository(this._errorRepository);

  Future<bool> insert(AuditoriaAgenciaParseDetalleDto auditoriaAgenciaParseDetalleDto)async {

    final sql ='''INSERT INTO ${DatabaseCreator.auditoriaDetalleTable}(

    ${DatabaseCreator.gradoVariedadAgencia},
    ${DatabaseCreator.tallosPorRamoAgencia},
    ${DatabaseCreator.variedadId}
    )VALUES(
      ${auditoriaAgenciaParseDetalleDto.gradoVariedadAgencia},
      ${auditoriaAgenciaParseDetalleDto.tallosPorRamoAgencia},
      ${auditoriaAgenciaParseDetalleDto.variedadId},
      ${ConstantDatabase.DB_COLUMN_ESTADO_DEAULT_ACTVIO}

    )''';

    int id = await db.rawInsert(sql);
    return id > 0 ? true: false;
  }

  Future<List<AuditoriaAgenciaParseDetalleDto>> selectAll()async{
    List<AuditoriaAgenciaParseDetalleDto> auditoriaAgenciaParseDetalleDto=[];
    try{
     final sql =''' SELECT * FROM ${DatabaseCreator.auditoriaDetalleTable}=${ConstantDatabase.DB_COLUMN_ESTADO_DEAULT_ACTVIO};''';
     final data = await db.rawQuery(sql);
     for(final node in data){
       var dto = AuditoriaAgenciaParseDetalleDto.fromJson(node);
       auditoriaAgenciaParseDetalleDto.add(dto);
     }
    }catch(ex){
      print("asd"+ex);
    }
    return auditoriaAgenciaParseDetalleDto;
  }
}