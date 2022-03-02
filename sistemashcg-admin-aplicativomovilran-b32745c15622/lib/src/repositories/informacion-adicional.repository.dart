import 'package:ranking_app/src/constant.dart';
import 'package:ranking_app/src/database-creator.dart';
import 'package:ranking_app/src/dtos/generic.dto.dart';
import 'package:ranking_app/src/dtos/info-adic.dto.dart';
import 'package:ranking_app/src/repositories/error.repository.dart';

class InformacionAdicionalRepository {
  final ErrorRepository _errorRepository;
  final moduloRepository = 'InformacionAdicional';
  InformacionAdicionalRepository(this._errorRepository);

  Future<bool> insert(InformacionAdicionalDto informacionAdicionalDto) async {
    final sql = ''' INSERT INTO ${DatabaseCreator.informacionAuditoriaTable}(
    ${DatabaseCreator.usuarioId},
    ${DatabaseCreator.informacionAuditoriaFecha},
    ${DatabaseCreator.informacionAuditoriaPromedioSala},
    ${DatabaseCreator.informacionAuditoriaPromedioBoncheo},
    ${DatabaseCreator.informacionAuditoriaPromedioCorte},
    ${DatabaseCreator.informacionAuditoriaPromedioLargoFinca},
    ${DatabaseCreator.informacionAuditoriaPorcentajeFlorNacional},
    ${DatabaseCreator.postcosechaId},
    ${DatabaseCreator.informacionAuditoriaEstado}
  )
  VALUES(
    ${informacionAdicionalDto.usuarioId},
    '${informacionAdicionalDto.informacionAuditoriaFecha}',
    ${informacionAdicionalDto.informacionAuditoriaPromedioSala},
    ${informacionAdicionalDto.informacionAuditoriaPromedioBoncheo},
    ${informacionAdicionalDto.informacionAuditoriaPromedioCorte},
    ${informacionAdicionalDto.informacionAuditoriaPromedioLargoFinca},
    ${informacionAdicionalDto.informacionAuditoriaPorcentajeFlorNacional},
    ${informacionAdicionalDto.postcosechaId},
    ${ConstantDatabase.DB_COLUMN_ESTADO_DEAULT_ACTVIO}
  )''';
    int id = await db.rawInsert(sql);
    if(id>0){
      await insertCausaInformacion(informacionAdicionalDto.causaId, informacionAdicionalDto.porcentajeAfectacionCausa1, id);
      await insertCausaInformacion(informacionAdicionalDto.causa2, informacionAdicionalDto.porcentajeAfectacionCausa2, id);
      await insertCausaInformacion(informacionAdicionalDto.causa3, informacionAdicionalDto.porcentajeAfectacionCausa3, id);
      await insertCausaInformacion(informacionAdicionalDto.causa4, informacionAdicionalDto.porcentajeAfectacionCausa4, id);
      await insertCausaInformacion(informacionAdicionalDto.causa5, informacionAdicionalDto.porcentajeAfectacionCausa5, id);
    }
    return id > 0 ? true : false;
  }

  Future<int> insertCausaInformacion(int causa,num porcentaje,int id1) async{
    final sql = ''' INSERT INTO ${DatabaseCreator.auditoriaCausaTable}(
    ${DatabaseCreator.causaId},
    ${DatabaseCreator.auditoriaCausaPorcentajeAfectacion},
    ${DatabaseCreator.informacionAuditoriaId}
  )
  VALUES(
    ${causa},
    ${porcentaje},
   ${id1}
  )''';
    int id = await db.rawInsert(sql);
    return id;
  }

  Future<List<InformacionAdicionalDto>> selectAll() async {
    List<InformacionAdicionalDto> informacionAdicionDto = [];
    try {
      final sql = ''' SELECT * FROM ${DatabaseCreator.informacionAuditoriaTable}''';
      final data = await db.rawQuery(sql);
      for (final node in data) {
        informacionAdicionDto.add(new InformacionAdicionalDto.fromJson(node));
      }
      print(informacionAdicionDto);
    } catch (ex) {
      await this
          ._errorRepository
          .addErrorWithDetalle(moduloRepository, ex.toString());
    }
    return informacionAdicionDto;
  }

  Future<List<GenericDto>> selectAllGeneric() async {
    List<GenericDto> informacionAdicionalDto = [];
    try {
      final sql = ''' SELECT * FROM ${DatabaseCreator.informacionAuditoriaTable}
    WHERE ${DatabaseCreator.informacionAuditoriaEstado}=${ConstantDatabase.DB_COLUMN_ESTADO_DEAULT_ACTVIO}''';
      final data = await db.rawQuery(sql);
      for (final node in data) {
        informacionAdicionalDto
            .add(new GenericDto(id: node[DatabaseCreator.informacionAuditoriaId]
                //nombre: node[DatabaseCreator.informacionAuditoriaId]
                ));
      }
    } catch (ex) {
      await this
          ._errorRepository
          .addErrorWithDetalle(moduloRepository, ex.toString());
    }
    return informacionAdicionalDto;
  }

  Future<void> delete() async {
    try {
      final sqlH = 'DELETE FROM ${DatabaseCreator.informacionAuditoriaTable}';
      await db.rawDelete(sqlH);
    } catch (ex) {
      await this
          ._errorRepository
          .addErrorWithDetalle(moduloRepository, ex.toString());
    }
  }
}
