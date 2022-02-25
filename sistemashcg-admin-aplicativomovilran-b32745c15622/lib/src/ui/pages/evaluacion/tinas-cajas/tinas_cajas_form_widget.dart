import 'package:expandable_widgets/expandable_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:ranking_app/src/ui/widgets/form_field_widget.dart';
import 'package:ranking_app/src/ui/widgets/section_widget.dart';

class TinasCajasFormWidger extends StatefulWidget {
  TinasCajasFormWidger({Key key}) : super(key: key);

  @override
  State<TinasCajasFormWidger> createState() => _TinasCajasFormWidgerState();
}

class _TinasCajasFormWidgerState extends State<TinasCajasFormWidger> {
  final _formKeyA = GlobalKey<FormBuilderState>();
  final _formKeyB = GlobalKey<FormBuilderState>();
  final _formKeyC = GlobalKey<FormBuilderState>();
  final _formKeyD = GlobalKey<FormBuilderState>();
  final _formKey = GlobalKey<FormBuilderState>();

  bool bonchadoraPresentacion = false;
  bool bonchadoraBoton = false;
  bool clasificacionBoton = false;
  bool clasificacionTallo = false;
  bool clasificacionFollaje = false;
  bool clasificacionEnfermedad = false;
  bool clasificacionPlagas = false;
  bool mesaDeCorte = false;

  List<String> _checkedbonchadoraPresentacion = [];
  List<String> _checkedbonchadoraBoton = [];
  List<String> _checkedclasificacionBoton = [];
  List<String> _checkedclasificacionTallo = [];
  List<String> _checkedclasificacionFollaje = [];
  List<String> _checkedclasificacionEnfermedad = [];
  List<String> _checkedclasificacionPlagas = [];
  List<String> _checkedmesaDeCorte = [];

  Map<String, dynamic> resultForm = {};

  String section = "A";

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: FormBuilder(
        key: _formKey,
        child: ListView(
          children: [
            section == "A" ? _sectionA() : Container(),
            section == "B" ? _sectionB() : Container(),
            section == "B" ? _optionB1() : Container(),
            _footer(context)
          ],
        ),
      ),
    );
  }

  Widget switchSections() {
    switch (section) {
      case "A":
        return _sectionA();
        break;
      case "B":
        return _sectionB();
        break;
      default:
    }
  }

  Widget _optionB1() {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Expandable(
        primaryWidget: Container(
          height: 50,
          child: Text(
              'Desea registrar\nevaluación en BONCHADORA\n/ PRESENTACIÓN BONCH'),
        ),
        secondaryWidget: SurveySection(
          title: Text('"Información General"'),
          content: FormFieldWidget.generateElements({
            'erroresEnLongitud': {
              'label': 'Errores en Longitud',
              'type': FieldType.numeric,
              'required': true
            },
            'dtoPuntosLongitud': {
              'label': 'Dto. puntos: Longitud',
              'type': FieldType.numeric,
              'required': true
            },
            'dtoPuntosLongitud': {
              'label': 'Dto. puntos: Longitud',
              'type': FieldType.numeric,
              'required': true
            },
            'nombreFinca': {
              'label': 'Nombre de la Finca',
              'type': FieldType.dropdown,
              'dropdownOptions': ['RDC 1', 'AGRINA', 3, 'a', 'c'],
              'required': true
            },
            'subFinca': {
              'label': 'Sub Finca:',
              'type': FieldType.dropdown,
              'dropdownOptions': [1, 2, 3, 4],
              'required': true
            },
            'codigoDelTecnico': {
              'label': 'Código del técnico',
              'type': FieldType.text,
              'required': true
            },
            'horaInicioAuditoria': {
              'label': 'Hora Inicio de auditoría',
              'type': FieldType.time,
              'required': true
            },
            'tipoEvaluacion': {
              'label': 'Tipo de evaluación',
              'type': FieldType.time,
              'required': true
            },
          }, _formKey),
        ),
        backgroundColor: Colors.grey.withOpacity(0.4),
        showArrowIcon: true,
        centralizePrimaryWidget: true,
        isClickable: true,
        padding: EdgeInsets.all(5.0),
      ),
    );

    /* Padding(
      padding: const EdgeInsets.only(top:15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Desea registrar evaluación en BONCHADORA / PRESENTACIÓN BONCH'),
          CheckboxGroup(
            orientation: GroupedButtonsOrientation.HORIZONTAL,
            labels: <String>[
              "SI",
              "NO",
            ],
            checked: _checkedbonchadoraPresentacion,
            onChange: (bool isChecked, String label, int index) =>
                print("isChecked: $isChecked   label: $label  index: $index"),
            onSelected: (List selected) => setState(() {
              if (selected.length > 1) {
                selected.removeAt(0);
                print('selected length  ${selected.length}');
              } else {
                print("only one");
              }
              _checkedbonchadoraBoton = selected;
            }),
          ),
        ],
      ),
    ); */
  }


  SurveySection _sectionA() {
    return SurveySection(
      title: Text('"Información General"'),
      content: FormFieldWidget.generateElements({
        'fechaAuditoria': {
          'label': 'Fecha de Auditoria',
          'type': FieldType.date,
          'required': true
        },
        'nombreFinca': {
          'label': 'Nombre de la Finca',
          'type': FieldType.dropdown,
          'dropdownOptions': ['RDC 1', 'AGRINA', 3, 'a', 'c'],
          'required': true
        },
        'subFinca': {
          'label': 'Sub Finca:',
          'type': FieldType.dropdown,
          'dropdownOptions': [1, 2, 3, 4],
          'required': true
        },
        'codigoDelTecnico': {
          'label': 'Código del técnico',
          'type': FieldType.text,
          'required': true
        },
        'horaInicioAuditoria': {
          'label': 'Hora Inicio de auditoría',
          'type': FieldType.time,
          'required': true
        },
        'tipoEvaluacion': {
          'label': 'Tipo de evaluación',
          'type': FieldType.time,
          'required': true
        },
      }, _formKey),
    );
  }

  SurveySection _sectionB() {
    return SurveySection(
      title: Text('Evaluación en Lineas de Producción'),
      content: FormFieldWidget.generateElements({
        'mesaEvaluar': {
          'label': 'Mesa a Evaluar',
          'type': FieldType.text,
          'required': true
        },
        'variedad': {
          'label': 'Variedad',
          'type': FieldType.dropdown,
          'dropdownOptions': ['RDC 1', 'AGRINA', 3, 'a', 'c'],
          'required': true
        },
        'grado': {
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

  SurveySection _sectionC() {
    return SurveySection(
      title: Text('Bonchadora / Presentación Bonch'),
      content: FormFieldWidget.generateElements({
        'mesaEvaluar': {
          'label': 'Mesa a Evaluar',
          'type': FieldType.text,
          'required': true
        },
        'variedad': {
          'label': 'Variedad',
          'type': FieldType.dropdown,
          'dropdownOptions': ['RDC 1', 'AGRINA', 3, 'a', 'c'],
          'required': true
        },
        'grado': {
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
    switch (section) {
      case "A":
        _formKey.currentState.save();
        var result = _formKey.currentState.value;
        if (_formKey.currentState.validate()) {
          resultForm.addAll(result);
          print(resultForm.toString());
          setState(() {
            section = "B";
          });
        } else {
          print("validation failed");
        }
        break;
      case "B":
        _formKey.currentState.save();
        var result = _formKey.currentState.value;
        if (_formKey.currentState.validate()) {
          resultForm.addAll(result);
          print(resultForm.toString());
          setState(() {
            section = "C";
          });
        } else {
          print("validation failed");
        }
        break;
      case "C":
        _formKey.currentState.save();
        var result = _formKey.currentState.value;
        if (_formKey.currentState.validate()) {
          resultForm.addAll(result);
          print(resultForm.toString());
          setState(() {
            section = "D";
          });
        } else {
          print("validation failed");
        }
        break;
      default:
    }
  }

  void _onResetCallbak() {
    _formKey.currentState.reset();
  }
}
