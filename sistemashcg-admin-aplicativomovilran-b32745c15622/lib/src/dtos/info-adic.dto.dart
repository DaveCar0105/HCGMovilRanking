import 'dart:convert';

InformacionAdicionalDto tamanoBotonDtoFromJson(String str) =>
    InformacionAdicionalDto.fromJson(json.decode(str));
String tamanoBotonDtoToJson(InformacionAdicionalDto data) =>
    json.encode(data.toJson());

class InformacionAdicionalDto {
  num usuarioId;
  num informacionAuditoriaId;
  DateTime informacionAuditoriaFecha;
  int postcosechaPadreId;
  int postcosechaId;
  num informacionAuditoriaPromedioSala;
  num informacionAuditoriaPromedioBoncheo;
  num informacionAuditoriaPromedioCorte;
  num informacionAuditoriaPromedioLargoFinca;
  num informacionAuditoriaPorcentajeFlorNacional;
  num causaId;
  num porcentajeAfectacionCausa1;
  num causa2;
  num porcentajeAfectacionCausa2;
  num causa3;
  num porcentajeAfectacionCausa3;
  num causa4;
  num porcentajeAfectacionCausa4;
  num causa5;
  num porcentajeAfectacionCausa5;
  num informacionAuditoriaEstado;


  InformacionAdicionalDto({
    this.usuarioId,
    this.informacionAuditoriaId,
    this.informacionAuditoriaFecha,
    this.postcosechaPadreId,
    this.postcosechaId,
    this.informacionAuditoriaPromedioSala,
    this.informacionAuditoriaPromedioBoncheo,
    this.informacionAuditoriaPromedioCorte,
    this.informacionAuditoriaPromedioLargoFinca,
    this.informacionAuditoriaPorcentajeFlorNacional,
    this.causaId,
    this.porcentajeAfectacionCausa1,
    this.causa2,
    this.porcentajeAfectacionCausa2,
    this.causa3,
    this.porcentajeAfectacionCausa3,
    this.causa4,
    this.porcentajeAfectacionCausa4,
    this.causa5,
    this.porcentajeAfectacionCausa5
  });

  InformacionAdicionalDto.fromJson(Map<String, dynamic> json) {
    usuarioId = json['usuarioId'];
    informacionAuditoriaId = json['informacionAuditoriaId'];
    informacionAuditoriaFecha = DateTime.tryParse(
              json['informacionAuditoriaFecha'] ??
                  DateTime.now().toIso8601String()) ??
          DateTime.now();
    postcosechaId = json['postcosechaId'];
    informacionAuditoriaPromedioSala = json['informacionAuditoriaPromedioSala'];
    informacionAuditoriaPromedioBoncheo =
        json['informacionAuditoriaPromedioBoncheo'];
    informacionAuditoriaPromedioCorte =
        json['informacionAuditoriaPromedioCorte'];
    informacionAuditoriaPromedioLargoFinca =
        json['informacionAuditoriaPromedioLargoFinca'];
    informacionAuditoriaPorcentajeFlorNacional =
        json['informacionAuditoriaPorcentajeFlorNacional'];
    causaId =json['casusaId'];
    porcentajeAfectacionCausa1 =json['porcentajeAfectacionCausa1'];
    causa2=json['causa2'];
    porcentajeAfectacionCausa2=json['porcentajeAfectacionCausa2'];
    causa3=json['causa3'];
    porcentajeAfectacionCausa3 =json['porcentajeAfectacionCausa3'];
    causa4=json['causa4'];
    porcentajeAfectacionCausa4=json['porcentajeAfectacionCausa4'];
    causa5=json['causa5'];
    porcentajeAfectacionCausa5 = json['porcentajeAfectacionCausa5'];

    informacionAuditoriaEstado = json['informacionAuditoriaEstado'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['usuarioId'] = this.usuarioId;
    data['informacionAuditoriaId'] = this.informacionAuditoriaId;
    data['informacionAuditoriaFecha'] = this.informacionAuditoriaFecha;
    data['postcosechaPadreId'] = this.postcosechaPadreId;
    data['postcosechaId'] = this.postcosechaId;
    data['informacionAuditoriaPromedioSala'] =
        this.informacionAuditoriaPromedioSala;
    data['informacionAuditoriaPromedioBoncheo'] =
        this.informacionAuditoriaPromedioBoncheo;
    data['informacionAuditoriaPromedioCorte'] =
        this.informacionAuditoriaPromedioCorte;
    data['informacionAuditoriaPromedioLargoFinca'] =
        this.informacionAuditoriaPromedioLargoFinca;
    data['informacionAuditoriaPorcentajeFlorNacional'] =
        this.informacionAuditoriaPorcentajeFlorNacional;
    data['causaId']= this.causaId;
    data['porcentajeAfectacionCausa1'] = this.porcentajeAfectacionCausa1;
    data['causa2']= this.causa2;
    data['porcentajeAfectacionCausa2'] = this.porcentajeAfectacionCausa2;
    data['causa3']= this.causa3;
    data['porcentajeAfectacionCausa3']= this.porcentajeAfectacionCausa3;
    data['causa4'] = this.causa4;
    data['porcentajeAfectacionCausa4'] = this.porcentajeAfectacionCausa4;
    data['causa5'] = this.causa5;
    data['porcentajeAfectacionCausa5'] = this.porcentajeAfectacionCausa5;

    data['informacionAuditoriaEstado'] = this.informacionAuditoriaEstado;
    return data;
  }

  Map<String, dynamic> toJsonAprobacion() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Identificador'] = this.informacionAuditoriaId;
     data["Fecha"] = this.informacionAuditoriaFecha?.year.toString() +
        "-" +
        this.informacionAuditoriaFecha?.month.toString() +
        "-" +
        this.informacionAuditoriaFecha?.day.toString();
    data["Hora"] = this.informacionAuditoriaFecha?.hour.toString() +
        ":" +
        this.informacionAuditoriaFecha?.minute.toString() +
        ":" +
        this.informacionAuditoriaFecha?.second.toString();
    data['postcosechaId'] = this.postcosechaId;
    data['Promedio Sala'] =
        this.informacionAuditoriaPromedioSala;
    data['Promedio Boncheo'] =
        this.informacionAuditoriaPromedioBoncheo;
    data['Promedio Corte'] =
        this.informacionAuditoriaPromedioCorte;
    data['Promedio Largo Finca'] =
        this.informacionAuditoriaPromedioLargoFinca;
    data['Porcentaje Flor Nacional'] =
        this.informacionAuditoriaPorcentajeFlorNacional;
    return data;
  }
}
