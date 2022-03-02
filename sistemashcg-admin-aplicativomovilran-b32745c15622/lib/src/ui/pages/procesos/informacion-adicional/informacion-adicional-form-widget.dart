import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:ranking_app/src/dtos/info-adic.dto.dart';
import 'package:ranking_app/src/dtos/session.dto.dart';
import 'package:ranking_app/src/preference.dart';
import 'package:ranking_app/src/repositories/informacion-adicional.repository.dart';
import 'package:ranking_app/src/ui/widgets/form_field_widget.dart';
import 'package:ranking_app/src/ui/widgets/section_widget.dart';

import '../../../../../locator.dart';
import '../../../../repositories/causa.repository.dart';
import '../../../../repositories/postcosecha.repository.dart';

class ProcesoInformacionAdicionalForm extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: FormBuilder(
        key: _formKey,
        child: ListView(
          children: [_section(), _sectionB(), _sectionC(), _footer(context)],
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
      }, _formKey),
    );
  }

  SurveySection _sectionB() {
    return SurveySection(
        title: Text('Rendimiento Promedio'),
        content: FormFieldWidget.generateElements({
          'informacionAuditoriaPromedioSala': {
            'label': 'Rendimiento Sala',
            'type': FieldType.numeric,
            'required': true,
          },
          'informacionAuditoriaPromedioBoncheo': {
            'label': 'Rendimiento Boncheo',
            'type': FieldType.numeric,
            'required': true,
          },
          'informacionAuditoriaPromedioCorte': {
            'label': 'Rendimiento Corte',
            'type': FieldType.numeric,
            'required': true,
          },
          'informacionAuditoriaPromedioLargoFinca': {
            'label': 'Largo Promedio de la Finca',
            'type': FieldType.numeric,
            'required': true,
          },
        }, _formKey));
  }

  SurveySection _sectionC() {
    return SurveySection(
      title: Text('Flor Nacional'),
      content: FormFieldWidget.generateElements({
        'informacionAuditoriaPorcentajeFlorNacional': {
          'label': '% Flor Nacional',
          'type': FieldType.numeric,
          'required': true
        },
        'CausaId': {
          'label': 'Seleccione una causa',
          'type': FieldType.futureField,
          'subType': FieldType.dropdown,
          'future': locator<CausaRepository>().selectAllGeneric(),
          'required': true
        },
        'auditoriaCausaPorcentajeAfectacion': {
          'label': '% Afectacion Causa 01',
          'type': FieldType.numeric,
          'required': true
        },
        'Causa2': {
          'label': 'Seleccione una causa',
          'type': FieldType.futureField,
          'subType': FieldType.dropdown,
          'future': locator<CausaRepository>().selectAllGeneric(),
          'required': true
        },
        'porcentajeAfectacionCausa2': {
          'label': '% Afectacion Causa 02',
          'type': FieldType.numeric,
          'required': true
        },
        'Causa3': {
          'label': 'Seleccione una causa',
          'type': FieldType.futureField,
          'subType': FieldType.dropdown,
          'future': locator<CausaRepository>().selectAllGeneric(),
          'required': true
        },
        'porcentajeAfectacionCausa3': {
          'label': '% Afectacion Causa 03',
          'type': FieldType.numeric,
          'required': true
        },
        'Causa4': {
          'label': 'Seleccione una causa',
          'type': FieldType.futureField,
          'subType': FieldType.dropdown,
          'future': locator<CausaRepository>().selectAllGeneric(),
          'required': true
        },
        'porcentajeAfectacionCausa4': {
          'label': '% Afectacion Causa 04',
          'type': FieldType.numeric,
          'required': true
        },
        'Causa5': {
          'label': 'Seleccione una causa',
          'type': FieldType.futureField,
          'subType': FieldType.dropdown,
          'future': locator<CausaRepository>().selectAllGeneric(),
          'required': true
        },
        'porcentajeAfectacionCausa5': {
          'label': '% Afectacion Causa 05',
          'type': FieldType.numeric,
          'required': true
        },
      }, _formKey),
    );
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
    _formKey.currentState.save();
    var result = _formKey.currentState.value;
    var insertResult;

    try {
      var dto = InformacionAdicionalDto.fromJson(result);
      SessionDto sesionDto = locator<Preferences>().getAutentication;
      dto.usuarioId = sesionDto?.usuarioDto?.usuarioId ?? 1;
      dto.informacionAuditoriaFecha = DateTime.now().toLocal();
      insertResult =
          await locator<InformacionAdicionalRepository>().insert(dto);

      //var resultForm = await locator<MaltratoRepository>().selectAll();
      print("Resultado maltrato: " + insertResult.toString());
      //print(result.toString());
    } catch (e) {
      print(e.toString());
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
