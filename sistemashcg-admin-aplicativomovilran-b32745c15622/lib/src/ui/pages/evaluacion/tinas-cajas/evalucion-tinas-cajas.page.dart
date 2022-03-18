import 'package:flutter/material.dart';

import '../../../../dtos/evaluacion-finca-form-parse.dto.dart';
import 'tinas_cajas_form_widget.dart';

class EvaluacionTinasCajasPage extends StatelessWidget {
  final Forms forms;

  EvaluacionTinasCajasPage(this.forms);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EVALUACION DE TINAS Y CAJAS'),
      ),
      body: TinasCajasFormWidger(
        form: forms,
      ),
    );
  }
}
