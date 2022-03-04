import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import '../../../../../locator.dart';
import '../../../../dtos/evaluacion-finca-mock.dart';
import '../../../../dtos/evaluacion-finca-parse.dto.dart';
import '../../../../dtos/session.dto.dart';
import '../../../../preference.dart';
import '../../../../repositories/evaluacion-finca.repository.dart';
import '../../../../repositories/postcosecha.repository.dart';
import '../../../../repositories/variedad.repository.dart';
import '../../../widgets/category_section.dart';
import '../../../widgets/form_field_widget.dart';
import '../../../widgets/form_footer.widget.dart';
import '../../../widgets/section_widget.dart';

class TinasCajasFormWidger extends StatelessWidget {
  TinasCajasFormWidger({Key key}) : super(key: key);

  final _formKey = GlobalKey<FormBuilderState>();
  var cache = {};
  var mock = EvaluacionFincaMock.category;

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
              category: mock,
            ),
            FormFooter(
              onSubmit: _onSubmitCallback,
              onReset: _onResetCallbak,
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
      }, _formKey, cache: cache),
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
      var dto = EvaluacionFincaParseDto.fromJson(result);
      SessionDto sesionDto = locator<Preferences>().getAutentication;
      dto.usuarioId = sesionDto?.usuarioDto?.usuarioId ?? 1;
      dto.fechaAuditoria = DateTime.now().toLocal();
      insertResult = await locator<EvaluacionFincaRepository>().insert(dto);
      var resultForm = await locator<EvaluacionFincaRepository>().selectAll();
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
