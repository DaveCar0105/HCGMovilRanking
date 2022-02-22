import 'package:flutter/material.dart';
import 'package:ranking_app/src/ui/pages/procesos/reporte-auditoria/reporte-auditoria-agenciahc-form-widget.dart';

class ProcesoReporteAuditoriaAgenciahcPage extends StatefulWidget {
  final bool valor;
  final int ramosId;

  const ProcesoReporteAuditoriaAgenciahcPage(
      {Key key, this.valor, this.ramosId})
      : super(key: key);

  @override
  _ProcesoReporteAuditoriaAgenciahcState createState() =>
      _ProcesoReporteAuditoriaAgenciahcState(this.valor, this.ramosId);
}

class _ProcesoReporteAuditoriaAgenciahcState
    extends State<ProcesoReporteAuditoriaAgenciahcPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  bool elite = false;
  int ramosId = 1;
  _ProcesoReporteAuditoriaAgenciahcState(bool valor, int ramosId) {
    elite = valor;
    ramosId = ramosId;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('REPORTE DE AUDITORIAS'),
      ),
      body: ProcesoReporteAuditoriaAgenciahcForm(),
    );
  }
}
