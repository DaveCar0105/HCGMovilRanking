import 'dart:convert';

import 'package:ranking_app/locator.dart';
import 'package:ranking_app/src/repositories/variedad.repository.dart';

TamanoBotonDto tamanoBotonDtoFromJson(String str) =>
    TamanoBotonDto.fromJson(json.decode(str));
String tamanoBotonDtoToJson(TamanoBotonDto data) => json.encode(data.toJson());

class TamanoBotonDto {
  TamanoBotonDto(
      {this.usuarioId,
      this.procesoTamanioBotonId,
      this.procesoTamanioBotonFecha,
      this.variedadId,
      this.procesoTamanioBotonGradoVariedad,
      this.procesoTamanioBotonLargoArea,
      this.procesoTamanioBotonAnchoArea,
      this.procesoTamanioBotonAreaRamo,
      this.procesoTamanioBotonTamanoBoton1,
      this.procesoTamanioBotonTamanoBoton2,
      this.procesoTamanioBotonTamanoBoton3,
      this.procesoTamanioBotonTamanoBotonPromedio,
      this.procesoTamanioBotonNumeroPetalos});
  num usuarioId;
  num procesoTamanioBotonId;
  DateTime procesoTamanioBotonFecha;
  num variedadId;
  num procesoTamanioBotonGradoVariedad;
  num procesoTamanioBotonLargoArea;
  num procesoTamanioBotonAnchoArea;
  num procesoTamanioBotonAreaRamo;
  num procesoTamanioBotonTamanoBoton1;
  num procesoTamanioBotonTamanoBoton2;
  num procesoTamanioBotonTamanoBoton3;
  num procesoTamanioBotonTamanoBotonPromedio;
  num procesoTamanioBotonNumeroPetalos;

  factory TamanoBotonDto.fromJson(Map<String, dynamic> json) => TamanoBotonDto(
      usuarioId: json["usuarioId"], //consultar
      procesoTamanioBotonId: json["procesoTamanioBotonId"],
      procesoTamanioBotonFecha:
          DateTime.tryParse(json["procesoTamanioBotonFecha"] ?? "") ??
              DateTime.now(),
      variedadId: json["variedadId"],
      procesoTamanioBotonGradoVariedad:
          json["procesoTamanioBotonGradoVariedad"],
      procesoTamanioBotonLargoArea: json["procesoTamanioBotonLargoArea"],
      procesoTamanioBotonAnchoArea: json["procesoTamanioBotonAnchoArea"],
      procesoTamanioBotonAreaRamo: json["procesoTamanioBotonAreaRamo"],
      procesoTamanioBotonTamanoBoton1: json["procesoTamanioBotonTamanoBoton1"],
      procesoTamanioBotonTamanoBoton2: json["procesoTamanioBotonTamanoBoton2"],
      procesoTamanioBotonTamanoBoton3: json["procesoTamanioBotonTamanoBoton3"],
      procesoTamanioBotonTamanoBotonPromedio:
          json["procesoTamanioBotonTamanoBotonPromedio"],
      procesoTamanioBotonNumeroPetalos:
          json["procesoTamanioBotonNumeroPetalos"]);

  Map<String, dynamic> toJson() => {
        "usuarioId": usuarioId,
        "procesoTamanioBotonId": procesoTamanioBotonId,
        "procesoTamanioBotonFecha": procesoTamanioBotonFecha.toIso8601String(),
        "variedadId": variedadId,
        "procesoTamanioBotonGradoVariedad": procesoTamanioBotonGradoVariedad,
        "procesoTamanioBotonLargoArea": procesoTamanioBotonLargoArea,
        "procesoTamanioBotonAnchoArea": procesoTamanioBotonAnchoArea,
        "procesoTamanioBotonAreaRamo": procesoTamanioBotonAreaRamo,
        "procesoTamanioBotonTamanoBoton1": procesoTamanioBotonTamanoBoton1,
        "procesoTamanioBotonTamanoBoton2": procesoTamanioBotonTamanoBoton2,
        "procesoTamanioBotonTamanoBoton3": procesoTamanioBotonTamanoBoton3,
        "procesoTamanioBotonTamanoBotonPromedio":
            procesoTamanioBotonTamanoBotonPromedio,
        "procesoTamanioBotonNumeroPetalos": procesoTamanioBotonNumeroPetalos
      };

      Map<String, dynamic> toJsonAprobacion() => {
        "Identificador": procesoTamanioBotonId,
        "Fecha": procesoTamanioBotonFecha?.year.toString() +"-"+ procesoTamanioBotonFecha?.month.toString() +"-"+procesoTamanioBotonFecha?.day.toString(),
        "Hora": procesoTamanioBotonFecha?.hour.toString() +":"+ procesoTamanioBotonFecha?.minute.toString() +":"+procesoTamanioBotonFecha?.second.toString(),
        "variedad": variedadId,
        "Grado de variedad": procesoTamanioBotonGradoVariedad,
        "Largo de area": procesoTamanioBotonLargoArea,
        "Ancho area": procesoTamanioBotonAnchoArea,
        "Area del ramo": procesoTamanioBotonAreaRamo,
        "Boton1": procesoTamanioBotonTamanoBoton1,
        "Boton2": procesoTamanioBotonTamanoBoton2,
        "Boton3": procesoTamanioBotonTamanoBoton3,
        "Boton Promedio":
            procesoTamanioBotonTamanoBotonPromedio,
        "Numero petalos": procesoTamanioBotonNumeroPetalos
      };

      
}
