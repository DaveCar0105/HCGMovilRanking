import 'dart:convert';

MaltratoDto tamanoBotonDtoFromJson(String str) =>
    MaltratoDto.fromJson(json.decode(str));
String tamanoBotonDtoToJson(MaltratoDto data) => json.encode(data.toJson());

class MaltratoDto {
  String postcosechaPadreId;
  String postcosechaId;
  String variedadId;
  int procesoMaltratoTallosMuestreadoRecepcion;
  int procesoMaltratoTallosMaltratoRecepcion;
  double procesoMaltratoPorcentajeIndicenciaRecepcion;
  int procesoMaltratoTallosMuestreadoBoncheo;
  int procesoMaltratoTallosMaltratoBoncheo;
  double procesoMaltratoPorcentajeIndicenciaBoncheo;
  int procesoMaltratoTallosMuestreadoCuartoFrio;
  int procesoMaltratoTallosMaltratoCuartoFrio;
  double procesoMaltratoPorcentajeIndicenciaCuartoFrio;
  int procesoMaltratoTallosMuestreadoEmpaque;
  int procesoMaltratoTallosMaltratoEmpaque;
  double procesoMaltratoPorcentajeIndicenciaEmpaque;

  MaltratoDto(
      {this.postcosechaPadreId,
      this.postcosechaId,
      this.variedadId,
      this.procesoMaltratoTallosMuestreadoRecepcion,
      this.procesoMaltratoTallosMaltratoRecepcion,
      this.procesoMaltratoPorcentajeIndicenciaRecepcion,
      this.procesoMaltratoTallosMuestreadoBoncheo,
      this.procesoMaltratoTallosMaltratoBoncheo,
      this.procesoMaltratoPorcentajeIndicenciaBoncheo,
      this.procesoMaltratoTallosMuestreadoCuartoFrio,
      this.procesoMaltratoTallosMaltratoCuartoFrio,
      this.procesoMaltratoPorcentajeIndicenciaCuartoFrio,
      this.procesoMaltratoTallosMuestreadoEmpaque,
      this.procesoMaltratoTallosMaltratoEmpaque,
      this.procesoMaltratoPorcentajeIndicenciaEmpaque});

  MaltratoDto.fromJson(Map<String, dynamic> json) {
    postcosechaPadreId = json['postcosechaPadreId'];
    postcosechaId = json['postcosechaId'];
    variedadId = json['variedadId'];
    procesoMaltratoTallosMuestreadoRecepcion = json['procesoMaltratoTallosMuestreadoRecepcion'];
    procesoMaltratoTallosMaltratoRecepcion = json['procesoMaltratoTallosMaltratoRecepcion'];
    procesoMaltratoPorcentajeIndicenciaRecepcion = json['procesoMaltratoPorcentajeIndicenciaRecepcion'];
    procesoMaltratoTallosMuestreadoBoncheo = json['procesoMaltratoTallosMuestreadoBoncheo'];
    procesoMaltratoTallosMaltratoBoncheo = json['procesoMaltratoTallosMaltratoBoncheo'];
    procesoMaltratoPorcentajeIndicenciaBoncheo =
        json['procesoMaltratoPorcentajeIndicenciaBoncheo'];
    procesoMaltratoTallosMuestreadoCuartoFrio = json['procesoMaltratoTallosMuestreadoCuartoFrio'];
    procesoMaltratoTallosMaltratoCuartoFrio = json['procesoMaltratoTallosMaltratoCuartoFrio'];
    procesoMaltratoPorcentajeIndicenciaCuartoFrio = json['procesoMaltratoPorcentajeIndicenciaCuartoFrio'];
    procesoMaltratoTallosMuestreadoEmpaque = json['procesoMaltratoTallosMuestreadoEmpaque'];
    procesoMaltratoTallosMaltratoEmpaque = json['procesoMaltratoTallosMaltratoEmpaque'];
    procesoMaltratoPorcentajeIndicenciaEmpaque = json['procesoMaltratoPorcentajeIndicenciaEmpaque'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['postcosechaPadreId'] = this.postcosechaPadreId;
    data['postcosechaId'] = this.postcosechaId;
    data['variedadId'] = this.variedadId;
    data['tallosMuestradosRecepcion'] = this.procesoMaltratoTallosMuestreadoRecepcion;
    data['precenciaMaltratoRecepcion'] = this.procesoMaltratoTallosMaltratoRecepcion;
    data['procesoMaltratoPorcentajeIndicenciaRecepcion'] = this.procesoMaltratoPorcentajeIndicenciaRecepcion;
    data['procesoMaltratoTallosMuestreadoBoncheo'] = this.procesoMaltratoTallosMuestreadoBoncheo;
    data['procesoMaltratoTallosMaltratoBoncheo'] = this.procesoMaltratoTallosMaltratoBoncheo;
    data['procesoMaltratoPorcentajeIndicenciaBoncheo'] =
        this.procesoMaltratoPorcentajeIndicenciaBoncheo;
    data['procesoMaltratoTallosMuestreadoCuartoFrio'] = this.procesoMaltratoTallosMuestreadoCuartoFrio;
    data['procesoMaltratoTallosMaltratoCuartoFrio'] = this.procesoMaltratoTallosMaltratoCuartoFrio;
    data['procesoMaltratoPorcentajeIndicenciaCuartoFrio'] =
        this.procesoMaltratoPorcentajeIndicenciaCuartoFrio;
    data['procesoMaltratoTallosMuestreadoEmpaque'] = this.procesoMaltratoTallosMuestreadoEmpaque;
    data['procesoMaltratoTallosMaltratoEmpaque'] = this.procesoMaltratoTallosMaltratoEmpaque;
    data['procesoMaltratoPorcentajeIndicenciaEmpaque'] = this.procesoMaltratoPorcentajeIndicenciaEmpaque;
    return data;
  }
}
