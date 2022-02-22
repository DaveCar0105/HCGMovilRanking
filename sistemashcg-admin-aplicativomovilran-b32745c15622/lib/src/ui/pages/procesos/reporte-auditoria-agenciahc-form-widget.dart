import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:ranking_app/src/ui/widgets/form_field_widget.dart';
import 'package:ranking_app/src/ui/widgets/section_widget.dart';

class ProcesoReporteAuditoriaAgenciahcForm extends StatelessWidget {
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
            _sectionF(),
            _footer(context)
          ],
        ),
      ),
    );
  }

  SurveySection _section() {
    return SurveySection(
      title: Text('Reporte de auditorias en agencia de carga'),
      content: FormFieldWidget.generateElements({
        'carguera': {
          'label': 'Seleccione una Carguera',
          'type': FieldType.dropdown,
          'dropdownOptions': [1, '2', 3, 'a', 'c'],
          'required': true
        },
        'nombreCliente': {
          'label': 'Seleccione Un cliente ',
          'type': FieldType.dropdown,
          'dropdownOptions': [
            '🐶',
            '😀',
            '😍',
          ],
          'required': true
        },
        'fincaOrigen': {
          'label': 'Seleccione Una Finca ',
          'type': FieldType.dropdown,
          'dropdownOptions': [
            '🐶',
            '😀',
            '😍',
          ],
          'required': true
        },
        'paisDestino': {
          'label': 'Seleccione el pais de destino ',
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
        title: Text('Analisi de Muestra'),
        content: FormFieldWidget.generateElements({
          'tipoDeCaja': {
          'label': 'Seleccione un tipo de caja ',
          'type': FieldType.dropdown,
          'dropdownOptions': [
            '🐶',
            '😀',
            '😍',
          ],
          'required': true
        },
          'cantidadCajas': {
            'label': 'Digite la cantidad de cajas',
            'type': FieldType.text,
            'required': true,
          },
          'gradoCm': {
            'label': 'Digite el grado (cm)',
            'type': FieldType.text,
            'required': true,
          },
          'variedadDeFlores': {
          'label': 'Seleccione la variedad de flores ',
          'type': FieldType.dropdown,
          'dropdownOptions': [
            '🐶',
            '😀',
            '😍',
          ],
          'required': true
        },
        'numeroGuia': {
            'label': 'Digite el Numero de guia',
            'type': FieldType.text,
            'required': true,
          },
          'numeroIdentificadorCaja': {
            'label': 'Digite el numero identificador de caja',
            'type': FieldType.text,
            'required': true,
          },
          'temperaturaCaja': {
            'label': 'Digite la temperatura de la Caja',
            'type': FieldType.text,
            'required': true,
          },
          'numeroTallosPorRamo': {
            'label': 'Digite el numero de Tallos x Ramo',
            'type': FieldType.text,
            'required': true,
          },
          'NumeroRamosPorCaja': {
            'label': 'Digite el numero de Ramos x Caja',
            'type': FieldType.text,
            'required': true,
          },
          'tallosMuestreados': {
            'label': 'Digite el numero de tallos muestreados',
            'type': FieldType.text,
            'required': true,
          },
        }, _formKey));
  }

  SurveySection _sectionC() {
    final options=['largoCaja','anchoCaja','altoCaja'];
    
    return SurveySection(
      title: Text('Caracteristicas Caja Auditada'),
      content: FormFieldWidget.generateElements({
      
        'largoCaja': {
          'label': 'Largo de la caja',
          'type': FieldType.multiplication,
          'options':options,
          'result':'pesoVolumetrico',
          'required': true
        },
        'anchoCaja': {
          'label': 'Ancho de la caja',
          'type': FieldType.multiplication,
          'options':options,
          'result':'pesoVolumetrico',
          'required': true
        },
        'altoCaja': {
          'label': 'Alto de la caja',
          'type': FieldType.multiplication,
          'options':options,
          'result':'pesoVolumetrico',
          'required': true
        },
        'pesoVolumetrico': {   // HACER EL CALCULO
          'label': 'Peso Volumetrico',
          'type': FieldType.numberResult,
          'required': true
        },
        'pesoRealCaja': {
          'label': 'Peso Real de la caja',
          'type': FieldType.numeric,
          'required': true
        },
        'aprovechamientoCaja': { // HACER EL CALCULO PARA EL APROVEHAMIENTO DE LA CAJA
          'label': 'Aprovechamiento de la caja',
          'type': FieldType.text,
          'required': true
        },
      }, _formKey),
    );
  }

  SurveySection _sectionD() {
    return SurveySection(
      title: Text('Problemas detectados en Auditoria\nBoton'),
      content: FormFieldWidget.generateElements({
        
      
        'medidaAcordeGrado': {
          'label': 'Medida acorde al grado',
          'type': FieldType.numeric,
          'required': true
        },
        'inconsistenciaTamanoBoton': {
          'label': 'Inconsistencia tamano Boton',
          'type': FieldType.numeric,
          'required': true
        },
        'tonalidadVariedad': {
          'label': 'Tonalidad de Variedad',
          'type': FieldType.numeric,
          'required': true
        },
        'despetaladoFlor': {   // HACER EL CALCULO
          'label': 'Despetalado de Flor',
          'type': FieldType.numeric,
          'required': true
        },
        'presentacionBotonesDeformes': {
          'label': 'Presentacion de botones deformes',
          'type': FieldType.numeric,
          'required': true
        },
        'puntoCorteAcordeMercado': { 
          'label': 'Punto de corte acorde al mercado',
          'type': FieldType.text,
          'required': true
        },
        'inconsistenciaPuntoCorte': { 
          'label': 'Inconsistencia punto de corte',
          'type': FieldType.text,
          'required': true
        },
        'descabezados': {
          'label': 'Descabezados',
          'type': FieldType.text,
          'required': true
        },
        'botonRoto': { 
          'label': 'Boton Roto',
          'type': FieldType.text,
          'required': true
        },
        'maltratoBoton': { 
          'label': 'Maltrato al Boton',
          'type': FieldType.text,
          'required': true
        },
        'presenciaPlagasBoton': { 
          'label': 'Presemcia de Plagas(Boton)',
          'type': FieldType.text,
          'required': true
        },
        'presenciaEnfermedadesBoton': { 
          'label': 'Presemcia de Enfermedades(Boton)',
          'type': FieldType.text,
          'required': true
        },
        'ubicacionBotonesPisosRamo': { 
          'label': 'Ubicación de los botones den los pisos del ramo',
          'type': FieldType.text,
          'required': true
        },
        'presenciaFitotoxicidad': { 
          'label': 'Presencia de Fitotoxicidad (Botón)',
          'type': FieldType.text,
          'required': true
        },
        'azulamientoPetalos': { 
          'label': 'Azulamiento de petalos',
          'type': FieldType.text,
          'required': true
        },
        'florFofaTacto': { 
          'label': 'Flor fofa al tacto',
          'type': FieldType.text,
          'required': true
        },
        'negriamientoBronceamientoPetalo': { 
          'label': 'Negreamiento/Bronceamiento petalo',
          'type': FieldType.text,
          'required': true
        },
      }, _formKey),
    );
  }

  SurveySection _sectionE() {
     return SurveySection(
      title: Text('Problemas detectados en Auditoria\nFollaje'),
      content: FormFieldWidget.generateElements({
       
        'maltratoFollaje': {
          'label': 'Maltrato al Follaje',
          'type': FieldType.numeric,
          'required': true
        },
        'presenciaPlagasFollaje': {
          'label': 'Presencia de Plagas (Follaje)',
          'type': FieldType.numeric,
          'required': true
        },
        'presenciaEnfermedadesFollaje': {
          'label': 'Presencia Enfermendades(Follaje)',
          'type': FieldType.numeric,
          'required': true
        },
        'deshoje': {
          'label': 'Deshoje',
          'type': FieldType.numeric,
          'required': true
        },
        'maquillajeFollaje': {
          'label': 'Maquillaje de Follaje',
          'type': FieldType.numeric,
          'required': true
        },
        'presenciaDeficienciasFitotoxicidad': {
          'label': 'Presencia de Deficiencias/fitotoxicidad',
          'type': FieldType.numeric,
          'required': true
        }
      }, _formKey),
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
      content: FormFieldWidget.generateElements({
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
          'type': FieldType.numberResult,
        },
      }, _formKey),
    );

    return b;
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
