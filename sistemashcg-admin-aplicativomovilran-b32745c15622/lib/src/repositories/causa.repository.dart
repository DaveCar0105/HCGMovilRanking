import 'package:ranking_app/src/constant.dart';
import 'package:ranking_app/src/database-creator.dart';
import 'package:ranking_app/src/dtos/causa.dto.dart';
import 'package:ranking_app/src/repositories/error.repository.dart';

import '../dtos/generic.dto.dart';

class CausaRepository {
  final ErrorRepository _errorRepository;
  final moduloRepository = 'Causa ';

  CausaRepository(this._errorRepository);

  Future<bool> insert(CausaDto causaDto) async {
    final sql = '''INSERT INTO ${DatabaseCreator.causaTable}(
        ${DatabaseCreator.causaId},
        ${DatabaseCreator.causaNombre},
        ${DatabaseCreator.causaEstado}
      ) 
      VALUES (
        ${causaDto.causaId},
        '${causaDto.causaNombre}',
        ${causaDto.causaEstado}
      )''';
    int id = await db.rawInsert(sql);
    return id > 0 ? true : false;
  }

  Future<List<CausaDto>> selectAll() async {
    List<CausaDto> causasDto = [];
    try {
      final sql = '''SELECT * FROM ${DatabaseCreator.causaTable} 
      WHERE ${DatabaseCreator.causaEstado} = ${ConstantDatabase.DB_COLUMN_ESTADO_DEAULT_ACTVIO}''';
      final data = await db.rawQuery(sql);
      for (final node in data) {
        causasDto.add(new CausaDto(
            causaId: node[DatabaseCreator.causaId],
            causaNombre: node[DatabaseCreator.causaNombre]));
      }
    } catch (ex) {
      await this
          ._errorRepository
          .addErrorWithDetalle(moduloRepository, ex.toString());
    }
    return causasDto;
  }

  Future<List<GenericDto>> selectAllGeneric() async {
    List<GenericDto> causasDto = [];
    try {
      final sql = '''SELECT * FROM ${DatabaseCreator.causaTable} 
      WHERE ${DatabaseCreator.causaEstado} = ${ConstantDatabase.DB_COLUMN_ESTADO_DEAULT_ACTVIO}''';
      final data = await db.rawQuery(sql);
      for (final node in data) {
        causasDto.add(new GenericDto(
            id: node[DatabaseCreator.causaId],
            nombre: node[DatabaseCreator.causaNombre]));
      }
    } catch (ex) {
      await this
          ._errorRepository
          .addErrorWithDetalle(moduloRepository, ex.toString());
    }
    return causasDto;
  }

  Future<bool> update(CausaDto causaDto) async {
    try {
      final sql = '''UPDATE ${DatabaseCreator.causaTable}
      SET ${DatabaseCreator.causaNombre} = '${causaDto.causaNombre}',
      ${DatabaseCreator.causaEstado} = ${causaDto.causaEstado} 
      WHERE ${DatabaseCreator.causaId} == ${causaDto.causaId}
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
      final sqlH = 'DELETE FROM ${DatabaseCreator.causaTable}';
      await db.rawDelete(sqlH);
    } catch (ex) {
      await this
          ._errorRepository
          .addErrorWithDetalle(moduloRepository, ex.toString());
    }
  }

  Future<void> deleteById(int id) async {
    try {
      final sqlH = '''DELETE FROM ${DatabaseCreator.causaTable} 
      WHERE ${DatabaseCreator.causaId} == ${id}''';
      await db.rawDelete(sqlH);
    } catch (ex) {
      await this
          ._errorRepository
          .addErrorWithDetalle(moduloRepository, ex.toString());
    }
  }
}
