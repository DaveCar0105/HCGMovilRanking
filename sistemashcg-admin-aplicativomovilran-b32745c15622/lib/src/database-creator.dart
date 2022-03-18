import 'dart:io';

import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';

import 'constant.dart';

Database db;

class DatabaseCreator {
  //TABLA DE TIPO-CAJA
  static const tipoCajaTable = 'tipoCaja';
  static const tipoCajaId = 'tipoCajaId';
  static const tipoCajaNombre = 'tipoCajaNombre';
  static const tipoCajaEstado = 'estado';

  //TABLA DE CLIENTE
  static const clienteTable = 'cliente';
  static const clienteId = 'clienteId';
  static const clienteNombre = 'clienteNombre';
  static const clienteEstado = 'estado';

  //TABLA DE CARGUERA
  static const cargueraTable = 'carguera';
  static const cargueraId = 'cargueraId';
  static const cargueraNombre = 'cargueraNombre';
  static const cargueraEstado = 'estado';

  //TABLA DE PAIS
  static const paisTable = 'pais';
  static const paisId = 'paisId';
  static const paisNombre = 'paisNombre';
  static const paisEstado = 'estado';

  //TABLA DE POSTCOSECHA
  static const postcosechaTable = 'postcosecha';
  static const postcosechaId = 'postcosechaId';
  static const postcosechaNombre = 'postcosechaNombre';
  static const postcosechaPadreId = 'postcosechaPadreId';
  static const postcosechaEstado = 'estado';

  //TABLA DE PRODUCTO
  static const productoTable = 'producto';
  static const productoId = 'productoId';
  static const productoNombre = 'productoNombre';
  static const productoEstado = 'estado';

  //TABLA DE VARIEDAD
  static const variedadTable = 'variedad';
  static const variedadId = 'variedadId';
  static const variedadNombre = 'variedadNombre';
  static const variedadEstado = 'estado';
  //--productoId--

  //TABLA DE CAUSA
  static const causaTable = 'causa';
  static const causaId = 'causaId';
  static const causaNombre = 'causaNombre';
  static const causaEstado = 'estado';

  //TABLA DE INFORMACION-AUDITORIA
  static const informacionAuditoriaTable = 'informacionAuditoria';
  static const informacionAuditoriaId = 'informacionAuditoriaId';
  static const informacionAuditoriaFecha = 'informacionAuditoriaFecha';
  static const informacionAuditoriaPromedioSala =
      'informacionAuditoriaPromedioSala';
  static const informacionAuditoriaPromedioBoncheo =
      'informacionAuditoriaPromedioBoncheo';
  static const informacionAuditoriaPromedioCorte =
      'informacionAuditoriaPromedioCorte';
  static const informacionAuditoriaPromedioLargoFinca =
      'informacionAuditoriaPromedioLargoFinca';
  static const informacionAuditoriaPorcentajeFlorNacional =
      'informacionAuditoriaPorcentajeFlorNacional';
  static const informacionAuditoriaEstado = 'estado';
  //--postcosechaId--
  //--usuarioId--
  static const usuarioId = 'usuarioId';

  //TABLA DE AUDITORIA-CAUSA
  static const auditoriaCausaTable = 'auditoriaCausa';
  static const auditoriaCausaId = 'auditoriaCausaId';
  static const auditoriaCausaPorcentajeAfectacion =
      'auditoriaCausaPorcentajeAfectacion';
  //--causaId--
  //--informacionAuditoriaId--

  //TABLA DE PROCESO-TAMANIO-BOTON
  static const procesoTamanioBotonTable = 'procesoTamanioBoton';
  static const procesoTamanioBotonId = 'procesoTamanioBotonId';
  static const procesoTamanioBotonFecha = 'procesoTamanioBotonFecha';
  static const procesoTamanioBotonGradoVariedad =
      'procesoTamanioBotonGradoVariedad';
  static const procesoTamanioBotonLargoArea = 'procesoTamanioBotonLargoArea';
  static const procesoTamanioBotonAnchoArea = 'procesoTamanioBotonAnchoArea';
  static const procesoTamanioBotonAreaRamo = 'procesoTamanioBotonAreaRamo';
  static const procesoTamanioBotonTamanoBoton1 =
      'procesoTamanioBotonTamanoBoton1';
  static const procesoTamanioBotonTamanoBoton2 =
      'procesoTamanioBotonTamanoBoton2';
  static const procesoTamanioBotonTamanoBoton3 =
      'procesoTamanioBotonTamanoBoton3';
  static const procesoTamanioBotonTamanoBotonPromedio =
      'procesoTamanioBotonTamanoBotonPromedio';
  static const procesoTamanioBotonNumeroPetalos =
      'procesoTamanioBotonNumeroPetalos';
  static const procesoTamanioBotonEstado = 'estado';
  //--postcosechaId--
  //--usuarioId--
  //--variedadId--

  //TABLA DE PROCESO-MALTRATO
  static const procesoMaltratoTable = 'procesoMaltrato';
  static const procesoMaltratoId = 'procesoMaltratoId';
  static const procesoMaltratoFecha = 'procesoMaltratoFecha';
  static const procesoMaltratoTallosMuestreadoRecepcion =
      'procesoMaltratoTallosMuestreadoRecepcion';
  static const procesoMaltratoTallosMaltratoRecepcion =
      'procesoMaltratoTallosMaltratoRecepcion';
  static const procesoMaltratoPorcentajeIndicenciaRecepcion =
      'procesoMaltratoPorcentajeIndicenciaRecepcion';
  static const procesoMaltratoTallosMuestreadoBoncheo =
      'procesoMaltratoTallosMuestreadoBoncheo';
  static const procesoMaltratoTallosMaltratoBoncheo =
      'procesoMaltratoTallosMaltratoBoncheo';
  static const procesoMaltratoPorcentajeIndicenciaBoncheo =
      'procesoMaltratoPorcentajeIndicenciaBoncheo';
  static const procesoMaltratoTallosMuestreadoCuartoFrio =
      'procesoMaltratoTallosMuestreadoCuartoFrio';
  static const procesoMaltratoTallosMaltratoCuartoFrio =
      'procesoMaltratoTallosMaltratoCuartoFrio';
  static const procesoMaltratoPorcentajeIndicenciaCuartoFrio =
      'procesoMaltratoPorcentajeIndicenciaCuartoFrio';
  static const procesoMaltratoTallosMuestreadoEmpaque =
      'procesoMaltratoTallosMuestreadoEmpaque';
  static const procesoMaltratoTallosMaltratoEmpaque =
      'procesoMaltratoTallosMaltratoEmpaque';
  static const procesoMaltratoPorcentajeIndicenciaEmpaque =
      'procesoMaltratoPorcentajeIndicenciaEmpaque';
  static const procesoMaltratoEstado = 'estado';
  //--postcosechaId--
  //--usuarioId--
  //--variedadId--

  //TABLA EVALUACION FINCA
  static const evaluacionFincaTable = 'evaluacionFinca';
  static const evaluacionFincaId = 'evaluacionFincaId';
  static const fechaAuditoria = 'fechaAuditoria';
  static const tipoEvaluacion = 'tipoEvaluacion';

  //TABLA EVALUACION DETALLE
  static const evaluacionDetalleTable = 'evaluacionDetalle';
  static const evaluacionDetalleId = 'evaluacionDetalleId';
  static const numeroMesa = 'numeroMesa';
  static const gradoVariedad = 'gradoVariedad';
  static const tallosPorRamo = 'tallosPorRamo';

  //TABLA EVALUACION RESPUESTAS
  static const evaluacionRespuestasTable = 'respuestas';
  static const respuestaId = 'respuestaId';
  static const cantidadRespuesta = 'cantidadRespuesta';
  static const totalRespuesta = 'totalRespuesta';
  static const itemId = 'itemId';

  //TABLA AUDITORIA EN AGENCIA
  static const auditoriaAgenciaTable = 'auditoriaAgenciaTable';
  static const auditoriaAgenciaId = 'auditoriaAgenciaId';
  static const fechaAuditoriaAgencia = 'fechaAuditoriaAgencia';
  //TABALA AUDITORIA EN AGENCIA DETALLE
  static const auditoriaDetalleTable = 'auditoriaDetalleTable';
  static const auditoriaDetalleId = 'auditoriaDetalleId';
  static const gradoVariedadAgencia = 'gradoVariedadAgencia';
  static const numeroGuiaAgencia = 'numeroGuiaAgencia';
  static const identificadorCajaAgencia = 'identificadorCajaAgencia';
  static const temperaturaCajaAgencia = 'temperaturaCajaAgencia';
  static const tallosPorRamoAgencia = 'temperaturaCajaAgencia';
  static const ramosPorCajaAgencia = 'ramosPorCajaAgencia';
  static const numeroTallosMuestreadosAgencia =
      'numeroTallosMuestreadosAgencia';
  // static const
  // TABLA AGENCIA RESPUESTAS
  static const auditoriaRespuestasTable = 'auditoriaRespuestasTable';
  static const auditoriaRespuestasId = 'auditoriaRespuestasId';
  static const auditoriaCatindadRespuesta = 'auditoriaCatindadRespuesta';
  static const auditoriaTotalRespuesta = 'auditoriaTotalRespuesta';
  static const auditoriaItemId = 'auditoriaItemId';

  //TABLA DE ERRRORES
  static const errorTable = "error";
  static const errorId = "errorId";
  static const errorDetalle = "errorDetalle";
  static const estado = "estado";

  Future<String> getDatabasePath1(String dbName) async {
    final databasePath = await getDatabasesPath();
    final path = p.join(databasePath, dbName);
    if (await Directory(p.dirname(path)).exists()) {
      print("DB existente!!!");
    } else {
      await Directory(p.dirname(path)).create(recursive: true);
    }
    return path;
  }

  Future<void> initDatabase() async {
    final path = await getDatabasePath1(Constant.DB_NAME);
    db = await openDatabase(path, version: 1, onCreate: onCreate);
  }

  Future<void> onCreate(Database db, int version) async {
    print("creando DB");
    await createTableError(db);
    await createTableTipoCaja(db);
    await createTableCliente(db);
    await createTableCarguera(db);
    await createTablePais(db);
    await createTablePostcosecha(db);
    await createTableProducto(db);
    await createTableVariedad(db);
    await createTableCausa(db);
    await createTableInformacionAuditoria(db);
    await createTableAuditoriaCausa(db);
    await createTableProcesoTamanoBoton(db);
    await createTableProcesoMaltrato(db);
    await createTableEvaluacionFinca(db);
    await createTableEvaluacionFincaDetalle(db);
    await createTableEvaluacionRespuestas(db);
    await createTableAuditoriaAgencia(db);
    await createTableAuditoriaAgenciaDetalle(db);
    await createTableAuditoriaAgenciaRespuestas(db);
  }

  Future<void> createTableError(Database db) async {
    final ramosSql = '''CREATE TABLE $errorTable
    (
      $errorId INTEGER PRIMARY KEY AUTOINCREMENT,
      $errorDetalle TEXT
    )''';
    await db.execute(ramosSql);
  }

  Future<void> createTableTipoCaja(Database db) async {
    final ramosSql = '''CREATE TABLE $tipoCajaTable
    (
      $tipoCajaId INTEGER PRIMARY KEY,
      $tipoCajaNombre TEXT,
      $tipoCajaEstado INTEGER
    )''';
    await db.execute(ramosSql);
  }

  Future<void> createTableCliente(Database db) async {
    final ramosSql = '''CREATE TABLE $clienteTable
    (
      $clienteId INTEGER PRIMARY KEY,
      $clienteNombre TEXT,
      $clienteEstado INTEGER
    )''';
    await db.execute(ramosSql);
  }

  Future<void> createTableCarguera(Database db) async {
    final ramosSql = '''CREATE TABLE $cargueraTable
    (
      $cargueraId INTEGER PRIMARY KEY,
      $cargueraNombre TEXT,
      $cargueraEstado INTEGER
    )''';
    await db.execute(ramosSql);
  }

  Future<void> createTablePais(Database db) async {
    final ramosSql = '''CREATE TABLE $paisTable
    (
      $paisId INTEGER PRIMARY KEY,
      $paisNombre TEXT,
      $paisEstado INTEGER
    )''';
    await db.execute(ramosSql);
  }

  Future<void> createTablePostcosecha(Database db) async {
    final ramosSql = '''CREATE TABLE $postcosechaTable
    (
      $postcosechaId INTEGER PRIMARY KEY,
      $postcosechaNombre TEXT,
      $postcosechaPadreId INTEGER,
      $postcosechaEstado INTEGER
    )''';
    await db.execute(ramosSql);
  }

  Future<void> createTableProducto(Database db) async {
    final ramosSql = '''CREATE TABLE $productoTable
    (
      $productoId INTEGER PRIMARY KEY,
      $productoNombre TEXT,
      $productoEstado INTEGER
    )''';
    await db.execute(ramosSql);
  }

  Future<void> createTableVariedad(Database db) async {
    final ramosSql = '''CREATE TABLE $variedadTable
    (
      $variedadId INTEGER PRIMARY KEY,
      $variedadNombre TEXT,
      $variedadEstado INTEGER
    )''';
    await db.execute(ramosSql);
  }

  Future<void> createTableCausa(Database db) async {
    final ramosSql = '''CREATE TABLE $causaTable
    (
      $causaId INTEGER PRIMARY KEY,
      $causaNombre TEXT,
      $causaEstado INTEGER
    )''';
    await db.execute(ramosSql);
  }

  Future<void> createTableInformacionAuditoria(Database db) async {
    final ramosSql = '''CREATE TABLE $informacionAuditoriaTable
    (
      $usuarioId NUMERIC,
      $informacionAuditoriaId INTEGER PRIMARY KEY AUTOINCREMENT,
      $informacionAuditoriaFecha DATE,
      $informacionAuditoriaPromedioSala NUMERIC,
      $informacionAuditoriaPromedioBoncheo NUMERIC,
      $informacionAuditoriaPromedioCorte NUMERIC,
      $informacionAuditoriaPromedioLargoFinca NUMERIC,
      $informacionAuditoriaPorcentajeFlorNacional NUMERIC,
      $informacionAuditoriaEstado INTEGER,
      $postcosechaId INTEGER
    )''';
    await db.execute(ramosSql);
  }

  Future<void> createTableAuditoriaCausa(Database db) async {
    final ramosSql = '''CREATE TABLE $auditoriaCausaTable
    (
      $auditoriaCausaId INTEGER PRIMARY KEY AUTOINCREMENT,
      $auditoriaCausaPorcentajeAfectacion NUMERIC,
      $informacionAuditoriaId INTEGER,
      $causaId INTEGER
    )''';
    await db.execute(ramosSql);
  }

  Future<void> createTableProcesoTamanoBoton(Database db) async {
    final ramosSql = '''CREATE TABLE $procesoTamanioBotonTable
    (
      $usuarioId NUMERIC,
      $procesoTamanioBotonId INTEGER PRIMARY KEY AUTOINCREMENT,
      $procesoTamanioBotonFecha DATE,
      $procesoTamanioBotonGradoVariedad INTEGER,
      $procesoTamanioBotonLargoArea NUMERIC,
      $procesoTamanioBotonAnchoArea NUMERIC,
      $procesoTamanioBotonAreaRamo NUMERIC,
      $procesoTamanioBotonTamanoBoton1 NUMERIC,
      $procesoTamanioBotonTamanoBoton2 NUMERIC,
      $procesoTamanioBotonTamanoBoton3 NUMERIC,
      $procesoTamanioBotonTamanoBotonPromedio NUMERIC,
      $procesoTamanioBotonNumeroPetalos INTEGER,
      $procesoTamanioBotonEstado INTEGER,
      $postcosechaId INTEGER,
      $variedadId INTEGER
    )''';
    await db.execute(ramosSql);
  }

  Future<void> createTableProcesoMaltrato(Database db) async {
    final ramosSql = '''CREATE TABLE $procesoMaltratoTable
    (
      $usuarioId NUMERIC,
      $procesoMaltratoId INTEGER PRIMARY KEY AUTOINCREMENT,
      $procesoMaltratoFecha DATE,
      $procesoMaltratoTallosMuestreadoRecepcion INTEGER,
      $procesoMaltratoTallosMaltratoRecepcion INTEGER,
      $procesoMaltratoPorcentajeIndicenciaRecepcion NUMERIC,
      $procesoMaltratoTallosMuestreadoBoncheo INTEGER,
      $procesoMaltratoTallosMaltratoBoncheo INTEGER,
      $procesoMaltratoPorcentajeIndicenciaBoncheo NUMERIC,
      $procesoMaltratoTallosMuestreadoCuartoFrio INTEGER,
      $procesoMaltratoTallosMaltratoCuartoFrio INTEGER,
      $procesoMaltratoPorcentajeIndicenciaCuartoFrio NUMERIC,
      $procesoMaltratoTallosMuestreadoEmpaque INTEGER,
      $procesoMaltratoTallosMaltratoEmpaque INTEGER,
      $procesoMaltratoPorcentajeIndicenciaEmpaque NUMERIC,
      $procesoMaltratoEstado INTEGER,
      $postcosechaId INTEGER,
      $variedadId INTEGER
    )''';
    await db.execute(ramosSql);
  }

  Future<void> createTableEvaluacionFinca(Database db) async {
    final evaluacionFincaSql = '''CREATE TABLE $evaluacionFincaTable
    (
      $evaluacionFincaId INTEGER PRIMARY KEY AUTOINCREMENT,
      $fechaAuditoria DATE,
      $tipoEvaluacion TEXT,
      $postcosechaId NUMERIC,
      $usuarioId NUMERIC
    )''';
    await db.execute(evaluacionFincaSql);
  }

  Future<void> createTableEvaluacionFincaDetalle(Database db) async {
    final evaluacionFincaSql = '''CREATE TABLE $evaluacionDetalleTable
    (
      $evaluacionDetalleId INTEGER PRIMARY KEY AUTOINCREMENT,
      $numeroMesa TEXT,
      $gradoVariedad NUMERIC,
      $tallosPorRamo NUMERIC,
      $variedadId NUMERIC,
      $evaluacionFincaId NUMERIC
    )''';
    await db.execute(evaluacionFincaSql);
  }

  Future<void> createTableEvaluacionRespuestas(Database db) async {
    final evaluacionFincaSql = '''CREATE TABLE $evaluacionRespuestasTable
    (
      $respuestaId INTEGER PRIMARY KEY AUTOINCREMENT,
      $cantidadRespuesta NUMERIC,
      $totalRespuesta NUMERIC,
      $itemId NUMERIC,
      $evaluacionDetalleId NUMERIC,
      $evaluacionFincaId NUMERIC
    )''';
    await db.execute(evaluacionFincaSql);
  }

  Future<void> createTableAuditoriaAgencia(Database db) async {
    final auditoriaAgenciaSql = '''CREATE TABLE $auditoriaAgenciaTable
    (
      $auditoriaAgenciaId INTEGER PRIMARY KEY AUTOINCREMENT,
      $fechaAuditoriaAgencia DATE,
      $postcosechaId NUMERIC,
      $usuarioId NUMERIC
    )''';
    await db.execute(auditoriaAgenciaSql);
  }

  Future<void> createTableAuditoriaAgenciaDetalle(Database db) async {
    final auditoriaAgenciaDetalleSql = '''CREATE TABLE $auditoriaDetalleTable(
    )
    (
      $auditoriaDetalleId INTEGER PRIMARY KEY AUTOINCREMENT,
      $gradoVariedadAgencia NUMERIC,
      $tallosPorRamoAgencia NUMERIC,
      $variedadId NUMERIC,
      $auditoriaAgenciaId NUMERIC
    )''';
    await db.execute(auditoriaAgenciaDetalleSql);
  }

  Future<void> createTableAuditoriaAgenciaRespuestas(Database db) async {
    final auditoriaAgenciaRespuestaSql =
        '''CREATE TABLE $auditoriaRespuestasTable(
    )
    (
      $auditoriaRespuestasId INTEGER PRIMARY KEY AUTOINCREMENT,
      $auditoriaCatindadRespuesta NUMERIC,
      $auditoriaTotalRespuesta NUMERIC,
      $auditoriaItemId NUMERIC,
      $auditoriaDetalleId NUMERIC
    )''';
    await db.execute(auditoriaAgenciaRespuestaSql);
  }
}
