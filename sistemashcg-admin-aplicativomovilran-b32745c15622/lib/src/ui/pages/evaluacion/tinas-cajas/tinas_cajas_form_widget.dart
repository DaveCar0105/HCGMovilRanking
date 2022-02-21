import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:ranking_app/src/ui/widgets/form_field_widget.dart';
import 'package:ranking_app/src/ui/widgets/section_widget.dart';

class TinasCajasFormWidger extends StatelessWidget {
  TinasCajasFormWidger({Key key}) : super(key: key);

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
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
          'label': 'Sub Finca:a',
          'type': FieldType.dropdown,
          'dropdownOptions': [1, 2, 3, 4],
          'required': true
        },
      }, _formKey),
    );
  }
}
