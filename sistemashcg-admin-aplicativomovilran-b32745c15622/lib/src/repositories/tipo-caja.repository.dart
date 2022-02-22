import 'package:ranking_app/src/constant.dart';
import 'package:ranking_app/src/database-creator.dart';
import 'package:ranking_app/src/dtos/tipo-caja.dto.dart';
import 'package:ranking_app/src/repositories/error.repository.dart';

class TipoCajaRepository {
  final ErrorRepository _errorRepository;
  final moduloRepository = 'TipoCaja ';

  TipoCajaRepository(this._errorRepository);

  Future<bool> insert(TipoCajaDto tipoCajaDto) async {
    final sql = '''INSERT INTO ${DatabaseCreator.tipoCajaTable}(
        ${DatabaseCreator.tipoCajaId},
        ${DatabaseCreator.tipoCajaNombre},
        ${DatabaseCreator.tipoCajaEstado}
      ) 
      VALUES (
        ${tipoCajaDto.tipoCajaId},
        '${tipoCajaDto.tipoCajaNombre}',
        ${tipoCajaDto.tipoCajaEstado}
      )''';
    int id = await db.rawInsert(sql);
    return id > 0 ? true : false;
  }

  Future<List<TipoCajaDto>> selectAll() async {
    List<TipoCajaDto> tipoCajasDto = [];
    try {
      final sql = '''SELECT * FROM ${DatabaseCreator.tipoCajaTable} 
      WHERE ${DatabaseCreator.tipoCajaEstado} = ${ConstantDatabase.DB_COLUMN_ESTADO_DEAULT_ACTVIO}''';
      final data = await db.rawQuery(sql);
      for (final node in data) {
        tipoCajasDto.add(new TipoCajaDto(
            tipoCajaId: node[DatabaseCreator.tipoCajaId],
            tipoCajaNombre: node[DatabaseCreator.tipoCajaNombre]));
      }
    } catch (ex) {
      await this
          ._errorRepository
          .addErrorWithDetalle(moduloRepository, ex.toString());
    }
    return tipoCajasDto;
  }

  Future<bool> update(TipoCajaDto tipoCajaDto) async {
    try {
      final sql = '''UPDATE ${DatabaseCreator.tipoCajaTable}
      SET ${DatabaseCreator.tipoCajaNombre} = '${tipoCajaDto.tipoCajaNombre}',
      ${DatabaseCreator.tipoCajaEstado} = ${tipoCajaDto.tipoCajaEstado} 
      WHERE ${DatabaseCreator.tipoCajaId} == ${tipoCajaDto.tipoCajaId}
      ''';
      int id = await db.rawUpdate(sql);
      return id > 0 ? true : false;
    } catch (ex) {
      await this
          ._errorRepository
          .addErrorWithDetalle(moduloRepository, ex.toString());
      return false;
    }
  }

  Future<void> delete() async {
    try {
      final sqlH = 'DELETE FROM ${DatabaseCreator.tipoCajaTable}';
      await db.rawDelete(sqlH);
    } catch (ex) {
      await this
          ._errorRepository
          .addErrorWithDetalle(moduloRepository, ex.toString());
    }
  }

  Future<void> deleteById(int id) async {
    try {
      final sqlH = '''DELETE FROM ${DatabaseCreator.tipoCajaTable} 
      WHERE ${DatabaseCreator.tipoCajaId} == ${id}''';
      await db.rawDelete(sqlH);
    } catch (ex) {
      await this
          ._errorRepository
          .addErrorWithDetalle(moduloRepository, ex.toString());
    }
  }
}
