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
  });

  InformacionAdicionalDto.fromJson(Map<String, dynamic> json) {
    usuarioId = json['usuarioId'];
    informacionAuditoriaId = json['informacionAuditoriaId'];
    informacionAuditoriaFecha = DateTime.tryParse(
            json['informacionAuditoriaFecha'] ??
                DateTime.now().toIso8601String()) ??
        DateTime.now();
    postcosechaPadreId = json['postcosechaPadreId'];
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
    data['informacionAuditoriaEstado'] = this.informacionAuditoriaEstado;
    return data;
  }

  Map<String, dynamic> toJsonAprobacion() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['usuarioId'] = this.usuarioId;
    data['informacionAuditoriaId'] = this.informacionAuditoriaId;
    data['informacionAuditoriaFecha'] =
        this.informacionAuditoriaFecha.toIso8601String();
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
    return data;
  }
}
