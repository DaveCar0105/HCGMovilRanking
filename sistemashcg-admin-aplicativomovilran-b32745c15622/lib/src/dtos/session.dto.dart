import 'dart:convert';

import 'package:ranking_app/src/dtos/usuario.dto.dart';

SessionDto sessionDtoFromJson(String str) =>
    SessionDto.fromJson(json.decode(str));
String sessionDtoToJson(SessionDto data) => json.encode(data.toJson());

class SessionDto {
  SessionDto({this.accessToken, this.usuarioDto});

  String accessToken;
  UsuarioDto usuarioDto;

  factory SessionDto.fromJson(Map<String, dynamic> json) => SessionDto(
        accessToken: json["accessToken"],
        usuarioDto: UsuarioDto.fromJson(json["usuarioDto"]),
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "usuarioDto": usuarioDto.toJson(),
      };
}
