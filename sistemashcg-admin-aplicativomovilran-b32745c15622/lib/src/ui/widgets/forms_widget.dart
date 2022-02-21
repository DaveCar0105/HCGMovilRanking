import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:ranking_app/src/ui/widgets/form_field_widget.dart';
import 'package:ranking_app/src/ui/widgets/section_widget.dart';

class ProcesoMaltratoForm extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: FormBuilder(
        key: _formKey,
        child: Stack(
          children: [
            ListView(
              children: [
                _section(),
                _sectionB(),
                _sectionC(),
                _sectionD(),
                _sectionE(),
                _sectionF(),
                _footer(context)
              ],
            ),
          ],
        ),
      ),
    );
  }

  SurveySection _section() {
    return SurveySection(
      title: Text('Información General Evaluación Finca'),
      content: generateElements(
        {
          'fechaAuditoria': {
            'label': 'Fecha de Auditoria',
            'type': FieldType.date,
            'required': true
          },
          'codigoTecnico': {
            'label': 'Código del técnico',
            'type': FieldType.text,
            'required': true
          },
          'nombreFinca': {
            'label': 'Nombre de la Finca',
            'type': FieldType.dropdown,
            'dropdownOptions': [1, '2', 3, 'a', 'c'],
            'required': true
          },
          'nombreSubFinca': {
            'label': 'Nombre Sub-Finca (si aplica) ',
            'type': FieldType.dropdown,
            'dropdownOptions': [
              '🐶',
              '😀',
              '😍',
            ],
            'required': true
          }
        },
      ),
    );
  }

  SurveySection _sectionB() {
    return SurveySection(
        title: Text('Variedad a Evaluar'),
        content: generateElements(
          {
            'variedad': {
              'label': 'Variedad',
              'required': true,
            },
          },
        ));
  }

  SurveySection _sectionC() {
    var options = [
      'tallosMuestradosRecepcion',
      'precenciaMaltratoRecepcion',
      'porcentajeIncidenciaRecepcion',
    ];

    return SurveySection(
      title: Text('Recepcion'),
      content: generateElements(
        {
          'tallosMuestradosRecepcion': {
            'label': 'Tallos Muestreados Recepción',
            'type': FieldType.average,
            'options': options,
          },
          'precenciaMaltratoRecepcion': {
            'label': 'Presencia de Maltrato Recepción....',
            'type': FieldType.average,
            'options': options,
          },
          'porcentajeIncidenciaRecepcion': {
            'label': '% Incidencia Recepción',
            'type': FieldType.averageResult,
          },
        },
      ),
    );
  }

  SurveySection _sectionD() {
    var options = [
      'tallosMuestradosClasificación',
      'precenciaMaltratoClasificación',
      'porcentajeIncidenciaClasificación',
    ];

    return SurveySection(
      title: Text('Clasificación - Boncheo'),
      content: generateElements(
        {
          'tallosMuestradosClasificación': {
            'label': 'Tallos Muestreados Clasificación',
            'type': FieldType.average,
            'options': options,
          },
          'precenciaMaltratoClasificación': {
            'label': 'Presencia de Maltrato Clasificación',
            'type': FieldType.average,
            'options': options,
          },
          'porcentajeIncidenciaClasificación': {
            'label': '% Incidencia Clasificación',
            'type': FieldType.averageResult,
          },
        },
      ),
    );
  }

  SurveySection _sectionE() {
    var options = [
      'tallosMuestreadosCuartoFrio',
      'presenciaMaltratoCuartoFrio',
      'porcentajeIncidenciaCuartoFrio',
    ];

    return SurveySection(
      title: Text('Cuarto Frio'),
      content: generateElements(
        {
          'tallosMuestreadosCuartoFrio': {
            'label': 'Tallos Muestreados Cuarto Frio',
            'type': FieldType.average,
            'options': options,
          },
          'presenciaMaltratoCuartoFrio': {
            'label': 'Presencia de Maltrato Cuarto Frio',
            'type': FieldType.average,
            'options': options,
          },
          'porcentajeIncidenciaCuartoFrio': {
            'label': '% Incidencia Cuarto Frio',
            'type': FieldType.averageResult,
          },
        },
      ),
    );
  }

  SurveySection _sectionF() {
    var options = [
      'tallosMuestreadosEmpaque',
      'presenciaMaltratoEmpaque',
      'porcentajeIncidenciaEmpaque',
    ];
    var b = SurveySection(
      title: Text('Empaque'),
      content: generateElements(
        {
          'tallosMuestreadosEmpaque': {
            'label': 'Tallos Muestreados Empaque',
            'type': FieldType.average,
            'options': options,
          },
          'presenciaMaltratoEmpaque': {
            'label': 'Presencia de Maltrato Empaque',
            'type': FieldType.average,
            'options': options,
          },
          'porcentajeIncidenciaEmpaque': {
            'label': '% Incidencia Empaque',
            'type': FieldType.averageResult,
          },
        },
      ),
    );

    return b;
  }

  Row _footer(BuildContext context) {
    return Row(
      children: <Widget>[
        fotterButton(context, "Submit", _onSubmitCallback),
        SizedBox(width: 20),
        fotterButton(context, "Reset", _onResetCallbak)
      ],
    );
  }

  Expanded fotterButton(BuildContext context, text, callback) {
    return Expanded(
      child: MaterialButton(
        color: Theme.of(context).colorScheme.secondary,
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
        onPressed: callback,
      ),
    );
  }

  generateElements(Map args) {
    return args.entries
        .map((e) => FormFieldWidget(
              formKey: _formKey,
              element: e,
            ))
        .toList();
  }

  void _onSubmitCallback() {
    _formKey.currentState.save();
    var result = _formKey.currentState.value;
    if (_formKey.currentState.validate()) {
      print(_formKey.currentState.value);
    } else {
      print("validation failed");
    }
  }

  void _onResetCallbak() {
    _formKey.currentState.reset();
  }
}
