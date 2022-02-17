import 'package:ranking_app/src/constant.dart';
import 'package:ranking_app/src/database-creator.dart';
import 'package:ranking_app/src/dtos/carguera.dto.dart';
import 'package:ranking_app/src/repositories/error.repository.dart';

class CargueraRepository {
  final ErrorRepository _errorRepository;
  final moduloRepository = 'Carguera ';

  CargueraRepository(this._errorRepository);

  Future<bool> insert(CargueraDto cargueraDto) async {
    final sql = '''INSERT INTO ${DatabaseCreator.cargueraTable}(
        ${DatabaseCreator.cargueraId},
        ${DatabaseCreator.cargueraNombre},
        ${DatabaseCreator.cargueraEstado}
      ) 
      VALUES (
        ${cargueraDto.cargueraId},
        '${cargueraDto.cargueraNombre}',
        ${cargueraDto.cargueraEstado}
      )''';
    int id = await db.rawInsert(sql);
    return id > 0 ? true : false;
  }

  Future<List<CargueraDto>> selectAll() async {
    List<CargueraDto> carguerasDto = List();
    try {
      final sql = '''SELECT * FROM ${DatabaseCreator.cargueraTable} 
      WHERE ${DatabaseCreator.cargueraEstado} = ${ConstantDatabase.DB_COLUMN_ESTADO_DEAULT_ACTVIO};''';
      final data = await db.rawQuery(sql);
      for (final node in data) {
        carguerasDto.add(new CargueraDto(
            cargueraId: node[DatabaseCreator.cargueraId],
            cargueraNombre: node[DatabaseCreator.cargueraNombre]));
      }
    } catch (ex) {
      await this
          ._errorRepository
          .addErrorWithDetalle(moduloRepository, ex.toString());
    }
    return carguerasDto;
  }

  Future<bool> update(CargueraDto cargueraDto) async {
    try {
      final sql = '''UPDATE ${DatabaseCreator.cargueraTable}
      SET ${DatabaseCreator.cargueraNombre} = '${cargueraDto.cargueraNombre}',
      ${DatabaseCreator.cargueraEstado} = ${cargueraDto.cargueraEstado} 
      WHERE ${DatabaseCreator.cargueraId} == ${cargueraDto.cargueraId}
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
      final sqlH = 'DELETE FROM ${DatabaseCreator.cargueraTable}';
      await db.rawDelete(sqlH);
    } catch (ex) {
      await this
          ._errorRepository
          .addErrorWithDetalle(moduloRepository, ex.toString());
    }
  }

  Future<void> deleteById(int id) async {
    try {
      final sqlH = '''DELETE FROM ${DatabaseCreator.cargueraTable} 
      WHERE ${DatabaseCreator.cargueraId} == ${id}''';
      await db.rawDelete(sqlH);
    } catch (ex) {
      await this
          ._errorRepository
          .addErrorWithDetalle(moduloRepository, ex.toString());
    }
  }
}
