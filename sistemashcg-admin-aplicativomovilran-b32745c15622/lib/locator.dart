import 'package:get_it/get_it.dart';
import 'package:ranking_app/src/repositories/evaluacion-detalle.repository.dart';

import 'src/database-creator.dart';
import 'src/preference.dart';
import 'src/repositories/carguera.repository.dart';
import 'src/repositories/causa.repository.dart';
import 'src/repositories/cliente.repository.dart';
import 'src/repositories/error.repository.dart';
import 'src/repositories/evaluacion-finca.repository.dart';
import 'src/repositories/informacion-adicional.repository.dart';
import 'src/repositories/maltrato.repository.dart';
import 'src/repositories/pais.repository.dart';
import 'src/repositories/postcosecha.repository.dart';
import 'src/repositories/producto.repository.dart';
import 'src/repositories/tamano-boton.repository.dart';
import 'src/repositories/tipo-caja.repository.dart';
import 'src/repositories/variedad.repository.dart';
import 'src/services/sincronizacion.service.dart';
import 'src/services/sincronizar-entity-server.service.dart';
import 'src/services/sincronize-information-server.service.dart';

final locator = GetIt.instance;

void setUpDI() {
  //Error  Repository
  locator.registerLazySingleton<ErrorRepository>(
    () => ErrorRepository(),
  );

  //All repositories section
  locator.registerLazySingleton<CargueraRepository>(
    () => CargueraRepository(locator()),
  );
  locator.registerLazySingleton<CausaRepository>(
    () => CausaRepository(locator()),
  );
  locator.registerLazySingleton<ClienteRepository>(
    () => ClienteRepository(locator()),
  );
  locator.registerLazySingleton<PaisRepository>(
    () => PaisRepository(locator()),
  );
  locator.registerLazySingleton<PostcosechaRepository>(
    () => PostcosechaRepository(locator()),
  );
  locator.registerLazySingleton<ProductoRepository>(
    () => ProductoRepository(locator()),
  );
  locator.registerLazySingleton<TipoCajaRepository>(
    () => TipoCajaRepository(locator()),
  );
  locator.registerLazySingleton<VariedadRepository>(
    () => VariedadRepository(locator()),
  );
  locator.registerLazySingleton<TamanoBotonRepository>(
    () => TamanoBotonRepository(locator()),
  );
  locator.registerLazySingleton<MaltratoRepository>(
    () => MaltratoRepository(locator()),
  );
  locator.registerLazySingleton<InformacionAdicionalRepository>(
    () => InformacionAdicionalRepository(locator()),
  );
  locator.registerLazySingleton<EvaluacionFincaRepository>(
    () => EvaluacionFincaRepository(locator()),
  );
  locator.registerLazySingleton<EvaluacionDetalleRepository>(
    () => EvaluacionDetalleRepository(locator()),
  );

  //
  locator.registerLazySingleton<SincronizeServerInformation>(
    () => SincronizeServerInformation(
        locator(),
        locator(),
        locator(),
        locator(),
        locator(),
        locator(),
        locator(),
        locator(),
        locator(),
        locator(),
        locator(),
        locator()),
  );
  locator.registerLazySingleton<DatabaseCreator>(
    () => DatabaseCreator(),
  );
  locator.registerLazySingleton<Preferences>(
    () => Preferences(),
  );
  locator.registerLazySingleton<SincronizacionService>(
    () => SincronizacionService(locator()),
  );
  locator.registerLazySingleton<SincronizeEntityServerService>(
    () => SincronizeEntityServerService(locator()),
  );
}
