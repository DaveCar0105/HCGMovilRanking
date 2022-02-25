import 'package:expandable_widgets/expandable_widgets.dart';
import 'package:flutter/material.dart';
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

  

  Widget _optionB1() {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Expandable(
        primaryWidget: Container(
          height: 50,
          child: Text(
              'Desea registrar\nevaluación en BONCHADORA\n/ PRESENTACIÓN BONCH'),
        ),
        secondaryWidget: SurveySection(
          title: Text('"Información General"'),
          content: FormFieldWidget.generateElements({
            'erroresEnLongitud': {
              'label': 'Errores en Longitud',
              'type': FieldType.numeric,
              'required': true
            },
            'dtoPuntosLongitud': {
              'label': 'Dto. puntos: Longitud',
              'type': FieldType.numeric,
              'required': true
            },
            'dtoPuntosLongitud': {
              'label': 'Dto. puntos: Longitud',
              'type': FieldType.numeric,
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
        ),
        backgroundColor: Colors.grey.withOpacity(0.4),
        showArrowIcon: true,
        centralizePrimaryWidget: true,
        isClickable: true,
        padding: EdgeInsets.all(5.0),
      ),
    );

    /* Padding(
      padding: const EdgeInsets.only(top:15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Desea registrar evaluación en BONCHADORA / PRESENTACIÓN BONCH'),
          CheckboxGroup(
            orientation: GroupedButtonsOrientation.HORIZONTAL,
            labels: <String>[
              "SI",
              "NO",
            ],
            checked: _checkedbonchadoraPresentacion,
            onChange: (bool isChecked, String label, int index) =>
                print("isChecked: $isChecked   label: $label  index: $index"),
            onSelected: (List selected) => setState(() {
              if (selected.length > 1) {
                selected.removeAt(0);
                print('selected length  ${selected.length}');
              } else {
                print("only one");
              }
              _checkedbonchadoraBoton = selected;
            }),
          ),
        ],
      ),
    ); */
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
