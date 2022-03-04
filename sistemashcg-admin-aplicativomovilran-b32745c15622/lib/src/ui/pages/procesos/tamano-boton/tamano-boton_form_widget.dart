import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import '../../../../../locator.dart';
import '../../../../preference.dart';
import '../../../widgets/form_field_widget.dart';
import '../../../widgets/section_widget.dart';

import '../../../../dtos/session.dto.dart';
import '../../../../dtos/tamano-boton.dto.dart';
import '../../../../repositories/postcosecha.repository.dart';
import '../../../../repositories/tamano-boton.repository.dart';
import '../../../../repositories/variedad.repository.dart';

class ProcesoTamanoBotonForm extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();
  var cache = {};

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
            // _sectionC(),
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
        'postcosechaId': {
          'label': 'Nombre de la Finca',
          'type': FieldType.futureField,
          'subType': FieldType.dropdown,
          'future': locator<PostcosechaRepository>().selectAllGeneric(),
          'required': true
        },
        'postcosechaChiId': {
          'label': 'Nombre Sub-Finca (si aplica) ',
          'type': FieldType.futureField,
          'subType': FieldType.dropdown,
          'future': locator<PostcosechaRepository>().selectAllGeneric(),
          'required': true
        }
      }, _formKey, cache: cache),
    );
  }

  SurveySection _sectionB() {
    return SurveySection(
        title: Text('Variedad a Evaluar'),
        content: FormFieldWidget.generateElements({
          'variedadId': {
            'label': 'Variedad Nombre ',
            'type': FieldType.futureField,
            'subType': FieldType.dropdown,
            'future': locator<VariedadRepository>().selectAllGeneric(),
            'required': true
          },
          'procesoTamanioBotonGradoVariedad': {
            'label': 'Grado(cm)',
            'type': FieldType.numeric,
            'required': true
          }
        }, _formKey, cache: cache));
  }

  SurveySection _sectionD() {
    var options = [
      'procesoTamanioBotonLargoArea',
      'procesoTamanioBotonAnchoArea'
    ];

    return SurveySection(
      title: Text('AREA DEL RAMO'),
      content: FormFieldWidget.generateElements({
        'procesoTamanioBotonLargoArea': {
          'label': 'Largo',
          'type': FieldType.multiplication,
          'options': options,
          'result': 'procesoTamanioBotonAreaRamo'
        },
        'procesoTamanioBotonAnchoArea': {
          'label': 'Ancho',
          'type': FieldType.multiplication,
          'options': options,
          'result': 'procesoTamanioBotonAreaRamo'
        },
        'procesoTamanioBotonAreaRamo': {
          'label': 'El Area es',
          'type': FieldType.numberResult,
        },
      }, _formKey, cache: cache),
    );
  }

  SurveySection _sectionE() {
    var options = [
      'procesoTamanioBotonTamanoBoton1',
      'procesoTamanioBotonTamanoBoton2',
      'procesoTamanioBotonTamanoBoton3',
    ];

    return SurveySection(
      title: Text('Tamano de Boton'),
      content: FormFieldWidget.generateElements({
        'procesoTamanioBotonTamanoBoton1': {
          'label': 'Tamano Boton1',
          'type': FieldType.average,
          'options': options,
          'result': 'procesoTamanioBotonTamanoBotonPromedio'
        },
        'procesoTamanioBotonTamanoBoton2': {
          'label': 'Tamano Boton2',
          'type': FieldType.average,
          'options': options,
          'result': 'procesoTamanioBotonTamanoBotonPromedio'
        },
        'procesoTamanioBotonTamanoBoton3': {
          'label': 'Tamano Boton3',
          'type': FieldType.average,
          'options': options,
          'result': 'procesoTamanioBotonTamanoBotonPromedio'
        },
        'procesoTamanioBotonTamanoBotonPromedio': {
          'label': 'Promedio Tamano Boton',
          'type': FieldType.numberResult,
        },
        // 'foto': {
        //   'label': 'Promedio Tamano Boton',
        //   'type': FieldType.photo,
        // },
      }, _formKey),
    );
  }

  SurveySection _sectionPetalos() {
    return SurveySection(
        title: Text('Numero de Petalos'),
        content: FormFieldWidget.generateElements({
          'procesoTamanioBotonNumeroPetalos': {
            'label': 'Numero de Petalos',
            'type': FieldType.numeric,
            'required': true
          }
        }, _formKey, cache: cache));
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

  void _onSubmitCallback() async {
    var result = Map.of(_formKey.currentState.instantValue);
    cache.entries.forEach((element) {
      result[element.key] = element.value;
    });
    var insertResult;

    try {
      var dto = TamanoBotonDto.fromJson(result);
      SessionDto sesionDto = locator<Preferences>().getAutentication;
      dto.usuarioId = sesionDto?.usuarioDto?.usuarioId ?? 1;
      print("ingreso 1235");
      dto.procesoTamanioBotonFecha = DateTime.now().toLocal();
      insertResult = await locator<TamanoBotonRepository>().insert(dto);
      //var resultForm = await locator<TamanoBotonRepository>().selectAll();
      print(insertResult.toString());
    } catch (e) {
      print("asdsad " + e.toString());
    }
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
