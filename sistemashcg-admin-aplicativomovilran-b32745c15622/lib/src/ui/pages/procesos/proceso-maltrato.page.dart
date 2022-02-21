import 'package:flutter/material.dart';
import 'package:ranking_app/src/ui/widgets/forms_widget.dart';

class ProcesoMaltratoPage extends StatefulWidget {
  final bool valor;
  final int ramosId;  

  const ProcesoMaltratoPage({Key key, this.valor, this.ramosId})
      : super(key: key);

  @override
  _ProcesoMaltratoState createState() =>
      _ProcesoMaltratoState(this.valor, this.ramosId);
}

class _ProcesoMaltratoState extends State<ProcesoMaltratoPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  bool elite = false;
  int ramosId = 1;
  _ProcesoMaltratoState(bool valor, int ramosId) {
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
      body: ProcesoMaltratoForm(),
    );
  }
}
