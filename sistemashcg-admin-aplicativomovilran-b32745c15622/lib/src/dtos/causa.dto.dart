import 'dart:convert';

CausaDto causaDtoFromJson(String str) => CausaDto.fromJson(json.decode(str));
String causaDtoToJson(CausaDto data) => json.encode(data.toJson());

class CausaDto {
  CausaDto({this.causaId, this.causaNombre, this.causaEstado});

  int causaId;
  String causaNombre;
  int causaEstado;

  factory CausaDto.fromJson(Map<String, dynamic> json) => CausaDto(
      causaId: json["id"],
      causaNombre: json["causaNombre"],
      causaEstado: json["estado"]);

  Map<String, dynamic> toJson() => {
        "causaId": causaId,
        "causaNombre": causaNombre,
        "causaEstado": causaEstado
      };
}
