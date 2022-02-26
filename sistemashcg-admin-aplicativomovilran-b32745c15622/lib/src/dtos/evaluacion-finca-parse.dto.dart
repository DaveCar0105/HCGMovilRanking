class EvaluacionFincaParseDto {
  DateTime fechaAuditoria;
  String tipoEvaluacion;
  int postcosechaId;
  int usuarioId;
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
  int cantidadRespuesta; //ingresa el usuario
  int totalRespuesta; //cantidadDisminuir, entidad mapeada
  int itemId;
}
