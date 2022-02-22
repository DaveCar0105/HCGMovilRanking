import 'dart:convert';

MaltratoDto tamanoBotonDtoFromJson(String str) =>
    MaltratoDto.fromJson(json.decode(str));
String tamanoBotonDtoToJson(MaltratoDto data) => json.encode(data.toJson());

class MaltratoDto {
  String nombreFinca;
  String nombreSubFinca;
  String variedad;
  int tallosMuestradosRecepcion;
  int precenciaMaltratoRecepcion;
  double porcentajeIncidenciaRecepcion;
  int tallosMuestradosClasificaciN;
  int precenciaMaltratoClasificaciN;
  double porcentajeIncidenciaClasificaciN;
  int tallosMuestreadosCuartoFrio;
  int presenciaMaltratoCuartoFrio;
  double porcentajeIncidenciaCuartoFrio;
  int tallosMuestreadosEmpaque;
  int presenciaMaltratoEmpaque;
  double porcentajeIncidenciaEmpaque;

  MaltratoDto(
      {this.nombreFinca,
      this.nombreSubFinca,
      this.variedad,
      this.tallosMuestradosRecepcion,
      this.precenciaMaltratoRecepcion,
      this.porcentajeIncidenciaRecepcion,
      this.tallosMuestradosClasificaciN,
      this.precenciaMaltratoClasificaciN,
      this.porcentajeIncidenciaClasificaciN,
      this.tallosMuestreadosCuartoFrio,
      this.presenciaMaltratoCuartoFrio,
      this.porcentajeIncidenciaCuartoFrio,
      this.tallosMuestreadosEmpaque,
      this.presenciaMaltratoEmpaque,
      this.porcentajeIncidenciaEmpaque});

  MaltratoDto.fromJson(Map<String, dynamic> json) {
    nombreFinca = json['nombreFinca'];
    nombreSubFinca = json['nombreSubFinca'];
    variedad = json['variedad'];
    tallosMuestradosRecepcion = json['tallosMuestradosRecepcion'];
    precenciaMaltratoRecepcion = json['precenciaMaltratoRecepcion'];
    porcentajeIncidenciaRecepcion = json['porcentajeIncidenciaRecepcion'];
    tallosMuestradosClasificaciN = json['tallosMuestradosClasificación'];
    precenciaMaltratoClasificaciN = json['precenciaMaltratoClasificación'];
    porcentajeIncidenciaClasificaciN =
        json['porcentajeIncidenciaClasificación'];
    tallosMuestreadosCuartoFrio = json['tallosMuestreadosCuartoFrio'];
    presenciaMaltratoCuartoFrio = json['presenciaMaltratoCuartoFrio'];
    porcentajeIncidenciaCuartoFrio = json['porcentajeIncidenciaCuartoFrio'];
    tallosMuestreadosEmpaque = json['tallosMuestreadosEmpaque'];
    presenciaMaltratoEmpaque = json['presenciaMaltratoEmpaque'];
    porcentajeIncidenciaEmpaque = json['porcentajeIncidenciaEmpaque'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nombreFinca'] = this.nombreFinca;
    data['nombreSubFinca'] = this.nombreSubFinca;
    data['variedad'] = this.variedad;
    data['tallosMuestradosRecepcion'] = this.tallosMuestradosRecepcion;
    data['precenciaMaltratoRecepcion'] = this.precenciaMaltratoRecepcion;
    data['porcentajeIncidenciaRecepcion'] = this.porcentajeIncidenciaRecepcion;
    data['tallosMuestradosClasificación'] = this.tallosMuestradosClasificaciN;
    data['precenciaMaltratoClasificación'] = this.precenciaMaltratoClasificaciN;
    data['porcentajeIncidenciaClasificación'] =
        this.porcentajeIncidenciaClasificaciN;
    data['tallosMuestreadosCuartoFrio'] = this.tallosMuestreadosCuartoFrio;
    data['presenciaMaltratoCuartoFrio'] = this.presenciaMaltratoCuartoFrio;
    data['porcentajeIncidenciaCuartoFrio'] =
        this.porcentajeIncidenciaCuartoFrio;
    data['tallosMuestreadosEmpaque'] = this.tallosMuestreadosEmpaque;
    data['presenciaMaltratoEmpaque'] = this.presenciaMaltratoEmpaque;
    data['porcentajeIncidenciaEmpaque'] = this.porcentajeIncidenciaEmpaque;
    return data;
  }
}
