import 'package:ranking_app/src/constant.dart';
import 'package:ranking_app/src/database-creator.dart';
import 'package:ranking_app/src/dtos/generic.dto.dart';
import 'package:ranking_app/src/dtos/variedad.dto.dart';
import 'package:ranking_app/src/repositories/error.repository.dart';

class VariedadRepository {
  final ErrorRepository _errorRepository;
  final moduloRepository = 'Variedad ';

  VariedadRepository(this._errorRepository);

  Future<bool> insert(VariedadDto variedadDto) async {
    final sql = '''INSERT INTO ${DatabaseCreator.variedadTable}(
        ${DatabaseCreator.variedadId},
        ${DatabaseCreator.variedadNombre},
        ${DatabaseCreator.variedadEstado}
      ) 
      VALUES (
        ${variedadDto.variedadId},
        '${variedadDto.variedadNombre}',
        ${variedadDto.variedadEstado}
      )''';
    int id = await db.rawInsert(sql);
    return id > 0 ? true : false;
  }

  Future<List<VariedadDto>> selectAll() async {
    List<VariedadDto> variedadesDto = [];
    try {
      final sql = '''SELECT * FROM ${DatabaseCreator.variedadTable} 
      WHERE ${DatabaseCreator.variedadEstado} = ${ConstantDatabase.DB_COLUMN_ESTADO_DEAULT_ACTVIO}''';
      final data = await db.rawQuery(sql);
      for (final node in data) {
        variedadesDto.add(new VariedadDto(
            variedadId: node[DatabaseCreator.variedadId],
            variedadNombre: node[DatabaseCreator.variedadNombre]));
      }
    } catch (ex) {
      await this
          ._errorRepository
          .addErrorWithDetalle(moduloRepository, ex.toString());
    }
    return variedadesDto;
  }

  Future<List<GenericDto>> selectAllGeneric() async {
    List<GenericDto> variedadesDto = [];
    try {
      final sql = '''SELECT * FROM ${DatabaseCreator.variedadTable} 
      WHERE ${DatabaseCreator.variedadEstado} = ${ConstantDatabase.DB_COLUMN_ESTADO_DEAULT_ACTVIO}''';
      final data = await db.rawQuery(sql);
      for (final node in data) {
        variedadesDto.add(new GenericDto(
            id: node[DatabaseCreator.variedadId],
            nombre: node[DatabaseCreator.variedadNombre]));
      }
    } catch (ex) {
      await this
          ._errorRepository
          .addErrorWithDetalle(moduloRepository, ex.toString());
    }
    return variedadesDto;
  }

  Future<List<VariedadDto>> selectAllByProductoId(int idProducto) async {
    List<VariedadDto> variedadesDto = [];
    try {
      final sql = '''SELECT * FROM ${DatabaseCreator.variedadTable} 
      WHERE ${DatabaseCreator.variedadEstado} = $ConstantDatabase.DB_COLUMN_ESTADO_DEAULT_ACTVIO 
      and ${DatabaseCreator.productoId} = ${idProducto} ''';
      final data = await db.rawQuery(sql);
      for (final node in data) {
        variedadesDto.add(new VariedadDto(
            variedadId: node[DatabaseCreator.variedadNombre],
            variedadNombre: node[DatabaseCreator.variedadEstado]));
      }
    } catch (ex) {
      await this
          ._errorRepository
          .addErrorWithDetalle(moduloRepository, ex.toString());
    }
    return variedadesDto;
  }

  Future<bool> update(VariedadDto variedadDto) async {
    try {
      final sql = '''UPDATE ${DatabaseCreator.variedadTable}
      SET ${DatabaseCreator.variedadNombre} = '${variedadDto.variedadNombre}',
      ${DatabaseCreator.variedadEstado} = ${variedadDto.variedadEstado} 
      WHERE ${DatabaseCreator.variedadId} == ${variedadDto.variedadId}
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
      final sqlH = 'DELETE FROM ${DatabaseCreator.variedadTable}';
      await db.rawDelete(sqlH);
    } catch (ex) {
      await this
          ._errorRepository
          .addErrorWithDetalle(moduloRepository, ex.toString());
    }
  }

  Future<void> deleteById(int id) async {
    try {
      final sqlH = '''DELETE FROM ${DatabaseCreator.variedadTable} 
      WHERE ${DatabaseCreator.variedadId} == ${id}''';
      await db.rawDelete(sqlH);
    } catch (ex) {
      await this
          ._errorRepository
          .addErrorWithDetalle(moduloRepository, ex.toString());
    }
  }
}
