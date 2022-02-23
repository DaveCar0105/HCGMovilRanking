import 'package:ranking_app/src/constant.dart';
import 'package:ranking_app/src/database-creator.dart';
import 'package:ranking_app/src/dtos/generic.dto.dart';
import 'package:ranking_app/src/dtos/producto.dto.dart';
import 'package:ranking_app/src/repositories/error.repository.dart';

class ProductoRepository {
  final ErrorRepository _errorRepository;
  final moduloRepository = 'Producto ';

  ProductoRepository(this._errorRepository);

  Future<bool> insert(ProductoDto productoDto) async {
    final sql = '''INSERT INTO ${DatabaseCreator.productoTable}(
        ${DatabaseCreator.productoId},
        ${DatabaseCreator.productoNombre},
        ${DatabaseCreator.productoEstado}
      ) 
      VALUES (
        ${productoDto.productoId},
        '${productoDto.productoNombre}',
        ${productoDto.productoEstado}
      )''';
    int id = await db.rawInsert(sql);
    return id > 0 ? true : false;
  }

  Future<List<ProductoDto>> selectAll() async {
    List<ProductoDto> productosDto = [];
    try {
      final sql = '''SELECT * FROM ${DatabaseCreator.productoTable} 
      WHERE ${DatabaseCreator.productoEstado} = ${ConstantDatabase.DB_COLUMN_ESTADO_DEAULT_ACTVIO}''';
      final data = await db.rawQuery(sql);
      for (final node in data) {
        productosDto.add(new ProductoDto(
            productoId: node[DatabaseCreator.productoId],
            productoNombre: node[DatabaseCreator.productoNombre]));
      }
    } catch (ex) {
      await this
          ._errorRepository
          .addErrorWithDetalle(moduloRepository, ex.toString());
    }
    return productosDto;
  }

  Future<List<GenericDto>> selectAllGeneric() async {
    List<GenericDto> productosDto = [];
    try {
      final sql = '''SELECT * FROM ${DatabaseCreator.productoTable} 
      WHERE ${DatabaseCreator.productoEstado} = ${ConstantDatabase.DB_COLUMN_ESTADO_DEAULT_ACTVIO}''';
      final data = await db.rawQuery(sql);
      for (final node in data) {
        productosDto.add(new GenericDto(
            id: node[DatabaseCreator.productoId],
            nombre: node[DatabaseCreator.productoNombre]));
      }
    } catch (ex) {
      await this
          ._errorRepository
          .addErrorWithDetalle(moduloRepository, ex.toString());
    }
    return productosDto;
  }

  Future<bool> update(ProductoDto productoDto) async {
    try {
      final sql = '''UPDATE ${DatabaseCreator.productoTable}
      SET ${DatabaseCreator.productoNombre} = '${productoDto.productoNombre}',
      ${DatabaseCreator.productoEstado} = ${productoDto.productoEstado} 
      WHERE ${DatabaseCreator.productoId} == ${productoDto.productoId}
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
      final sqlH = 'DELETE FROM ${DatabaseCreator.productoTable}';
      await db.rawDelete(sqlH);
    } catch (ex) {
      await this
          ._errorRepository
          .addErrorWithDetalle(moduloRepository, ex.toString());
    }
  }

  Future<void> deleteById(int id) async {
    try {
      final sqlH = '''DELETE FROM ${DatabaseCreator.productoTable} 
      WHERE ${DatabaseCreator.productoId} == ${id}''';
      await db.rawDelete(sqlH);
    } catch (ex) {
      await this
          ._errorRepository
          .addErrorWithDetalle(moduloRepository, ex.toString());
    }
  }
}
