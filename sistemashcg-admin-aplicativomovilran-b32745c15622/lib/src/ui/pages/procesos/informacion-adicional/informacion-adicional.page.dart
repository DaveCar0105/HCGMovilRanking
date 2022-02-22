import 'package:flutter/material.dart';
import 'package:ranking_app/src/ui/pages/procesos/informacion-adicional/informacion-adicional-form-widget.dart';

class ProcesoInformacionAdicionalPage extends StatefulWidget {
  final bool valor;
  final int ramosId;

  const ProcesoInformacionAdicionalPage({Key key, this.valor, this.ramosId})
      : super(key: key);

  @override
  _ProcesoInformacionAdicionalState createState() =>
      _ProcesoInformacionAdicionalState(this.valor, this.ramosId);
}

class _ProcesoInformacionAdicionalState
    extends State<ProcesoInformacionAdicionalPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  bool elite = false;
  int ramosId = 1;
  _ProcesoInformacionAdicionalState(bool valor, int ramosId) {
    elite = valor;
    ramosId = ramosId;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('INFORMACION\nADICIONAL'),
      ),
      body: ProcesoInformacionAdicionalForm(),
    );
  }
}
