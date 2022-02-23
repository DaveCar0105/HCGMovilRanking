import 'package:get_it/get_it.dart';
import 'package:ranking_app/src/database-creator.dart';
import 'package:ranking_app/src/preference.dart';
import 'package:ranking_app/src/repositories/carguera.repository.dart';
import 'package:ranking_app/src/repositories/causa.repository.dart';
import 'package:ranking_app/src/repositories/cliente.repository.dart';
import 'package:ranking_app/src/repositories/error.repository.dart';
import 'package:ranking_app/src/repositories/pais.repository.dart';
import 'package:ranking_app/src/repositories/postcosecha.repository.dart';
import 'package:ranking_app/src/repositories/producto.repository.dart';
import 'package:ranking_app/src/repositories/tamano-boton.repository.dart';
import 'package:ranking_app/src/repositories/tipo-caja.repository.dart';
import 'package:ranking_app/src/repositories/variedad.repository.dart';
import 'package:ranking_app/src/services/sincronize-information-server.service.dart';

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
    ),
  );

  locator.registerLazySingleton<DatabaseCreator>(
    () => DatabaseCreator(),
  );

  locator.registerLazySingleton<Preferences>(
    () => Preferences(),
  );
}
