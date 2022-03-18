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
  int numeroGuiaAgencia;
  int identificadorCajaAgencia;
  int temperaturaCajaAgencia;
  int ramosPorCajaAgencia;
  int numeroTallosMuestreadosAgencia;
  int auditoriaAgenciaId;
  int largoDeCajaAuditoriaAgencia;
  int anchoDeCajaAuditoriaAgencia;
  int altoDeCajaAuditoriaAgencia;
  double pesoVolumetricoAuditoriaAgencia;
  double pesoRealCajaAuditoriaAgencia;
  double aprovechamientoCajaAuditoriaAgencia;
  int gradoRamoAuditoriaAgencia;
  int largoDeRamoAuditoriaAgencia;
  int anchoDeRamoAuditoriaAgencia;
  int areaDeRamoAuditoriaAgencia;
  int tamanoBoton1AuditoriaAgencia;
  int tamanoBoton2AuditoriaAgencia;
  int tamanoBoton3AuditoriaAgencia;
  int tamanoBotonPromedioAuditoriaAgencia;
  int totalTallosAfectadosAuditoriaAgencia;
  int gradoCalidadEnBotonAuditoriaAgencia;
  int gradoCalidadEnFollajeAuditoriaAgencia;
  int gradoCalidadEnTallosAuditoriaAgencia;
  int gradoCalidadGeneralAuditoriaAgencia;

  List<AuditoriaAgenciaParseRespuestaDto> respuestasAgencia;

  AuditoriaAgenciaParseDetalleDto({
    
    this.gradoVariedadAgencia,
    this.tallosPorRamoAgencia,
    this.variedadId,
    this.numeroGuiaAgencia,
    this.identificadorCajaAgencia,
    this.temperaturaCajaAgencia,
    this.ramosPorCajaAgencia,
    this.numeroTallosMuestreadosAgencia,
    this.auditoriaAgenciaId,
    this.largoDeCajaAuditoriaAgencia,
    this.anchoDeCajaAuditoriaAgencia,
    this.altoDeCajaAuditoriaAgencia,
    this.pesoVolumetricoAuditoriaAgencia,
    this.pesoRealCajaAuditoriaAgencia,
    this.aprovechamientoCajaAuditoriaAgencia,
    this.gradoRamoAuditoriaAgencia,
    this.largoDeRamoAuditoriaAgencia,
    this.anchoDeRamoAuditoriaAgencia,
    this.areaDeRamoAuditoriaAgencia,
    this.tamanoBoton1AuditoriaAgencia,
    this.tamanoBoton2AuditoriaAgencia,
    this.tamanoBoton3AuditoriaAgencia,
    this.tamanoBotonPromedioAuditoriaAgencia,
    this.totalTallosAfectadosAuditoriaAgencia,
    this.gradoCalidadEnBotonAuditoriaAgencia,
    this.gradoCalidadEnFollajeAuditoriaAgencia,
    this.gradoCalidadEnTallosAuditoriaAgencia,
    this.gradoCalidadGeneralAuditoriaAgencia
  });
   factory AuditoriaAgenciaParseDetalleDto.fromJson(Map<String, dynamic> json) => AuditoriaAgenciaParseDetalleDto(
       //consultar
      gradoVariedadAgencia: json["gradoVariedadAgencia"],
      tallosPorRamoAgencia: json["tallosPorRamoAgencia"],
      variedadId: json["variedadId"],
      numeroGuiaAgencia: json["numeroGuiaAgencia"],
      identificadorCajaAgencia: json["identificadorCajaAgencia"],
      temperaturaCajaAgencia: json["temperaturaCajaAgencia"],
      ramosPorCajaAgencia: json["ramosPorCajaAgencia"],
      numeroTallosMuestreadosAgencia: json["numeroTallosMuestreadosAgencia"],
      auditoriaAgenciaId:json["auditoriaAgenciaId"],
      largoDeCajaAuditoriaAgencia: json["largoDeCajaAuditoriaAgencia"],
      anchoDeCajaAuditoriaAgencia:json["anchoDeCajaAuditoriaAgencia"],
      altoDeCajaAuditoriaAgencia : json["altoDeCajaAuditoriaAgencia"], 
      pesoVolumetricoAuditoriaAgencia:json["pesoVolumetricoAuditoriaAgencia"],    
      pesoRealCajaAuditoriaAgencia: json["pesoRealCajaAuditoriaAgencia"],
      aprovechamientoCajaAuditoriaAgencia:json["aprovechamientoCajaAuditoriaAgencia"],
      gradoRamoAuditoriaAgencia:json["gradoRamoAuditoriaAgencia"],
      largoDeRamoAuditoriaAgencia:json["largoDeRamoAuditoriaAgencia"],
      anchoDeRamoAuditoriaAgencia:json["anchoDeRamoAuditoriaAgencia"],
      areaDeRamoAuditoriaAgencia:json["areaDeRamoAuditoriaAgencia"],
      tamanoBoton1AuditoriaAgencia:json["tamanoBoton1AuditoriaAgencia"],
      tamanoBoton2AuditoriaAgencia:json["tamanoBoton2AuditoriaAgencia"],
      tamanoBoton3AuditoriaAgencia:json["tamanoBoton3AuditoriaAgencia"],
      tamanoBotonPromedioAuditoriaAgencia:json["tamanoBotonPromedioAuditoriaAgencia"],
      totalTallosAfectadosAuditoriaAgencia: json["totalTallosAfectadosAuditoriaAgencia"],
      gradoCalidadEnBotonAuditoriaAgencia:json["gradoCalidadEnBotonAuditoriaAgencia"],
      gradoCalidadEnFollajeAuditoriaAgencia:json["gradoCalidadEnFollajeAuditoriaAgencia"],
      gradoCalidadEnTallosAuditoriaAgencia:json["gradoCalidadEnTallosAuditoriaAgencia"],
      gradoCalidadGeneralAuditoriaAgencia:json["gradoCalidadGeneralAuditoriaAgencia"],
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