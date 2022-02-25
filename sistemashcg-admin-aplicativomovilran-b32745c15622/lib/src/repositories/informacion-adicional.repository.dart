


import 'package:ranking_app/src/constant.dart';
import 'package:ranking_app/src/database-creator.dart';
import 'package:ranking_app/src/dtos/generic.dto.dart';
import 'package:ranking_app/src/dtos/info-adic.dto.dart';
import 'package:ranking_app/src/repositories/error.repository.dart';

class InformacionAdicionalRepository{

final ErrorRepository _errorRepository;
final moduloRepository ='InformacionAdicional';
InformacionAdicionalRepository(this._errorRepository);


Future<bool> insert(InformacionAdicionalDto informacionAdicionalDto)async{
  final sql =''' INSERT INTO ${DatabaseCreator.informacionAuditoriaTable}(
    ${DatabaseCreator.usuarioId},
    ${DatabaseCreator.informacionAuditoriaId},
    ${DatabaseCreator.informacionAuditoriaFecha},
    ${DatabaseCreator.postcosechaPadreId},
    ${DatabaseCreator.postcosechaId},
    ${DatabaseCreator.informacionAuditoriaPromedioSala},
    ${DatabaseCreator.informacionAuditoriaPromedioBoncheo},
    ${DatabaseCreator.informacionAuditoriaPromedioCorte},
    ${DatabaseCreator.informacionAuditoriaPromedioLargoFinca},
    ${DatabaseCreator.informacionAuditoriaPorcentajeFlorNacional},
    ${DatabaseCreator.causaId},
    ${DatabaseCreator.auditoriaCausaPorcentajeAfectacion},
    
  )
  VALUES(
    ${informacionAdicionalDto.usuarioId},
    ${informacionAdicionalDto.informacionAuditoriaId},
    '${informacionAdicionalDto.informacionAuditoriaFecha}',
    ${informacionAdicionalDto.postcosechaPadreId},
    ${informacionAdicionalDto.postcosechaId},
    ${informacionAdicionalDto.informacionAuditoriaPromedioSala},
    ${informacionAdicionalDto.informacionAuditoriaPromedioBoncheo},
    ${informacionAdicionalDto.informacionAuditoriaPromedioCorte},
    ${informacionAdicionalDto.informacionAuditoriaPromedioLargoFinca},
    ${informacionAdicionalDto.informacionAuditoriaPorcentajeFlorNacional},
    ${informacionAdicionalDto.causaId},
    ${informacionAdicionalDto.auditoriaCausaPorcentajeAfectacion},
    
  )''';
}
// ${DatabaseCreator.causaId},
//     ${DatabaseCreator.auditoriaCausaPorcentajeAfectacion},
//     ${DatabaseCreator.causaId},
//     ${DatabaseCreator.auditoriaCausaPorcentajeAfectacion},
//     ${DatabaseCreator.causaId},
//     ${DatabaseCreator.auditoriaCausaPorcentajeAfectacion},
//     ${DatabaseCreator.causaId},
//     ${DatabaseCreator.auditoriaCausaPorcentajeAfectacion}

// '${informacionAdicionalDto.causa2}',
//     ${informacionAdicionalDto.porcentajeAfectacionCausa2},
//     '${informacionAdicionalDto.causa3}',
//     ${informacionAdicionalDto.porcentajeAfectacionCausa3},
//     '${informacionAdicionalDto.causa4}',
//     ${informacionAdicionalDto.porcentajeAfectacionCausa4},
//     '${informacionAdicionalDto.causa5}',
//     ${informacionAdicionalDto.porcentajeAfectacionCausa5}

Future<List<InformacionAdicionalDto>> selectAll()async{
  List<InformacionAdicionalDto> informacionAdicionDto=[];
  try{
    final sql = ''' SELECT * FROM ${DatabaseCreator.informacionAuditoriaTable}
    WHERE ${DatabaseCreator.informacionAuditoriaEstado}=${ConstantDatabase.DB_COLUMN_ESTADO_DEAULT_ACTVIO}''';
    final data = await db.rawQuery(sql);
    for(final node in data){
      informacionAdicionDto.add(new InformacionAdicionalDto(
        usuarioId: node[DatabaseCreator.usuarioId],
        informacionAuditoriaId: node[DatabaseCreator.informacionAuditoriaId],
        informacionAuditoriaFecha: node[DatabaseCreator.informacionAuditoriaFecha],
       postcosechaPadreId: node[DatabaseCreator.postcosechaPadreId],
        postcosechaId: node[DatabaseCreator.postcosechaId],
        informacionAuditoriaPromedioSala: node[DatabaseCreator.informacionAuditoriaPromedioSala],
        informacionAuditoriaPromedioBoncheo: node[DatabaseCreator.informacionAuditoriaPromedioBoncheo],
        informacionAuditoriaPromedioCorte: node[DatabaseCreator.informacionAuditoriaPromedioCorte],
        informacionAuditoriaPromedioLargoFinca: node[DatabaseCreator.informacionAuditoriaPromedioLargoFinca],
        informacionAuditoriaPorcentajeFlorNacional: node[DatabaseCreator.informacionAuditoriaPorcentajeFlorNacional],
        causaId: node[DatabaseCreator.causaId],
        auditoriaCausaPorcentajeAfectacion: node[DatabaseCreator.auditoriaCausaPorcentajeAfectacion],
        // causa2: node[DatabaseCreator.causaId],
        // porcentajeAfectacionCausa2: node[DatabaseCreator.auditoriaCausaPorcentajeAfectacion],
        // causa3: node[DatabaseCreator.causaId],
        // porcentajeAfectacionCausa3: node[DatabaseCreator.auditoriaCausaPorcentajeAfectacion],
        // causa4: node[DatabaseCreator.causaId],
        // porcentajeAfectacionCausa4: node[DatabaseCreator.auditoriaCausaPorcentajeAfectacion],
        // causa5: node[DatabaseCreator.causaId],
        // porcentajeAfectacionCausa5: node[DatabaseCreator.auditoriaCausaPorcentajeAfectacion]
      ));
      
    }

  }catch(ex){
    await this
          ._errorRepository
          .addErrorWithDetalle(moduloRepository, ex.toString());
  }
  return informacionAdicionDto;
}

Future<List<GenericDto>> selectAllGeneric()async{
  List<GenericDto> informacionAdicionalDto=[];
  try{
    final sql=''' SELECT * FROM ${DatabaseCreator.informacionAuditoriaTable}
    WHERE ${DatabaseCreator.informacionAuditoriaEstado}=${ConstantDatabase.DB_COLUMN_ESTADO_DEAULT_ACTVIO}''';
    final data =await db.rawQuery(sql);
    for(final node in data){
      informacionAdicionalDto.add(new GenericDto(
        id: node[DatabaseCreator.informacionAuditoriaId]
        //nombre: node[DatabaseCreator.informacionAuditoriaId]
      ));
    }

  }catch(ex){
    await this
          ._errorRepository
          .addErrorWithDetalle(moduloRepository, ex.toString());
  }
  return informacionAdicionalDto;
}

}