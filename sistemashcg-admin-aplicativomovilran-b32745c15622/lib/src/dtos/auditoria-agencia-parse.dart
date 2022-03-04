import 'dart:convert';

AuditoriaAgenciaParseDto auditoriaAgenciaParseDtoFromJson(String str)=> AuditoriaAgenciaParseDto.fromJson(json.decode(str));
//String evaluacionFincaParseDtoToJson(EvaluacionFincaParseDto data)=> json.encode(data.toJson());
class AuditoriaAgenciaParseDto {
  int usuarioId;
  DateTime fechaAuditoriaAgencia;
  int postcosechaId;
 // String tipoEvaluacion;
  List<AuditoriaAgenciaParseDetalleDto> auditoriaAgenciaDetalle;

  AuditoriaAgenciaParseDto(
    {
      this.usuarioId,
      this.fechaAuditoriaAgencia,
      this.postcosechaId,
      //this.tipoEvaluacion
    }
  );


    factory AuditoriaAgenciaParseDto.fromJson(Map<String, dynamic> json) => AuditoriaAgenciaParseDto(
      usuarioId: json["usuarioId"], //consultar
      fechaAuditoriaAgencia : DateTime.tryParse(
              json["fechaAuditoriaAngencia"] ??
                  DateTime.now().toIso8601String()) ??
          DateTime.now(),
      postcosechaId: json["postcosechaId"],
      //tipoEvaluacion: json["tipoEvaluacion"]
     );

       Map<String, dynamic> toJson() => {
        "usuarioId": usuarioId,
        "fechaAuditoriaAgencia": fechaAuditoriaAgencia.toIso8601String(),
        "postcosechaId": postcosechaId,
       // "tipoEvaluacion": tipoEvaluacion
      };
}

class AuditoriaAgenciaParseDetalleDto {
  
  int gradoVariedadAgencia;
  int tallosPorRamoAgencia;
  int variedadId;
  List<AuditoriaAgenciaParseRespuestaDto> respuestasAgencia;

  AuditoriaAgenciaParseDetalleDto({
    
    this.gradoVariedadAgencia,
    this.tallosPorRamoAgencia,
    this.variedadId
  });
   factory AuditoriaAgenciaParseDetalleDto.fromJson(Map<String, dynamic> json) => AuditoriaAgenciaParseDetalleDto(
       //consultar
      gradoVariedadAgencia: json["gradoVariedadAgencia"],
      tallosPorRamoAgencia: json["tallosPorRamoAgencia"],
      variedadId: json["variedadId"]
     );

       Map<String, dynamic> toJson() => {
       
        "gradoVariedadAgencia": gradoVariedadAgencia,
        "tallosPorRamoAgencia": tallosPorRamoAgencia,
        "variedadId":variedadId
      };
}

class AuditoriaAgenciaParseRespuestaDto {
  int auditoriaItemId;
  int auditoriaCatindadRespuesta; //ingresa el usuario
  int auditoriaTotalRespuesta; //cantidadDisminuir, entidad mapeada

  AuditoriaAgenciaParseRespuestaDto({
    this.auditoriaItemId,
    this.auditoriaCatindadRespuesta,
    this.auditoriaTotalRespuesta
  });

     factory AuditoriaAgenciaParseRespuestaDto.fromJson(Map<String, dynamic> json) => AuditoriaAgenciaParseRespuestaDto(
      auditoriaItemId: json["auditoriaItemId"], //consultar
      auditoriaCatindadRespuesta: json["auditoriaCatindadRespuesta"],
      auditoriaTotalRespuesta: json["auditoriaTotalRespuesta"],
      
     );

       Map<String, dynamic> toJson() => {
        "auditoriaItemId": auditoriaItemId,
        "auditoriaCatindadRespuesta": auditoriaCatindadRespuesta,
        "auditoriaTotalRespuesta": auditoriaTotalRespuesta,
        
      };

}