import 'dart:convert';

PaisDto paisDtoFromJson(String str) => PaisDto.fromJson(json.decode(str));
String paisDtoToJson(PaisDto data) => json.encode(data.toJson());

class PaisDto {
  PaisDto({this.paisId, this.paisNombre, this.paisEstado});

  int paisId;
  String paisNombre;
  int paisEstado;

  factory PaisDto.fromJson(Map<String, dynamic> json) => PaisDto(
      paisId: json["id"],
      paisNombre: json["paisNombre"],
      paisEstado: json["estado"]);

  Map<String, dynamic> toJson() =>
      {"paisId": paisId, "paisNombre": paisNombre, "paisEstado": paisEstado};
}
