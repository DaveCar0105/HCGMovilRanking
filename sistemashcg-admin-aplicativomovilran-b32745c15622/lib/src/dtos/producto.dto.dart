import 'dart:convert';

ProductoDto productoDtoFromJson(String str) =>
    ProductoDto.fromJson(json.decode(str));
String productoDtoToJson(ProductoDto data) => json.encode(data.toJson());

class ProductoDto {
  ProductoDto({this.productoId, this.productoNombre, this.productoEstado});

  int productoId;
  String productoNombre;
  int productoEstado;

  factory ProductoDto.fromJson(Map<String, dynamic> json) => ProductoDto(
      productoId: json["id"],
      productoNombre: json["productoNombre"],
      productoEstado: json["estado"]);

  factory ProductoDto.fromJsonDB(Map<String, dynamic> json) => ProductoDto(
      productoId: json["id"],
      productoNombre: json["productoNombre"],
      productoEstado: json["estado"]);

  Map<String, dynamic> toJson() => {
        "productoId": productoId,
        "productoNombre": productoNombre,
        "productoEstado": productoEstado
      };
}
