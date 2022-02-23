import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:ranking_app/locator.dart';
import 'package:ranking_app/src/repositories/cliente.repository.dart';
import 'package:ranking_app/src/repositories/postcosecha.repository.dart';
import 'package:ranking_app/src/repositories/variedad.repository.dart';
import 'package:ranking_app/src/ui/widgets/form_field_widget.dart';
import 'package:ranking_app/src/ui/widgets/form_footer.widget.dart';
import 'package:ranking_app/src/ui/widgets/section_widget.dart';

class ProcesoMaltratoForm extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();
  final clientes = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: FormBuilder(
        key: _formKey,
        child: ListView(
          children: [
            _section(),
            _sectionB(),
            _sectionC(),
            _sectionD(),
            _sectionE(),
            _sectionF(),
            FormFooter(
              onSubmit: _onSubmitCallback,
              onReset: _onResetCallbak,
            ),
          ],
        ),
      ),
    );
  }

  SurveySection _section() {
    return SurveySection(
      title: Text('Información General Evaluación Finca'),
      content: FormFieldWidget.generateElements({
        'postcosechaId': {
          'label': 'Nombre de la Finca',
          'type': FieldType.futureField,
          'subType': FieldType.dropdown,
          'dropdownOptions': clientes,
          'future': locator<ClienteRepository>().selectAllGeneric(),
          'required': true
        },
        'postcosechaId': {
          'label': 'Nombre Sub-Finca (si aplica) ',
          'type': FieldType.futureField,
          'subType': FieldType.dropdown,
          'dropdownOptions': clientes,
          'future': locator<VariedadRepository>().selectAllGeneric(),
        }
      }, _formKey),
    );
  }

  SurveySection _sectionB() {
    return SurveySection(
        title: Text('Variedad a Evaluar'),
        content: FormFieldWidget.generateElements({
         'variedadId': {
          'label': 'Nombre Sub-Finca (si aplica) ',
          'type': FieldType.dropdown,
          'dropdownOptions': [
            '🐶',
            '😀',
            '😍',
          ],
          'required': true
        }
        }, _formKey));
  }

  SurveySection _sectionC() {
    var options = [
      'procesoMaltratoTallosMuestreadoRecepcion',
      'procesoMaltratoTallosMaltratoRecepcion',
      'procesoMaltratoPorcentajeIndicenciaRecepcion',
    ];

    return SurveySection(
      title: Text('Recepcion'),
      content: FormFieldWidget.generateElements({
        'procesoMaltratoTallosMuestreadoRecepcion': {
          'label': 'Tallos Muestreados Recepción',
          'type': FieldType.average,
          'options': options,
        },
        'procesoMaltratoTallosMaltratoRecepcion': {
          'label': 'Presencia de Maltrato Recepción....',
          'type': FieldType.average,
          'options': options,
        },
        'procesoMaltratoPorcentajeIndicenciaRecepcion': {
          'label': '% Incidencia Recepción',
          'type': FieldType.numberResult,
        },
      }, _formKey),
    );
  }

  SurveySection _sectionD() {
    var options = [
      'procesoMaltratoTallosMuestreadoBoncheo',
      'procesoMaltratoTallosMaltratoBoncheo',
      'procesoMaltratoPorcentajeIndicenciaBoncheo',
    ];

    return SurveySection(
      title: Text('Clasificación - Boncheo'),
      content: FormFieldWidget.generateElements({
        'procesoMaltratoTallosMuestreadoBoncheo': {
          'label': 'Tallos Muestreados Clasificación',
          'type': FieldType.average,
          'options': options,
        },
        'procesoMaltratoTallosMaltratoBoncheo': {
          'label': 'Presencia de Maltrato Clasificación',
          'type': FieldType.average,
          'options': options,
        },
        'procesoMaltratoPorcentajeIndicenciaBoncheo': {
          'label': '% Incidencia Clasificación',
          'type': FieldType.numberResult,
        },
      }, _formKey),
    );
  }

  SurveySection _sectionE() {
    var options = [
      'procesoMaltratoTallosMuestreadoCuartoFrio',
      'procesoMaltratoTallosMaltratoCuartoFrio',
      'procesoMaltratoPorcentajeIndicenciaCuartoFrio',
    ];

    return SurveySection(
      title: Text('Cuarto Frio'),
      content: FormFieldWidget.generateElements({
        'procesoMaltratoTallosMuestreadoCuartoFrio': {
          'label': 'Tallos Muestreados Cuarto Frio',
          'type': FieldType.average,
          'options': options,
        },
        'procesoMaltratoTallosMaltratoCuartoFrio': {
          'label': 'Presencia de Maltrato Cuarto Frio',
          'type': FieldType.average,
          'options': options,
        },
        'procesoMaltratoPorcentajeIndicenciaCuartoFrio': {
          'label': '% Incidencia Cuarto Frio',
          'type': FieldType.numberResult,
        },
      }, _formKey),
    );
  }

  SurveySection _sectionF() {
    var options = [
      'procesoMaltratoTallosMuestreadoEmpaque',
      'procesoMaltratoTallosMaltratoEmpaque',
      'procesoMaltratoPorcentajeIndicenciaEmpaque',
    ];
    var b = SurveySection(
      title: Text('Empaque'),
      content: FormFieldWidget.generateElements({
        'procesoMaltratoTallosMuestreadoEmpaque': {
          'label': 'Tallos Muestreados Empaque',
          'type': FieldType.average,
          'options': options,
        },
        'procesoMaltratoTallosMaltratoEmpaque': {
          'label': 'Presencia de Maltrato Empaque',
          'type': FieldType.average,
          'options': options,
        },
        'procesoMaltratoPorcentajeIndicenciaEmpaque': {
          'label': '% Incidencia Empaque',
          'type': FieldType.numberResult,
        },
      }, _formKey),
    );

    return b;
  }

  void _onSubmitCallback() {
    _formKey.currentState.save();
    var result = _formKey.currentState.value;

    print(result.toString());
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
