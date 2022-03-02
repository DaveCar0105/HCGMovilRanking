import 'package:flutter/material.dart';
import 'package:ranking_app/locator.dart';

import '../../../../services/sincronize-information-server.service.dart';
import 'tinas_cajas_form_widget.dart';

class EvaluacionTinasCajasPage extends StatefulWidget {
  bool valor;
  int ramosId;
  EvaluacionTinasCajasPage(bool valor, int ramosId) {
    this.valor = valor;
    this.ramosId = ramosId;
  }

  @override
  _EvaluacionTinasCajasState createState() =>
      _EvaluacionTinasCajasState(this.valor, this.ramosId);
}

class _EvaluacionTinasCajasState extends State<EvaluacionTinasCajasPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  bool elite = false;
  int ramosId = 1;
  _EvaluacionTinasCajasState(bool valor, int ramosId) {
    elite = valor;
    ramosId = ramosId;
  }

  @override
  void initState() {
    super.initState();
    retrieveData();
  }

  retrieveData() async {
    var a = await locator<SincronizeServerInformation>().getFormulario();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('EVALUACION DE TINAS Y CAJAS'),
      ),
      body: TinasCajasFormWidger(),
    );
  }
}
