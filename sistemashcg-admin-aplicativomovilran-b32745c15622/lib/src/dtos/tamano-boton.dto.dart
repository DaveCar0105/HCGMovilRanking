


import 'package:ranking_app/src/ui/pages/procesos/tamano-boton/tamano-boton_form_widget.dart';
import 'dart:convert';

TamanoBotonDto tamanoBotonDtoFromJson(String str)=> TamanoBotonDto.fromJson(json.decode(str));
String tamanoBotonDtoToJson(TamanoBotonDto data)=> json.encode(data.toJson());

class TamanoBotonDto{
  TamanoBotonDto({this.usuarioId,this.procesoTamanioBotonId, this.procesoTamanioBotonFecha,this.variedadId, this.procesoTamanioBotonGradoVariedad
  , this.procesoTamanioBotonLargoArea,this.procesoTamanioBotonAnchoArea,this.procesoTamanioBotonAreaRamo
  ,this.procesoTamanioBotonTamanoBoton1,this.procesoTamanioBotonTamanoBoton2,this.procesoTamanioBotonTamanoBoton3
  ,this.procesoTamanioBotonTamanoBotonPromedio,this.procesoTamanioBotonNumeroPetalos
  });
  int usuarioId;
  int procesoTamanioBotonId;
  DateTime procesoTamanioBotonFecha;
  int variedadId;
  int procesoTamanioBotonGradoVariedad;
  double procesoTamanioBotonLargoArea;
  double procesoTamanioBotonAnchoArea;
  double procesoTamanioBotonAreaRamo;
  double procesoTamanioBotonTamanoBoton1;
  double procesoTamanioBotonTamanoBoton2;
  double procesoTamanioBotonTamanoBoton3;
  double procesoTamanioBotonTamanoBotonPromedio;
  int procesoTamanioBotonNumeroPetalos;


  factory TamanoBotonDto.fromJson(Map<String,dynamic>json)=>TamanoBotonDto(
    usuarioId: json["usuarioId"], //consultar
    procesoTamanioBotonId:json["procesoTamanioBotonId"],
    procesoTamanioBotonFecha: json["procesoTamanioBotonFecha"],
    variedadId: json["variedadId"],
    procesoTamanioBotonGradoVariedad: json["procesoTamanioBotonGradoVariedad"],
    procesoTamanioBotonLargoArea: json["procesoTamanioBotonLargoArea"],
    procesoTamanioBotonAnchoArea: json["procesoTamanioBotonAnchoArea"],
    procesoTamanioBotonAreaRamo: json["procesoTamanioBotonAreaRamo"],
    procesoTamanioBotonTamanoBoton1: json["procesoTamanioBotonTamanoBoton1"],
    procesoTamanioBotonTamanoBoton2: json["procesoTamanioBotonTamanoBoton2"],
    procesoTamanioBotonTamanoBoton3: json["procesoTamanioBotonTamanoBoton3"],
    procesoTamanioBotonTamanoBotonPromedio: json["procesoTamanioBotonTamanoBotonPromedio"],
    procesoTamanioBotonNumeroPetalos: json["procesoTamanioBotonNumeroPetalos"] 
  );

  Map<String, dynamic>toJson()=>{
    "usuarioId":usuarioId,
    "procesoTamanioBotonId":procesoTamanioBotonId,
    "procesoTamanioBotonFecha":procesoTamanioBotonFecha,
    "variedadId":variedadId,
    "procesoTamanioBotonGradoVariedad":procesoTamanioBotonGradoVariedad,
    "procesoTamanioBotonLargoArea":procesoTamanioBotonLargoArea,
    "procesoTamanioBotonAnchoArea":procesoTamanioBotonAnchoArea,
    "procesoTamanioBotonAreaRamo":procesoTamanioBotonAreaRamo,
    "procesoTamanioBotonTamanoBoton1":procesoTamanioBotonTamanoBoton1,
    "procesoTamanioBotonTamanoBoton2":procesoTamanioBotonTamanoBoton2,
    "procesoTamanioBotonTamanoBoton3":procesoTamanioBotonTamanoBoton3,
    "procesoTamanioBotonTamanoBotonPromedio":procesoTamanioBotonTamanoBotonPromedio,
    "procesoTamanioBotonNumeroPetalos":procesoTamanioBotonNumeroPetalos
  };

}