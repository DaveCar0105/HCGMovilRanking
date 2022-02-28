import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../../locator.dart';
import '../../../../dtos/evaluacion-finca-mock.dart';
import '../../../../repositories/postcosecha.repository.dart';
import '../../../../repositories/variedad.repository.dart';
import '../../../widgets/category_section.dart';
import '../../../widgets/form_field_widget.dart';
import '../../../widgets/section_widget.dart';
import '../../../widgets/selectable_selection.dart';

class TinasCajasFormWidger extends StatelessWidget {
  TinasCajasFormWidger({Key key}) : super(key: key);

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: FormBuilder(
        key: _formKey,
        child: ListView(
          children: [
            _sectionA(),
            _sectionB(),
            CategorySection(
              formKey: _formKey,
              category: EvaluacionFincaMock.category,
            ),
          ],
        ),
      ),
    );
  }

  SurveySection _sectionA() {
    return SurveySection(
      title: Text('Información General'),
      content: FormFieldWidget.generateElements({
        'postcosechaId': {
          'label': 'Nombre Sub-Finca (si aplica) ',
          'type': FieldType.futureField,
          'subType': FieldType.dropdown,
          'future': locator<PostcosechaRepository>().selectAllGeneric(),
          'required': true
        },
        'tipoEvaluacion': {
          'label': 'Tipo evaluacion',
          'type': FieldType.dropdown,
          'dropdownOptions': ['TINA', 'CAJA'],
          'required': true
        },
      }, _formKey),
    );
  }

  SurveySection _sectionB() {
    return SurveySection(
      title: Text('Evaluación en Lineas de Producción'),
      content: FormFieldWidget.generateElements({
        'mesaEvaluar': {
          'label': 'Mesa a Evaluar',
          'type': FieldType.text,
          'required': true
        },
        'variedad': {
          'label': 'Tipo Variedad',
          'type': FieldType.futureField,
          'subType': FieldType.dropdown,
          'future': locator<VariedadRepository>().selectAllGeneric(),
          'required': true
        },
        'grado': {
          'label': 'Grado (cm)',
          'type': FieldType.numeric,
          'required': true
        },
        'tallosPorRamo': {
          'label': 'Tallos x Ramo',
          'type': FieldType.numeric,
          'required': true
        },
      }, _formKey),
    );
  }
}
