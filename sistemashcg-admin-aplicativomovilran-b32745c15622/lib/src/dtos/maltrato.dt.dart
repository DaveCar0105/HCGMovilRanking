import 'dart:convert';

MaltratoDto tamanoBotonDtoFromJson(String str) =>
    MaltratoDto.fromJson(json.decode(str));
String tamanoBotonDtoToJson(MaltratoDto data) => json.encode(data.toJson());

class MaltratoDto {
  int procesoMaltratoId;
  int postcosechaId;
  int variedadId;
  int usuarioId;
  DateTime procesoMaltratoFecha;
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
        this.procesoMaltratoId,
      this.postcosechaId,
      this.variedadId,
      this.usuarioId,
      this.procesoMaltratoFecha,
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
    usuarioId = json['UsuarioId'];
    procesoMaltratoId = json['procesoMaltratoId'];
    procesoMaltratoFecha =
    DateTime.tryParse(json["procesoMaltratoFecha"] ?? "") ??
              DateTime.now();
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
    data['procesoMaltratoId'] = this.procesoMaltratoId;
    data['variedadId'] = this.variedadId;
    data['usuarioId']= this.usuarioId;
    data['procesoMaltratoFecha'] = this.procesoMaltratoFecha?.toIso8601String();
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
  Map<String, dynamic> toJsonAprobacion() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Identificador'] = this.procesoMaltratoId;
    data['variedad'] = this.variedadId;
    data["Fecha"] = procesoMaltratoFecha?.year.toString() +"-"+ procesoMaltratoFecha?.month.toString() +"-"+procesoMaltratoFecha?.day.toString();
    data["Hora"] = procesoMaltratoFecha?.hour.toString() +":"+ procesoMaltratoFecha?.minute.toString() +":"+procesoMaltratoFecha?.second.toString();
    data['T.Muestrados Recepcion'] = this.procesoMaltratoTallosMuestreadoRecepcion;
    data['T.Maltrato Recepcion'] = this.procesoMaltratoTallosMaltratoRecepcion;
    data['Indicencia Recepcion'] = this.procesoMaltratoPorcentajeIndicenciaRecepcion;
    data['T.Muestreado Boncheo'] = this.procesoMaltratoTallosMuestreadoBoncheo;
    data['T.Maltrato Boncheo'] = this.procesoMaltratoTallosMaltratoBoncheo;
    data['Indicencia Boncheo'] =
        this.procesoMaltratoPorcentajeIndicenciaBoncheo;
    data['T.Muestreado CuartoFrio'] = this.procesoMaltratoTallosMuestreadoCuartoFrio;
    data['T.Maltrato CuartoFrio'] = this.procesoMaltratoTallosMaltratoCuartoFrio;
    data['Indicencia CuartoFrio'] =
        this.procesoMaltratoPorcentajeIndicenciaCuartoFrio;
    data['T.Muestreado Empaque'] = this.procesoMaltratoTallosMuestreadoEmpaque;
    data['T.Maltrato Empaque'] = this.procesoMaltratoTallosMaltratoEmpaque;
    data['Indicencia Empaque'] = this.procesoMaltratoPorcentajeIndicenciaEmpaque;
    return data;
  }
}
