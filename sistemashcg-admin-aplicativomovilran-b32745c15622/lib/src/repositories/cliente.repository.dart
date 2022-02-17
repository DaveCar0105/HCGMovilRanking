import 'package:ranking_app/src/constant.dart';
import 'package:ranking_app/src/database-creator.dart';
import 'package:ranking_app/src/dtos/cliente.dto.dart';
import 'package:ranking_app/src/repositories/error.repository.dart';

class ClienteRepository {
  final ErrorRepository _errorRepository;
  final moduloRepository = 'Cliente ';

  ClienteRepository(this._errorRepository);

  Future<bool> insert(ClienteDto clienteDto) async {
    final sql = '''INSERT INTO ${DatabaseCreator.clienteTable}(
        ${DatabaseCreator.clienteId},
        ${DatabaseCreator.clienteNombre},
        ${DatabaseCreator.clienteEstado}
      ) 
      VALUES (
        ${clienteDto.clienteId},
        '${clienteDto.clienteNombre}',
        ${clienteDto.clienteEstado}
      )''';
    int id = await db.rawInsert(sql);
    return id > 0 ? true : false;
  }

  Future<List<ClienteDto>> selectAll() async {
    List<ClienteDto> clientesDto = List();
    try {
      final sql = '''SELECT * FROM ${DatabaseCreator.clienteTable} 
      WHERE ${DatabaseCreator.clienteEstado} = ${ConstantDatabase.DB_COLUMN_ESTADO_DEAULT_ACTVIO}''';
      final data = await db.rawQuery(sql);
      for (final node in data) {
        clientesDto.add(new ClienteDto(
            clienteId: node[DatabaseCreator.clienteId],
            clienteNombre: node[DatabaseCreator.clienteNombre]));
      }
    } catch (ex) {
      await this
          ._errorRepository
          .addErrorWithDetalle(moduloRepository, ex.toString());
    }
    return clientesDto;
  }

  Future<bool> update(ClienteDto clienteDto) async {
    try {
      final sql = '''UPDATE ${DatabaseCreator.clienteTable}
      SET ${DatabaseCreator.clienteNombre} = '${clienteDto.clienteNombre}',
      ${DatabaseCreator.clienteEstado} = ${clienteDto.clienteEstado} 
      WHERE ${DatabaseCreator.clienteId} == ${clienteDto.clienteId}
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
      final sqlH = 'DELETE FROM ${DatabaseCreator.clienteTable}';
      await db.rawDelete(sqlH);
    } catch (ex) {
      await this
          ._errorRepository
          .addErrorWithDetalle(moduloRepository, ex.toString());
    }
  }

  Future<void> deleteById(int id) async {
    try {
      final sqlH = '''DELETE FROM ${DatabaseCreator.clienteTable} 
      WHERE ${DatabaseCreator.clienteId} == ${id}''';
      await db.rawDelete(sqlH);
    } catch (ex) {
      await this
          ._errorRepository
          .addErrorWithDetalle(moduloRepository, ex.toString());
    }
  }
}
