import 'dart:convert';

TipoCajaDto tipoCajaDtoFromJson(String str) =>
    TipoCajaDto.fromJson(json.decode(str));
String tipoCajaDtoToJson(TipoCajaDto data) => json.encode(data.toJson());

class TipoCajaDto {
  TipoCajaDto({this.tipoCajaId, this.tipoCajaNombre, this.tipoCajaEstado});

  int tipoCajaId;
  String tipoCajaNombre;
  int tipoCajaEstado;

  factory TipoCajaDto.fromJson(Map<String, dynamic> json) => TipoCajaDto(
      tipoCajaId: json["id"],
      tipoCajaNombre: json["tipoCajaNombre"],
      tipoCajaEstado: json["estado"]);

  Map<String, dynamic> toJson() => {
        "tipoCajaId": tipoCajaId,
        "tipoCajaNombre": tipoCajaNombre,
        "tipoCajaEstado": tipoCajaEstado
      };
}
