import 'package:flutter/material.dart';

import '../../../../dtos/evaluacion-finca-form-parse.dto.dart';
import '../../../../services/form.service.dart';
import 'evalucion-tinas-cajas.page.dart';
import 'tinas_cajas_form_widget.dart';

class EvaluacionTinasCajasSeleccionPage extends StatefulWidget {
  bool valor;
  int ramosId;
  EvaluacionTinasCajasSeleccionPage(bool valor, int ramosId) {
    this.valor = valor;
    this.ramosId = ramosId;
  }

  @override
  _EvaluacionTinasCajasState createState() =>
      _EvaluacionTinasCajasState(this.valor, this.ramosId);
}

class _EvaluacionTinasCajasState
    extends State<EvaluacionTinasCajasSeleccionPage> {
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  bool elite = false;
  int ramosId = 1;
  _EvaluacionTinasCajasState(bool valor, int ramosId) {
    elite = valor;
    ramosId = ramosId;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('Selecciona un formulario'),
      ),
      body: FutureBuilder(
        future: FormService().retrieveForm(),
        builder: (_, s) {
          if (s.hasError) return CircularProgressIndicator();

          List<Forms> forms = s.data;
          return ListView.builder(
              itemCount: forms?.length ?? 0,
              itemBuilder: (_, i) {
                Forms actualForms = forms[i];
                return ListTile(
                  title: Text(actualForms.formularioNombreDesplazar),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            EvaluacionTinasCajasPage(actualForms),
                      ),
                    );
                  },
                );
              });
        },
      ),
    );
  }
}
