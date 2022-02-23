import 'package:flutter/material.dart';
import 'package:ranking_app/src/ui/pages/aprobacion/aprobacion-form-widget.dart';

import 'package:ranking_app/src/ui/pages/procesos/tamano-boton/tamano-boton_form_widget.dart';

class AprobacionPage extends StatefulWidget {
  final bool valor;
  final int ramosId;

  const AprobacionPage({Key key, this.valor, this.ramosId})
      : super(key: key);

  @override
  _AprobacionState createState() =>
      _AprobacionState(this.valor, this.ramosId);
}

class _AprobacionState extends State<AprobacionPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  bool elite = false;
  int ramosId = 1;
  _AprobacionState(bool valor, int ramosId) {
    elite = valor;
    ramosId = ramosId;
  }

  @override
  Widget build(BuildContext context) {
    return AprobacionForm();
  }
}