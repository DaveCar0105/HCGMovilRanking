import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../../locator.dart';
import '../../../../dtos/evaluacion-finca-form-parse.dto.dart';
import '../../../../dtos/evaluacion-finca-mock.dart';
import '../../../../dtos/evaluacion-finca-parse.dto.dart';
import '../../../../dtos/session.dto.dart';
import '../../../../preference.dart';
import '../../../../repositories/evaluacion-detalle.repository.dart';
import '../../../../repositories/variedad.repository.dart';
import '../../../widgets/category_section.dart';
import '../../../widgets/form_field_widget.dart';
import '../../../widgets/form_footer.widget.dart';
import '../../../widgets/section_widget.dart';

class EvaluacionDetalle extends StatelessWidget {
  EvaluacionDetalle({Key key, this.form}) : super(key: key);

  final _formKey = GlobalKey<FormBuilderState>();
  var cache = {};
  //final EvaluacionFincaParseDetalleDto evaluacion;
  final Forms form;
  var mock = EvaluacionFincaDto.category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalle Evaluacion"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FormBuilder(
          key: _formKey,
          child: ListView(
            children: [
              _sectionB(),
              CategorySection(
                formKey: _formKey,
                category: form?.categorias[0] ?? Categoria(),
              ),
              FormFooter(
                onSubmit: _onSubmitCallback,
                onReset: _onResetCallbak,
              ),
            ],
          ),
        ),
      ),
    );
  }

  SurveySection _sectionB() {
    return SurveySection(
      title: Text('Evaluación en Lineas de Producción'),
      content: FormFieldWidget.generateElements({
        'numeroMesa': {
          'label': 'Mesa a Evaluar',
          'type': FieldType.text,
          'required': true
        },
        'variedadId': {
          'label': 'Tipo Variedad',
          'type': FieldType.futureField,
          'subType': FieldType.dropdown,
          'future': locator<VariedadRepository>().selectAllGeneric(),
          'required': true
        },
        'gradoVariedad': {
          'label': 'Grado (cm)',
          'type': FieldType.numeric,
          'required': true
        },
        'tallosPorRamo': {
          'label': 'Tallos x Ramo',
          'type': FieldType.numeric,
          'required': true
        },
      }, _formKey, cache: cache),
    );
  }

  void _onSubmitCallback() async {
    var result = Map.of(_formKey.currentState.instantValue);
    cache.entries.forEach((element) {
      result[element.key] = element.value;
    });
    var insertResult;

    try {
      print(result);
      var dto = EvaluacionFincaParseDetalleDto.fromJson(result);
      SessionDto sesionDto = locator<Preferences>().getAutentication;

      insertResult = await locator<EvaluacionDetalleRepository>().insert(dto);
      var resultForm = await locator<EvaluacionDetalleRepository>().selectAll();

      //InsertarDetalles Disponibles
      print("Resultado insert: " + insertResult.toString());
      print(result.toString());
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
