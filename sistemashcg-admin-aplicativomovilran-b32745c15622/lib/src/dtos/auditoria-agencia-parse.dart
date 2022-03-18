import 'dart:convert';

AuditoriaAgenciaParseDto auditoriaAgenciaParseDtoFromJson(String str)=> AuditoriaAgenciaParseDto.fromJson(json.decode(str));
//String evaluacionFincaParseDtoToJson(EvaluacionFincaParseDto data)=> json.encode(data.toJson());
class AuditoriaAgenciaParseDto {
  int usuarioId;
  DateTime fechaAuditoriaAgencia;
  int cantidadCajasAuditoriaAgencia;
  int gradoAuditoriaAgencia;
  int numeroGuiaAgencia;
  int identificadorCajaAgencia;
  int temperaturaCajaAgencia;
  int numeroTallosAgencia;
  int numeroRamosAgencia;
  int numeroTallosMuestreadosAgencia;
  int postcosechaId;
  int cargueraId;
  int clienteId;
  int paisId;
  int tipoCajaId;
 // String tipoEvaluacion;
  List<AuditoriaAgenciaParseDetalleDto> auditoriaAgenciaDetalle;

  AuditoriaAgenciaParseDto(
    {
      this.usuarioId,
      this.fechaAuditoriaAgencia,
      this.cantidadCajasAuditoriaAgencia,
      this.gradoAuditoriaAgencia,
      this.numeroGuiaAgencia,
      this.identificadorCajaAgencia,
      this.temperaturaCajaAgencia,
      this.numeroTallosAgencia,
      this.numeroRamosAgencia,
      this.numeroTallosMuestreadosAgencia,
      this.postcosechaId,
      this.cargueraId,
      this.clienteId,
      this.paisId,
      this.tipoCajaId,
      //this.tipoEvaluacion
    }
  );


    factory AuditoriaAgenciaParseDto.fromJson(Map<String, dynamic> json) => AuditoriaAgenciaParseDto(
      usuarioId: json["usuarioId"], //consultar
      fechaAuditoriaAgencia : DateTime.tryParse(
              json["fechaAuditoriaAngencia"] ??
                  DateTime.now().toIso8601String()) ??
          DateTime.now(),
      cantidadCajasAuditoriaAgencia: json["cantidadCajasAuditoriaAgencia"],
      gradoAuditoriaAgencia: json["gradoAuditoriaAgencia"],
      numeroGuiaAgencia:json["numeroGuiaAgencia"],
      identificadorCajaAgencia:json["identificadorCajaAgencia"],
      temperaturaCajaAgencia:json["temperaturaCajaAgencia"],
      numeroTallosAgencia:json["numeroTallosAgencia"],
      numeroRamosAgencia:json["numeroRamosAgencia"],
      numeroTallosMuestreadosAgencia:json["numeroTallosMuestreadosAgencia"],
      postcosechaId: json["postcosechaId"],
      cargueraId:json["cargueraId"],
      clienteId:json["clienteId"],
      paisId:json["paisId"], 
      tipoCajaId:json["tipoCajaId"]     //tipoEvaluacion: json["tipoEvaluacion"]
     );

       Map<String, dynamic> toJson() => {
        "usuarioId": usuarioId,
        "fechaAuditoriaAgencia": fechaAuditoriaAgencia.toIso8601String(),
        "cantidadCajasAuditoriaAgencia": cantidadCajasAuditoriaAgencia,
        "gradoAuditoriaAgencia":gradoAuditoriaAgencia,
        "numeroGuiaAgencia":numeroGuiaAgencia,
        "identificadorCajaAgencia":identificadorCajaAgencia,
        "temperaturaCajaAgencia":temperaturaCajaAgencia,
        "numeroTallosAgencia":numeroTallosAgencia,
        "numeroRamosAgencia":numeroRamosAgencia,
        "numeroTallosMuestreadosAgencia":numeroTallosMuestreadosAgencia,
        "postcosechaId": postcosechaId,
        "cargueraId":cargueraId,
        "clienteId":clienteId,
        "paisId":paisId,
        "tipoCajaId":tipoCajaId
       // "tipoEvaluacion": tipoEvaluacion
      };
}

class AuditoriaAgenciaParseDetalleDto {
  
  String numeroMesa;
  int gradoVariedadAgencia;
  int tallosPorRamoAgencia;
  int variedadId;
  

  List<AuditoriaAgenciaParseRespuestaDto> respuestasAgencia;

  AuditoriaAgenciaParseDetalleDto({
    this.numeroMesa,
    this.gradoVariedadAgencia,
    this.tallosPorRamoAgencia,
    this.variedadId,
    
  });
   factory AuditoriaAgenciaParseDetalleDto.fromJson(Map<String, dynamic> json) => AuditoriaAgenciaParseDetalleDto(
       //consultar
      numeroMesa: json["numeroMesa"],
      gradoVariedadAgencia: json["gradoVariedadAgencia"],
      tallosPorRamoAgencia: json["tallosPorRamoAgencia"],
      variedadId: json["variedadId"],
      
     );

       Map<String, dynamic> toJson() => {
        "numeroMesa":numeroMesa,
        "gradoVariedadAgencia": gradoVariedadAgencia,
        "tallosPorRamoAgencia": tallosPorRamoAgencia,
        "variedadId":variedadId
      };
}

class AuditoriaAgenciaParseRespuestaDto {
  int itemId;
  int auditoriaCatindadRespuesta; //ingresa el usuario
  int auditoriaTotalRespuesta; //cantidadDisminuir, entidad mapeada

  AuditoriaAgenciaParseRespuestaDto({
    this.itemId,
    this.auditoriaCatindadRespuesta,
    this.auditoriaTotalRespuesta
  });

     factory AuditoriaAgenciaParseRespuestaDto.fromJson(Map<String, dynamic> json) => AuditoriaAgenciaParseRespuestaDto(
      itemId: json["itemId"], //consultar
      auditoriaCatindadRespuesta: json["auditoriaCatindadRespuesta"],
      auditoriaTotalRespuesta: json["auditoriaTotalRespuesta"],
      
     );

       Map<String, dynamic> toJson() => {
        "itemId": itemId,
        "auditoriaCatindadRespuesta": auditoriaCatindadRespuesta,
        "auditoriaTotalRespuesta": auditoriaTotalRespuesta,
        
      };

}