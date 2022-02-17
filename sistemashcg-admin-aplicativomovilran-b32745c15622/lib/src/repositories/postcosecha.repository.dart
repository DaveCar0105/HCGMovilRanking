import 'package:ranking_app/src/constant.dart';
import 'package:ranking_app/src/database-creator.dart';
import 'package:ranking_app/src/dtos/postcosecha.dto.dart';
import 'package:ranking_app/src/repositories/error.repository.dart';

class PostcosechaRepository {
  final ErrorRepository _errorRepository;
  final moduloRepository = 'Postcosecha ';

  PostcosechaRepository(this._errorRepository);

  Future<bool> insert(PostcosechaDto postcosechaDto) async {
    final sql = '''INSERT INTO ${DatabaseCreator.postcosechaTable}(
        ${DatabaseCreator.postcosechaId},
        ${DatabaseCreator.postcosechaNombre},
        ${DatabaseCreator.postcosechaEstado},
        ${DatabaseCreator.postcosechaPadreId}
      ) 
      VALUES (
        ${postcosechaDto.postcosechaId},
        '${postcosechaDto.postcosechaNombre}',
        ${postcosechaDto.postcosechaEstado},
        ${postcosechaDto.postcosechaPadreId}
      )''';
    int id = await db.rawInsert(sql);
    return id > 0 ? true : false;
  }

  Future<List<PostcosechaDto>> selectAll() async {
    List<PostcosechaDto> postcosechasDto = List();
    try {
      final sql = '''SELECT * FROM ${DatabaseCreator.postcosechaTable} 
      WHERE ${DatabaseCreator.postcosechaEstado} = ${ConstantDatabase.DB_COLUMN_ESTADO_DEAULT_ACTVIO}''';
      final data = await db.rawQuery(sql);
      for (final node in data) {
        postcosechasDto.add(new PostcosechaDto(
            postcosechaId: node[DatabaseCreator.postcosechaId],
            postcosechaPadreId: node[DatabaseCreator.postcosechaPadreId],
            postcosechaNombre: node[DatabaseCreator.postcosechaNombre]));
      }
    } catch (ex) {
      await this
          ._errorRepository
          .addErrorWithDetalle(moduloRepository, ex.toString());
    }
    return postcosechasDto;
  }

  Future<bool> update(PostcosechaDto postcosechaDto) async {
    try {
      final sql = '''UPDATE ${DatabaseCreator.postcosechaTable}
      SET ${DatabaseCreator.postcosechaNombre} = '${postcosechaDto.postcosechaNombre}',
      ${DatabaseCreator.postcosechaEstado} = ${postcosechaDto.postcosechaEstado}, 
      ${DatabaseCreator.postcosechaPadreId} = ${postcosechaDto.postcosechaPadreId}
      WHERE ${DatabaseCreator.postcosechaId} == ${postcosechaDto.postcosechaId}
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
      final sqlH = 'DELETE FROM ${DatabaseCreator.postcosechaTable}';
      await db.rawDelete(sqlH);
    } catch (ex) {
      await this
          ._errorRepository
          .addErrorWithDetalle(moduloRepository, ex.toString());
    }
  }

  Future<void> deleteById(int id) async {
    try {
      final sqlH = '''DELETE FROM ${DatabaseCreator.postcosechaTable} 
      WHERE ${DatabaseCreator.postcosechaId} == ${id}''';
      await db.rawDelete(sqlH);
    } catch (ex) {
      await this
          ._errorRepository
          .addErrorWithDetalle(moduloRepository, ex.toString());
    }
  }
}
