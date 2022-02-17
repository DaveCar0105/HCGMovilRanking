import 'package:ranking_app/src/constant.dart';
import 'package:ranking_app/src/database-creator.dart';
import 'package:ranking_app/src/dtos/pais.dto.dart';
import 'package:ranking_app/src/repositories/error.repository.dart';

class PaisRepository {
  final ErrorRepository _errorRepository;
  final moduloRepository = 'Pais ';

  PaisRepository(this._errorRepository);

  Future<bool> insert(PaisDto paisDto) async {
    final sql = '''INSERT INTO ${DatabaseCreator.paisTable}(
        ${DatabaseCreator.paisId},
        ${DatabaseCreator.paisNombre},
        ${DatabaseCreator.paisEstado}
      ) 
      VALUES (
        ${paisDto.paisId},
        '${paisDto.paisNombre}',
        ${paisDto.paisEstado}
      )''';
    int id = await db.rawInsert(sql);
    return id > 0 ? true : false;
  }

  Future<List<PaisDto>> selectAll() async {
    List<PaisDto> paisesDto = List();
    try {
      final sql = '''SELECT * FROM ${DatabaseCreator.paisTable} 
      WHERE ${DatabaseCreator.paisEstado} = ${ConstantDatabase.DB_COLUMN_ESTADO_DEAULT_ACTVIO}''';
      final data = await db.rawQuery(sql);
      for (final node in data) {
        paisesDto.add(new PaisDto(
            paisId: node[DatabaseCreator.paisId],
            paisNombre: node[DatabaseCreator.paisNombre]));
      }
    } catch (ex) {
      await this
          ._errorRepository
          .addErrorWithDetalle(moduloRepository, ex.toString());
    }
    return paisesDto;
  }

  Future<bool> update(PaisDto paisDto) async {
    try {
      final sql = '''UPDATE ${DatabaseCreator.paisTable}
      SET ${DatabaseCreator.paisNombre} = '${paisDto.paisNombre}',
      ${DatabaseCreator.paisEstado} = ${paisDto.paisEstado} 
      WHERE ${DatabaseCreator.paisId} == ${paisDto.paisId}
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
      final sqlH = 'DELETE FROM ${DatabaseCreator.paisTable}';
      await db.rawDelete(sqlH);
    } catch (ex) {
      await this
          ._errorRepository
          .addErrorWithDetalle(moduloRepository, ex.toString());
    }
  }

  Future<void> deleteById(int id) async {
    try {
      final sqlH = '''DELETE FROM ${DatabaseCreator.paisTable} 
      WHERE ${DatabaseCreator.paisId} == ${id}''';
      await db.rawDelete(sqlH);
    } catch (ex) {
      await this
          ._errorRepository
          .addErrorWithDetalle(moduloRepository, ex.toString());
    }
  }
}
