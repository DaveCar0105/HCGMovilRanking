class EvaluacionFincaParseDto {
  int usuarioId;
  DateTime fechaAuditoria;
  int postcosechaId;
  String tipoEvaluacion;
  List<EvaluacionFincaParseDetalleDto> evaluacionDetalle;
}

class EvaluacionFincaParseDetalleDto {
  String numeroMesa;
  int gradoVariedad;
  int tallosPorRamo;
  int variedadId;
  List<EvaluacionFincaParseRespuestaDto> respuestas;
}

class EvaluacionFincaParseRespuestaDto {
  int itemId;
  int cantidadRespuesta; //ingresa el usuario
  int totalRespuesta; //cantidadDisminuir, entidad mapeada
}
