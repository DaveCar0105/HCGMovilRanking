import 'dart:convert';

MaltratoDto tamanoBotonDtoFromJson(String str) =>
    MaltratoDto.fromJson(json.decode(str));
String tamanoBotonDtoToJson(MaltratoDto data) => json.encode(data.toJson());

class MaltratoDto {
  int postcosechaId;
  int variedadId;
  int procesoMaltratoTallosMuestreadoRecepcion;
  int procesoMaltratoTallosMaltratoRecepcion;
  num procesoMaltratoPorcentajeIndicenciaRecepcion;
  int procesoMaltratoTallosMuestreadoBoncheo;
  int procesoMaltratoTallosMaltratoBoncheo;
  num procesoMaltratoPorcentajeIndicenciaBoncheo;
  int procesoMaltratoTallosMuestreadoCuartoFrio;
  int procesoMaltratoTallosMaltratoCuartoFrio;
  num procesoMaltratoPorcentajeIndicenciaCuartoFrio;
  int procesoMaltratoTallosMuestreadoEmpaque;
  int procesoMaltratoTallosMaltratoEmpaque;
  num procesoMaltratoPorcentajeIndicenciaEmpaque;

  MaltratoDto(
      {
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
