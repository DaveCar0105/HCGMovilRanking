import 'dart:convert';

PostcosechaDto postcosechaDtoFromJson(String str) =>
    PostcosechaDto.fromJson(json.decode(str));
String postcosechaDtoToJson(PostcosechaDto data) => json.encode(data.toJson());

class PostcosechaDto {
  PostcosechaDto(
      {this.postcosechaId,
      this.postcosechaNombre,
      this.postcosechaEstado,
      this.postcosechaPadreId});

  int postcosechaId;
  String postcosechaNombre;
  int postcosechaEstado;
  int postcosechaPadreId;

  factory PostcosechaDto.fromJson(Map<String, dynamic> json) => PostcosechaDto(
      postcosechaId: json["id"],
      postcosechaNombre: json["postcosechaNombre"],
      postcosechaEstado: json["estado"],
      postcosechaPadreId: json["idPostcosechaPadre"]);

  Map<String, dynamic> toJson() => {
        "postcosechaId": postcosechaId,
        "postcosechaNombre": postcosechaNombre,
        "postcosechaEstado": postcosechaEstado,
        "postcosechaPadreId": postcosechaPadreId
      };
}
