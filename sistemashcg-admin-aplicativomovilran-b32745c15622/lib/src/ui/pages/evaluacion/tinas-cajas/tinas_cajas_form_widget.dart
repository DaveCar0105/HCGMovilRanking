import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:ranking_app/src/ui/widgets/form_field_widget.dart';
import 'package:ranking_app/src/ui/widgets/section_widget.dart';

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
          ],
        ),
      ),
    );
  }

  SurveySection _sectionA() {
    return SurveySection(
      title: Text('"Información General"'),
      content: FormFieldWidget.generateElements({
        'fechaAuditoria': {
          'label': 'Fecha de Auditoria',
          'type': FieldType.date,
          'required': true
        },
        'nombreFinca': {
          'label': 'Nombre de la Finca',
          'type': FieldType.dropdown,
          'dropdownOptions': ['RDC 1', 'AGRINA', 3, 'a', 'c'],
          'required': true
        },
        'subFinca': {
          'label': 'Sub Finca:',
          'type': FieldType.dropdown,
          'dropdownOptions': [1, 2, 3, 4],
          'required': true
        },
        'codigoDelTecnico': {
          'label': 'Código del técnico',
          'type': FieldType.text,
          'required': true
        },
        'horaInicioAuditoria': {
          'label': 'Hora Inicio de auditoría',
          'type': FieldType.time,
          'required': true
        },
        'tipoEvaluacion': {
          'label': 'Tipo de evaluación',
          'type': FieldType.time,
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
          'label': 'Nombre de la Finca',
          'type': FieldType.dropdown,
          'dropdownOptions': ['RDC 1', 'AGRINA', 3, 'a', 'c'],
          'required': true
        },
        'grado': {
          'label': 'Grado (cm)',
          'type': FieldType.dropdown,
          'required': true
        },
        'tallosPorRamo': {
          'label': 'Tallos x Ramo',
          'type': FieldType.numeric,
          'required': true
        },
        'subFinca': {
          'label': 'Sub Finca:',
          'type': FieldType.dropdown,
          'dropdownOptions': [1, 2, 3, 4],
          'required': true
        },
      }, _formKey),
    );
  }
}
