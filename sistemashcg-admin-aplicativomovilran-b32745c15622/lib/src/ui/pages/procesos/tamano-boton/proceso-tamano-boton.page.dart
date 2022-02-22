import 'package:flutter/material.dart';
import 'package:ranking_app/src/ui/pages/procesos/maltrato/maltrato_form_widget.dart';
import 'package:ranking_app/src/ui/pages/procesos/tamano-boton/tamano-boton_form_widget.dart';

class ProcesoTamanoBotonPage extends StatefulWidget {
  final bool valor;
  final int ramosId;

  const ProcesoTamanoBotonPage({Key key, this.valor, this.ramosId})
      : super(key: key);

  @override
  _ProcesoTamanoBotonState createState() =>
      _ProcesoTamanoBotonState(this.valor, this.ramosId);
}

class _ProcesoTamanoBotonState extends State<ProcesoTamanoBotonPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  bool elite = false;
  int ramosId = 1;
  _ProcesoTamanoBotonState(bool valor, int ramosId) {
    elite = valor;
    ramosId = ramosId;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('PROCESO MALTRATO'),
      ),
      body: ProcesoTamanoBotonForm(),
    );
  }
}

