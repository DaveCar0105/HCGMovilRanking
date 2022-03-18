import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:ranking_app/src/ui/pages/evaluacion/tinas-cajas/tinas_cajas_evaluacion_detalle.page.dart';

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

class TinasCajasFormWidger extends StatefulWidget {
  TinasCajasFormWidger({Key key}) : super(key: key);

  @override
  State<TinasCajasFormWidger> createState() => _TinasCajasFormWidgerState();
}

class _TinasCajasFormWidgerState extends State<TinasCajasFormWidger> {
  final _formKey = GlobalKey<FormBuilderState>();

  var cache = {};

  var mock = EvaluacionFincaDto.category;

  var evaluacion = EvaluacionFincaParseDto();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: FormBuilder(
        key: _formKey,
        child: ListView(
          children: [
            _sectionA(),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: evaluationDetail(),
            ),
            MaterialButton(
              color: Theme.of(context).colorScheme.secondary,
              child: Text(
                "Agregar Evaluacion",
                style: TextStyle(color: Colors.white),
              ),
              onPressed: addDetail,
            ),
            // _sectionB(),
            // CategorySection(
            //   formKey: _formKey,
            //   category: mock,
            // ),
            FormFooter(
              onSubmit: _onSubmitCallback,
              onReset: _onResetCallbak,
            ),
          ],
        ),
      ),
    );
  }

  evaluationDetail() {
    var size = evaluacion.evaluacionDetalle?.length ?? 0;

    if (size == 0) return Text("No hay detalles de evaluacion");

    return ListView.builder(
      shrinkWrap: true,
      itemCount: evaluacion.evaluacionDetalle?.length ?? 0,
      itemBuilder: (context, index) {
        return ListTile(
          title: InkWell(
            child: Text("Titulo"),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EvaluacionDetalle(
                    evaluacion: evaluacion.evaluacionDetalle[index],
                  ),
                ),
              );
            },
          ),
          trailing: IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              removeDetail(index);
            },
          ),
        );
      },
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

  void addDetail() {
    setState(() {
      if (evaluacion.evaluacionDetalle == null)
        evaluacion.evaluacionDetalle = [];
      evaluacion.evaluacionDetalle.add(EvaluacionFincaParseDetalleDto());
    });
  }

  void removeDetail(i) {
    setState(() {
      if (evaluacion.evaluacionDetalle == null)
        evaluacion.evaluacionDetalle = [];
      evaluacion.evaluacionDetalle.removeAt(i);
    });
  }
}
