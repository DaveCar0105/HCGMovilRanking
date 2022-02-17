import 'dart:convert';

UsuarioDto usuarioDtoFromJson(String str) =>
    UsuarioDto.fromJson(json.decode(str));
String usuarioDtoToJson(UsuarioDto data) => json.encode(data.toJson());

class UsuarioDto {
  UsuarioDto({this.usuarioId, this.usuarioNombre, this.usuarioUsername});

  int usuarioId;
  String usuarioNombre;
  String usuarioUsername;

  factory UsuarioDto.fromJson(Map<String, dynamic> json) => UsuarioDto(
      usuarioId: json["id"],
      usuarioNombre: json["usuarioNombre"],
      usuarioUsername: json["usuarioUsername"]);

  Map<String, dynamic> toJson() => {
        "usuarioId": usuarioId,
        "usuarioNombre": usuarioNombre,
        "usuarioUsername": usuarioUsername
      };
}
