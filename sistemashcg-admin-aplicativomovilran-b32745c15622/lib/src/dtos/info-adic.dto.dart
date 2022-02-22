import 'dart:convert';

InformacionAdicionalDto tamanoBotonDtoFromJson(String str) =>
    InformacionAdicionalDto.fromJson(json.decode(str));
String tamanoBotonDtoToJson(InformacionAdicionalDto data) =>
    json.encode(data.toJson());

class InformacionAdicionalDto {
  String nombreFinca;
  String nombreSubFinca;
  double rendimientoSala;
  double rendimientoBoncheo;
  double rendimientoCorte;
  double rendimientoFinca;
  double porcentajeFlorNacional;
  String causa1;
  double porcentajeAfectacionCausa1;
  String causa2;
  double porcentajeAfectacionCausa2;
  String causa3;
  double porcentajeAfectacionCausa3;
  String causa4;
  double porcentajeAfectacionCausa4;
  String causa5;
  String porcentajeAfectacionCausa5;

  InformacionAdicionalDto(
      {this.nombreFinca,
      this.nombreSubFinca,
      this.rendimientoSala,
      this.rendimientoBoncheo,
      this.rendimientoCorte,
      this.rendimientoFinca,
      this.porcentajeFlorNacional,
      this.causa1,
      this.porcentajeAfectacionCausa1,
      this.causa2,
      this.porcentajeAfectacionCausa2,
      this.causa3,
      this.porcentajeAfectacionCausa3,
      this.causa4,
      this.porcentajeAfectacionCausa4,
      this.causa5,
      this.porcentajeAfectacionCausa5});

  InformacionAdicionalDto.fromJson(Map<String, dynamic> json) {
    nombreFinca = json['nombreFinca'];
    nombreSubFinca = json['nombreSubFinca'];
    rendimientoSala = json['RendimientoSala'];
    rendimientoBoncheo = json['RendimientoBoncheo'];
    rendimientoCorte = json['RendimientoCorte'];
    rendimientoFinca = json['RendimientoFinca'];
    porcentajeFlorNacional = json['porcentajeFlorNacional'];
    causa1 = json['Causa1'];
    porcentajeAfectacionCausa1 = json['porcentajeAfectacionCausa1'];
    causa2 = json['Causa2'];
    porcentajeAfectacionCausa2 = json['porcentajeAfectacionCausa2'];
    causa3 = json['Causa3'];
    porcentajeAfectacionCausa3 = json['porcentajeAfectacionCausa3'];
    causa4 = json['Causa4'];
    porcentajeAfectacionCausa4 = json['porcentajeAfectacionCausa4'];
    causa5 = json['Causa5'];
    porcentajeAfectacionCausa5 = json['porcentajeAfectacionCausa5'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nombreFinca'] = this.nombreFinca;
    data['nombreSubFinca'] = this.nombreSubFinca;
    data['RendimientoSala'] = this.rendimientoSala;
    data['RendimientoBoncheo'] = this.rendimientoBoncheo;
    data['RendimientoCorte'] = this.rendimientoCorte;
    data['RendimientoFinca'] = this.rendimientoFinca;
    data['porcentajeFlorNacional'] = this.porcentajeFlorNacional;
    data['Causa1'] = this.causa1;
    data['porcentajeAfectacionCausa1'] = this.porcentajeAfectacionCausa1;
    data['Causa2'] = this.causa2;
    data['porcentajeAfectacionCausa2'] = this.porcentajeAfectacionCausa2;
    data['Causa3'] = this.causa3;
    data['porcentajeAfectacionCausa3'] = this.porcentajeAfectacionCausa3;
    data['Causa4'] = this.causa4;
    data['porcentajeAfectacionCausa4'] = this.porcentajeAfectacionCausa4;
    data['Causa5'] = this.causa5;
    data['porcentajeAfectacionCausa5'] = this.porcentajeAfectacionCausa5;
    return data;
  }
}
