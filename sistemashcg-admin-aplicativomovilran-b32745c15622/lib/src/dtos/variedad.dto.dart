import 'dart:convert';

VariedadDto variedadDtoFromJson(String str) =>
    VariedadDto.fromJson(json.decode(str));
String variedadDtoToJson(VariedadDto data) => json.encode(data.toJson());

class VariedadDto {
  VariedadDto(
      {this.variedadId,
      this.variedadNombre,
      this.variedadEstado,
      this.productoId});

  int variedadId;
  String variedadNombre;
  int variedadEstado;
  int productoId;

  factory VariedadDto.fromJson(Map<String, dynamic> json) => VariedadDto(
      variedadId: json["id"],
      variedadNombre: json["variedadNombre"],
      variedadEstado: json["estado"],
      productoId: json["idProducto"]);

  Map<String, dynamic> toJson() => {
        "variedadId": variedadId,
        "variedadNombre": variedadNombre,
        "variedadEstado": variedadEstado,
        "productoId": productoId
      };
}
