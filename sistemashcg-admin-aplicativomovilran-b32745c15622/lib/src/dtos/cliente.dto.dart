import 'dart:convert';

ClienteDto clienteDtoFromJson(String str) =>
    ClienteDto.fromJson(json.decode(str));
String clienteDtoToJson(ClienteDto data) => json.encode(data.toJson());

class ClienteDto {
  ClienteDto({this.clienteId, this.clienteNombre, this.clienteEstado});

  int clienteId;
  String clienteNombre;
  int clienteEstado;

  factory ClienteDto.fromJson(Map<String, dynamic> json) => ClienteDto(
      clienteId: json["id"],
      clienteNombre: json["clienteNombre"],
      clienteEstado: json["estado"]);

  Map<String, dynamic> toJson() => {
        "clienteId": clienteId,
        "clienteNombre": clienteNombre,
        "clienteEstado": clienteEstado
      };
}
