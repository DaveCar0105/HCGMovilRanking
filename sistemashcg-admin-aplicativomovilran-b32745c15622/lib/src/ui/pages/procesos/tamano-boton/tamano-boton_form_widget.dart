import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:ranking_app/src/ui/widgets/form_field_widget.dart';
import 'package:ranking_app/src/ui/widgets/section_widget.dart';

class ProcesoTamanoBotonForm extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();

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
            _sectionPetalos(),
            _footer(context)
          ],
        ),
      ),
    );
  }

  SurveySection _section() {
    return SurveySection(
      title: Text('Información General Evaluación Finca'),
      content: FormFieldWidget.generateElements({
        
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
      }, _formKey),
    );
  }

  SurveySection _sectionB() {
    return SurveySection(
        title: Text('Variedad a Evaluar'),
        content: FormFieldWidget.generateElements({
          'variedad': {
          'label': 'Variedad',
          'type': FieldType.dropdown,
          'dropdownOptions': [
            '🐶',
            '😀',
            '😍',
          ],
          'required': true
        },
          'gradoCm': {
          'label': 'Grado(cm)',
          'type': FieldType.numeric,
          'required': true
        }
        }, _formKey));
  }

  SurveySection _sectionC() {
    var options = [
      'tallosMuestradosRecepcion',
      'precenciaMaltratoRecepcion',
      'porcentajeIncidenciaRecepcion',
    ];

    return SurveySection(
      title: Text('Recepcion'),
      content: FormFieldWidget.generateElements({
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
          'type': FieldType.numberResult,
        },
      }, _formKey),
    );
  }

  SurveySection _sectionD() {
    var options = [
      'largo',
      'ancho'
      
    ];

    return SurveySection(
      title: Text('AREA DEL RAMO'),
      content: FormFieldWidget.generateElements({
        'largo': {
          'label': 'Largo',
          'type': FieldType.multiplication,
          'options': options,
          'result':'area'
        },
        'ancho': {
          'label': 'Ancho',
          'type': FieldType.multiplication,
          'options': options,
          'result':'area'
        },
        'area': {
          'label': 'El Area es',
          'type': FieldType.numberResult,
        },
      }, _formKey),
    );
  }

  SurveySection _sectionE() {

    var options = [
      'tamanoBoton1',
      'tamanoBoton2',
      'tamanoBoton3',
    ];


    return SurveySection(
      title: Text('Tamano de Boton'),
      content: FormFieldWidget.generateElements({
        'tamanoBoton1': {
          'label': 'Tamano Boton1',
          'type': FieldType.average,
          'options': options,
          'result': 'resultTamanoBoton'
        },
        'tamanoBoton2': {
          'label': 'Tamano Boton2',
          'type': FieldType.average,
          'options': options,
          'result': 'resultTamanoBoton'
        },
        'tamanoBoton3': {
          'label': 'Tamano Boton3',
          'type': FieldType.average,
          'options':options,
          'result': 'resultTamanoBoton'
        },
        'resultTamanoBoton': {
          'label': 'Promedio Tamano Boton',
          'type': FieldType.numberResult,
        },
      }, _formKey),
    );
  }

  SurveySection _sectionPetalos() {
    return SurveySection(
        title: Text('Numero de Petalos'),
        content: FormFieldWidget.generateElements({
          
          'numeroPetalos': {
          'label': 'Numero de Petalos',
          'type': FieldType.numeric,
          'required': true
        }
        }, _formKey));
  }



  Row _footer(BuildContext context) {
    return Row(
      children: <Widget>[
        footerButton(context, "Submit", _onSubmitCallback),
        SizedBox(width: 20),
        footerButton(context, "Reset", _onResetCallbak)
      ],
    );
  }

  Expanded footerButton(BuildContext context, text, callback) {
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
