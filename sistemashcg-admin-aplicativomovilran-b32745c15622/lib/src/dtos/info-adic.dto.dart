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
  double informacionAuditoriaPromedioSala ;
  double informacionAuditoriaPromedioBoncheo;
  double informacionAuditoriaPromedioCorte;
  double informacionAuditoriaPromedioLargoFinca;
  double informacionAuditoriaPorcentajeFlorNacional;
  String causaId;
  double auditoriaCausaPorcentajeAfectacion;
  // String causa2;
  // double porcentajeAfectacionCausa2;
  // String causa3;
  // double porcentajeAfectacionCausa3;
  // String causa4;
  // double porcentajeAfectacionCausa4;
  // String causa5;
  // String porcentajeAfectacionCausa5;

  InformacionAdicionalDto(
      {
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
      this.auditoriaCausaPorcentajeAfectacion,
      // this.causa2,
      // this.porcentajeAfectacionCausa2,
      // this.causa3,
      // this.porcentajeAfectacionCausa3,
      // this.causa4,
      // this.porcentajeAfectacionCausa4,
      // this.causa5,
      // this.porcentajeAfectacionCausa5
      });

  InformacionAdicionalDto.fromJson(Map<String, dynamic> json) {
    usuarioId =json['usuarioId'];
    informacionAuditoriaId=json['informacionAuditoriaId'];
    informacionAuditoriaFecha=json['informacionAuditoriaFecha'];
     postcosechaPadreId= json['postcosechaPadreId'];
    postcosechaId = json['postcosechaId'];
    informacionAuditoriaPromedioSala = json['informacionAuditoriaPromedioSala'];
    informacionAuditoriaPromedioBoncheo = json['informacionAuditoriaPromedioBoncheo'];
    informacionAuditoriaPromedioCorte = json['informacionAuditoriaPromedioCorte'];
    informacionAuditoriaPromedioLargoFinca = json['informacionAuditoriaPromedioLargoFinca'];
    informacionAuditoriaPorcentajeFlorNacional = json['informacionAuditoriaPorcentajeFlorNacional'];
    causaId = json['CausaId'];
    auditoriaCausaPorcentajeAfectacion = json['auditoriaCausaPorcentajeAfectacion'];
    // causa2 = json['Causa2'];
    // porcentajeAfectacionCausa2 = json['porcentajeAfectacionCausa2'];
    // causa3 = json['Causa3'];
    // porcentajeAfectacionCausa3 = json['porcentajeAfectacionCausa3'];
    // causa4 = json['Causa4'];
    // porcentajeAfectacionCausa4 = json['porcentajeAfectacionCausa4'];
    // causa5 = json['Causa5'];
    // porcentajeAfectacionCausa5 = json['porcentajeAfectacionCausa5'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['usuarioId']= this.usuarioId;
    data['informacionAuditoriaId']= this.informacionAuditoriaId;
    data['informacionAuditoriaFecha']= this.informacionAuditoriaFecha;
    data['postcosechaPadreId'] = this.postcosechaPadreId;
    data['postcosechaId'] = this.postcosechaId;
    data['informacionAuditoriaPromedioSala'] = this.informacionAuditoriaPromedioSala;
    data['informacionAuditoriaPromedioBoncheo'] = this.informacionAuditoriaPromedioBoncheo;
    data['informacionAuditoriaPromedioCorte'] = this.informacionAuditoriaPromedioCorte;
    data['informacionAuditoriaPromedioLargoFinca'] = this.informacionAuditoriaPromedioLargoFinca;
    data['informacionAuditoriaPorcentajeFlorNacional'] = this.informacionAuditoriaPorcentajeFlorNacional;
    data['CausaId'] = this.causaId;
    data['auditoriaCausaPorcentajeAfectacion'] = this.auditoriaCausaPorcentajeAfectacion;
    // data['Causa2'] = this.causa2;
    // data['porcentajeAfectacionCausa2'] = this.porcentajeAfectacionCausa2;
    // data['Causa3'] = this.causa3;
    // data['porcentajeAfectacionCausa3'] = this.porcentajeAfectacionCausa3;
    // data['Causa4'] = this.causa4;
    // data['porcentajeAfectacionCausa4'] = this.porcentajeAfectacionCausa4;
    // data['Causa5'] = this.causa5;
    // data['porcentajeAfectacionCausa5'] = this.porcentajeAfectacionCausa5;
    return data;
  }
}
