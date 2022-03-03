
import 'dart:convert';

EvaluacionFincaParseDto evaluacionFincaParseDtoFromJson(String str)=> EvaluacionFincaParseDto.fromJson(json.decode(str));
//String evaluacionFincaParseDtoToJson(EvaluacionFincaParseDto data)=> json.encode(data.toJson());
class EvaluacionFincaParseDto {
  int usuarioId;
  DateTime fechaAuditoria;
  int postcosechaId;
  String tipoEvaluacion;
  List<EvaluacionFincaParseDetalleDto> evaluacionDetalle;

  EvaluacionFincaParseDto(
    {
      this.usuarioId,
      this.fechaAuditoria,
      this.postcosechaId,
      this.tipoEvaluacion
    }
  );


    factory EvaluacionFincaParseDto.fromJson(Map<String, dynamic> json) => EvaluacionFincaParseDto(
      usuarioId: json["usuarioId"], //consultar
      fechaAuditoria : DateTime.tryParse(
              json["procesoTamanioBotonFecha"] ??
                  DateTime.now().toIso8601String()) ??
          DateTime.now(),
      postcosechaId: json["postcosechaId"],
      tipoEvaluacion: json["tipoEvaluacion"]
     );

       Map<String, dynamic> toJson() => {
        "usuarioId": usuarioId,
        "fechaAuditoria": fechaAuditoria.toIso8601String(),
        "postcosechaId": postcosechaId,
        "tipoEvaluacion": tipoEvaluacion
      };
}

class EvaluacionFincaParseDetalleDto {
  String numeroMesa;
  int gradoVariedad;
  int tallosPorRamo;
  int variedadId;
  List<EvaluacionFincaParseRespuestaDto> respuestas;

  EvaluacionFincaParseDetalleDto({
    this.numeroMesa,
    this.gradoVariedad,
    this.tallosPorRamo,
    this.variedadId
  });
   factory EvaluacionFincaParseDetalleDto.fromJson(Map<String, dynamic> json) => EvaluacionFincaParseDetalleDto(
      numeroMesa: json["numeroMesa"], //consultar
      gradoVariedad: json["gradoVariedad"],
      tallosPorRamo: json["tallosPorRamo"],
      variedadId: json["variedadId"]
     );

       Map<String, dynamic> toJson() => {
        "numeroMesa": numeroMesa,
        "gradoVariedad": gradoVariedad,
        "tallosPorRamo": tallosPorRamo,
        "variedadId":variedadId
      };
}

class EvaluacionFincaParseRespuestaDto {
  int itemId;
  int cantidadRespuesta; //ingresa el usuario
  int totalRespuesta; //cantidadDisminuir, entidad mapeada

  EvaluacionFincaParseRespuestaDto({
    this.itemId,
    this.cantidadRespuesta,
    this.totalRespuesta
  });

     factory EvaluacionFincaParseRespuestaDto.fromJson(Map<String, dynamic> json) => EvaluacionFincaParseRespuestaDto(
      itemId: json["itemId"], //consultar
      cantidadRespuesta: json["cantidadRespuesta"],
      totalRespuesta: json["totalRespuesta"],
      
     );

       Map<String, dynamic> toJson() => {
        "itemId": itemId,
        "cantidadRespuesta": cantidadRespuesta,
        "totalRespuesta": totalRespuesta,
        
      };

}
