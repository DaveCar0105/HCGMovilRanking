import 'package:flutter/material.dart';
import 'package:ranking_app/src/repositories/cliente.repository.dart';
import 'package:ranking_app/src/ui/pages/procesos/maltrato/maltrato_form_widget.dart';

import '../../../../../locator.dart';
import '../../../../repositories/postcosecha.repository.dart';

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
  void initState() {
    super.initState();
    _retrieveClients();
  }

  _retrieveClients() async {
    var clientes = locator<ClienteRepository>();
    var postCoseche = locator<PostcosechaRepository>();
    try {
      var clientsList = await clientes.selectAll();
      var postCosechaList = await postCoseche.selectAll();
      print('');
    } catch (e) {
      debugPrint(e);
    }
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
