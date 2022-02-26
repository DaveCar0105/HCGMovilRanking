import 'dart:convert';

SincronizacionDto cargueraDtoFromJson(String str) =>
    SincronizacionDto.fromJson(json.decode(str));
String cargueraDtoToJson(SincronizacionDto data) => json.encode(data.toJson());

class SincronizacionDto {
  SincronizacionDto({this.tamanioBotonCantidad, this.maltratoCantidad, this.audiFincaCantidad, this.audiAgenciaCantidad, this.infoAdicionalCantidad});

  int tamanioBotonCantidad;
  int maltratoCantidad;
  int infoAdicionalCantidad;
  int audiFincaCantidad;
  int audiAgenciaCantidad;

  factory SincronizacionDto.fromJson(Map<String, dynamic> json) => SincronizacionDto(
      tamanioBotonCantidad: json["tamanioBotonCantidad"],
      maltratoCantidad: json["maltratoCantidad"],
      audiFincaCantidad: json["audiFincaCantidad"],
      audiAgenciaCantidad: json["audiAgenciaCantidad"],
      infoAdicionalCantidad: json["infoAdicionalCantidad"]);

  Map<String, dynamic> toJson() => {
        "tamanioBotonCantidad": tamanioBotonCantidad,
        "maltratoCantidad": maltratoCantidad,
        "audiFincaCantidad": audiFincaCantidad,
        "audiAgenciaCantidad": audiAgenciaCantidad,
        "infoAdicionalCantidad": infoAdicionalCantidad
      };
}
