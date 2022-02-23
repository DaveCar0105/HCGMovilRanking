


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
    ${DatabaseCreator.postcosechaPadreId},${DatabaseCreator.postcosechaId},${DatabaseCreator.informacionAuditoriaPromedioSala},
    ${DatabaseCreator.informacionAuditoriaPromedioBoncheo},${DatabaseCreator.informacionAuditoriaPromedioCorte},
    ${DatabaseCreator.informacionAuditoriaPromedioLargoFinca},${DatabaseCreator.informacionAuditoriaPorcentajeFlorNacional},
    ${DatabaseCreator.causaId},${DatabaseCreator.auditoriaCausaPorcentajeAfectacion},
    ${DatabaseCreator.causaId},${DatabaseCreator.auditoriaCausaPorcentajeAfectacion},
    ${DatabaseCreator.causaId},${DatabaseCreator.auditoriaCausaPorcentajeAfectacion},
    ${DatabaseCreator.causaId},${DatabaseCreator.auditoriaCausaPorcentajeAfectacion},
    ${DatabaseCreator.causaId},${DatabaseCreator.auditoriaCausaPorcentajeAfectacion}
  )
  VALUES(
    '${informacionAdicionalDto.nombreFinca}','${informacionAdicionalDto.nombreSubFinca}',
    ${informacionAdicionalDto.rendimientoSala},${informacionAdicionalDto.rendimientoBoncheo},
    ${informacionAdicionalDto.rendimientoCorte},${informacionAdicionalDto.rendimientoCorte},
    ${informacionAdicionalDto.rendimientoFinca},${informacionAdicionalDto.porcentajeFlorNacional},
    '${informacionAdicionalDto.causa1}',${informacionAdicionalDto.porcentajeAfectacionCausa1},
    '${informacionAdicionalDto.causa2}',${informacionAdicionalDto.porcentajeAfectacionCausa2},
    '${informacionAdicionalDto.causa3}',${informacionAdicionalDto.porcentajeAfectacionCausa3},
    '${informacionAdicionalDto.causa4}',${informacionAdicionalDto.porcentajeAfectacionCausa4},
    '${informacionAdicionalDto.causa5}',${informacionAdicionalDto.porcentajeAfectacionCausa5}
  )''';
}

Future<List<InformacionAdicionalDto>> selectAll()async{
  List<InformacionAdicionalDto> informacionAdicionDto=[];
  try{
    final sql = ''' SELECT * FROM ${DatabaseCreator.informacionAuditoriaTable}
    WHERE ${DatabaseCreator.informacionAuditoriaEstado}=${ConstantDatabase.DB_COLUMN_ESTADO_DEAULT_ACTVIO}''';
    final data = await db.rawQuery(sql);
    for(final node in data){
      informacionAdicionDto.add(new InformacionAdicionalDto(
        nombreFinca: node[DatabaseCreator.postcosechaPadreId].toString(),
        nombreSubFinca: node[DatabaseCreator.postcosechaId].toString(),
        rendimientoSala: node[DatabaseCreator.informacionAuditoriaPromedioSala],
        rendimientoBoncheo: node[DatabaseCreator.informacionAuditoriaPromedioBoncheo],
        rendimientoCorte: node[DatabaseCreator.informacionAuditoriaPromedioCorte],
        rendimientoFinca: node[DatabaseCreator.informacionAuditoriaPromedioLargoFinca],
        porcentajeFlorNacional: node[DatabaseCreator.informacionAuditoriaPorcentajeFlorNacional],
        causa1: node[DatabaseCreator.causaId],
        porcentajeAfectacionCausa1: node[DatabaseCreator.auditoriaCausaPorcentajeAfectacion],
        causa2: node[DatabaseCreator.causaId],
        porcentajeAfectacionCausa2: node[DatabaseCreator.auditoriaCausaPorcentajeAfectacion],
        causa3: node[DatabaseCreator.causaId],
        porcentajeAfectacionCausa3: node[DatabaseCreator.auditoriaCausaPorcentajeAfectacion],
        causa4: node[DatabaseCreator.causaId],
        porcentajeAfectacionCausa4: node[DatabaseCreator.auditoriaCausaPorcentajeAfectacion],
        causa5: node[DatabaseCreator.causaId],
        porcentajeAfectacionCausa5: node[DatabaseCreator.auditoriaCausaPorcentajeAfectacion]
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