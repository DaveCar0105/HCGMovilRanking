import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:ranking_app/src/repositories/carguera.repository.dart';
import 'package:ranking_app/src/repositories/cliente.repository.dart';
import 'package:ranking_app/src/repositories/pais.repository.dart';
import 'package:ranking_app/src/repositories/tipo-caja.repository.dart';

import '../../../../../locator.dart';
import '../../../../dtos/evaluacion-finca-mock.dart';
import '../../../../repositories/postcosecha.repository.dart';
import '../../../../repositories/variedad.repository.dart';
import '../../../widgets/category_section.dart';
import '../../../widgets/form_field_widget.dart';
import '../../../widgets/form_footer.widget.dart';
import '../../../widgets/section_widget.dart';
import '../../../widgets/selectable_selection.dart';

class EvaluacionEnAgenciaFormWidget extends StatelessWidget {
  EvaluacionEnAgenciaFormWidget({Key key}) : super(key: key);

  final _formKey = GlobalKey<FormBuilderState>();
  var mock = EvaluacionFincaDto.category;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: FormBuilder(
        key: _formKey,
        child: ListView(
          children: [
            _sectionA(),
            _seccionAnalisisMuestra(),
            _sectionC(),
            // _sectionB(),
            CategorySection(
              formKey: _formKey,
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
        'clienteId': {
          'label': 'Cliente ',
          'type': FieldType.futureField,
          'subType': FieldType.dropdown,
          'future': locator<ClienteRepository>().selectAllGeneric(),
          'required': true
        },
        'cargueraId': {
          'label': 'Carguera ',
          'type': FieldType.futureField,
          'subType': FieldType.dropdown,
          'future': locator<CargueraRepository>().selectAllGeneric(),
          'required': true
        },
        'postcosechaId': {
          'label': 'Finca Origen ',
          'type': FieldType.futureField,
          'subType': FieldType.dropdown,
          'future': locator<PostcosechaRepository>().selectAllGeneric(),
          'required': true
        },
        'paisId': {
          'label': 'Pais de destino',
          'type': FieldType.futureField,
          'subType': FieldType.dropdown,
          'future': locator<PaisRepository>().selectAllGeneric(),
          'required': true
        },
      }, _formKey),
    );
  }

  SurveySection _seccionAnalisisMuestra() {
    return SurveySection(
      title: Text('Analisis de Muestra'),
      content: FormFieldWidget.generateElements({
        'tipoCajaId': {
          'label': 'Tipo de Caja',
          'type': FieldType.futureField,
          'subType': FieldType.dropdown,
          'future': locator<TipoCajaRepository>().selectAllGeneric(),
          'required': true
        },
        'cantidadCaja': {
          'label': 'Cantidad de Cajas',
          'type': FieldType.numeric,
          'required': true
        },
        'gradoVariedad': {
          'label': 'Grado (cm)',
          'type': FieldType.numeric,
          'required': true
        },
        'variedadId': {
          'label': 'Tipo Variedad',
          'type': FieldType.futureField,
          'subType': FieldType.dropdown,
          'future': locator<VariedadRepository>().selectAllGeneric(),
          'required': true
        },
        'numeroGuia': {
          'label': 'Numero de Guia',
          'type': FieldType.numeric,
          'required': true
        },
        'identificadorCaja': {
          'label': 'Identificador de Caja',
          'type': FieldType.numeric,
          'required': true
        },
        'temperaturaCaja': {
          'label': 'Temperatura Caja',
          'type': FieldType.numeric,
          'required': true
        },
        'tallosPorRamo': {
          'label': 'Numero de Tallos x Ramo',
          'type': FieldType.numeric,
          'required': true
        },
        'ramosPorCaja': {
          'label': 'Numero de Ramos x Cajas',
          'type': FieldType.numeric,
          'required': true
        },
        'tallosMuestreados': {
          'label': 'Numero de Tallos Muestreados',
          'type': FieldType.numeric,
          'required': true
        },
      }, _formKey),
    );
  }

  SurveySection _sectionC() {
    final options = ['largoCaja', 'anchoCaja', 'altoCaja'];

    return SurveySection(
      title: Text('Caracteristicas Caja Auditada'),
      content: FormFieldWidget.generateElements({
        'largoCaja': {
          'label': 'Largo de la caja',
          'type': FieldType.multiplication,
          'options': options,
          'result': 'pesoVolumetrico',
          'required': true
        },
        'anchoCaja': {
          'label': 'Ancho de la caja',
          'type': FieldType.multiplication,
          'options': options,
          'result': 'pesoVolumetrico',
          'required': true
        },
        'altoCaja': {
          'label': 'Alto de la caja',
          'type': FieldType.multiplication,
          'options': options,
          'result': 'pesoVolumetrico',
          'required': true
        },
        'pesoVolumetrico': {
          // HACER EL CALCULO
          'label': 'Peso Volumetrico',
          'type': FieldType.numberResult,
          'required': true
        },
        'pesoRealCaja': {
          'label': 'Peso Real de la caja',
          'type': FieldType.numeric,
          'required': true
        },
        'aprovechamientoCaja': {
          // HACER EL CALCULO PARA EL APROVEHAMIENTO DE LA CAJA
          'label': 'Aprovechamiento de la caja',
          'type': FieldType.text,
          'required': true
        },
      }, _formKey),
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
      }, _formKey),
    );
  }

  void _onSubmitCallback() async {
    _formKey.currentState.save();
    var result = _formKey.currentState.value;
    var insertResult;

    try {
      print(result);
      // var dto = MaltratoDto.fromJson(result);
      // SessionDto sesionDto = locator<Preferences>().getAutentication;
      // dto.usuarioId = sesionDto?.usuarioDto?.usuarioId ?? 1;
      // dto.procesoMaltratoFecha = DateTime.now().toLocal();
      // insertResult = await locator<MaltratoRepository>().insert(dto);
      //var resultForm = await locator<MaltratoRepository>().selectAll();
      //print("Resultado maltrato: " + insertResult.toString());
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
