import 'package:ranking_app/locator.dart';
import 'package:ranking_app/src/database-creator.dart';
import 'package:ranking_app/src/dtos/info-adic.dto.dart';
import 'package:ranking_app/src/dtos/maltrato.dt.dart';
import 'package:ranking_app/src/dtos/sincronizacion.dto.dart';
import 'package:ranking_app/src/dtos/tamano-boton.dto.dart';
import 'package:ranking_app/src/repositories/error.repository.dart';
import 'package:ranking_app/src/repositories/informacion-adicional.repository.dart';
import 'package:ranking_app/src/repositories/maltrato.repository.dart';
import 'package:ranking_app/src/repositories/tamano-boton.repository.dart';
import 'package:ranking_app/src/services/sincronizar-entity-server.service.dart';

class SincronizacionService {
  final ErrorRepository _errorRepository;
  final moduloRepository = 'Aprobacion ';
  SincronizacionService(this._errorRepository);

  Future<SincronizacionDto> selectAllEntities() async {
    SincronizacionDto aprobacionTotalDto = new SincronizacionDto();
    aprobacionTotalDto.tamanioBotonCantidad = await selectCantidadEntities(DatabaseCreator.procesoTamanioBotonTable);
    aprobacionTotalDto.maltratoCantidad = await selectCantidadEntities(DatabaseCreator.procesoMaltratoTable);
    aprobacionTotalDto.infoAdicionalCantidad = await selectCantidadEntities(DatabaseCreator.informacionAuditoriaTable);
    //aprobacionTotalDto.audiFincaCantidad = await selectCantidadEntities(DatabaseCreator.);
    //aprobacionTotalDto.audiAgenciaCantidad = await selectCantidadEntities(DatabaseCreator.procesoTamanioBotonTable);
    aprobacionTotalDto.audiFincaCantidad = 0;
    aprobacionTotalDto.audiAgenciaCantidad = 0;
    return aprobacionTotalDto;
  }

  Future<num> selectCantidadEntities(String entidad) async {
    num value = 0;
    try {
      final sql = '''SELECT COUNT(*) AS CANTIDAD FROM $entidad ''';
      var data = await db.rawQuery(sql);
      value = data[0]['CANTIDAD'];
    } catch (ex) {
      await this
          ._errorRepository
          .addErrorWithDetalle(moduloRepository, ex.toString());
    }
    return value;
  }

  Future sincronizarTamanioBoton() async {
    try{
      List<TamanoBotonDto> tamanioBoton = await locator<TamanoBotonRepository>().selectAll();
      print(tamanioBoton.map((e) => e.toJson()));
      bool banderaSincronized = await locator<SincronizeEntityServerService>().postTamanioBoton(tamanioBoton);
      if(banderaSincronized){
        await locator<TamanoBotonRepository>().delete();
      }
    }catch(e){}
  }

  Future sincronizarMaltrato() async {
    try{
      List<MaltratoDto> maltratoPro = await locator<MaltratoRepository>().selectAll();
      print(maltratoPro.map((e) => e.toJson()));
      bool banderaSincronized = await locator<SincronizeEntityServerService>().postProcesoMaltrato(maltratoPro);
      if(banderaSincronized){
        await locator<MaltratoRepository>().delete();
      }
    }catch(e){}
  }

  Future sincronizarInformacionAdicional() async {
    try{
      List<InformacionAdicionalDto> informacionAdicional = await locator<InformacionAdicionalRepository>().selectAll();
      print(informacionAdicional.map((e) => e.toJson()));
      bool banderaSincronized = await locator<SincronizeEntityServerService>().postInformacionAdicional(informacionAdicional);
      if(banderaSincronized){
        await locator<InformacionAdicionalRepository>().delete();
      }
    }catch(e){}
  }

  Future sincronizarAuditoriaFinca() async {
    try{
      List<TamanoBotonDto> tamanioBoton = await locator<TamanoBotonRepository>().selectAll();
      print(tamanioBoton);
    }catch(e){}
  }

  Future sincronizarAuditoriaAgencia() async {
    try{
      List<TamanoBotonDto> tamanioBoton = await locator<TamanoBotonRepository>().selectAll();
      print(tamanioBoton);
    }catch(e){}
  }
  
}