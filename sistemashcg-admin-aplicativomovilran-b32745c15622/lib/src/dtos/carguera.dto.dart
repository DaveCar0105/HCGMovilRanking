import 'dart:convert';

CargueraDto cargueraDtoFromJson(String str) =>
    CargueraDto.fromJson(json.decode(str));
String cargueraDtoToJson(CargueraDto data) => json.encode(data.toJson());

class CargueraDto {
  CargueraDto({this.cargueraId, this.cargueraNombre, this.cargueraEstado});

  int cargueraId;
  String cargueraNombre;
  int cargueraEstado;

  factory CargueraDto.fromJson(Map<String, dynamic> json) => CargueraDto(
      cargueraId: json["id"],
      cargueraNombre: json["cargueraNombre"],
      cargueraEstado: json["estado"]);

  Map<String, dynamic> toJson() => {
        "cargueraId": cargueraId,
        "cargueraNombre": cargueraNombre,
        "cargueraEstado": cargueraEstado
      };
}
