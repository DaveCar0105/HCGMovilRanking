import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:ranking_app/src/ui/widgets/section_widget.dart';


class ProcesoMaltratoForm extends StatelessWidget {
  var _formKey = GlobalKey<FormBuilderState>();

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
            Row(
              children: <Widget>[
                Expanded(
                  child: MaterialButton(
                    color: Theme.of(context).colorScheme.secondary,
                    child: Text(
                      "Submit",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      _formKey.currentState.save();
                      if (_formKey.currentState.validate()) {
                        print(_formKey.currentState.value);
                      } else {
                        print("validation failed");
                      }
                    },
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: MaterialButton(
                    color: Theme.of(context).colorScheme.secondary,
                    child: Text(
                      "Reset",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      _formKey.currentState.reset();
                    },
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }


  SurveySection _section() {
    return SurveySection(
      title: Text('Información General Evaluación Finca'),
      content: [
        FormBuilderDateTimePicker(
          name: 'date',
          //onChanged: _datePickerCallback,
          inputType: InputType.both,
          decoration: InputDecoration(
            labelText: 'Fecha de Auditoria',
          ),
        ),
        FormBuilderTextField(
          name: 'age',
          decoration: InputDecoration(
            labelText: 'Código del técnico',
          ),
          keyboardType: TextInputType.text,
        ),
        FormBuilderDropdown(
          name: 'gender',
          decoration: InputDecoration(
            labelText: 'Nombre de la Finca',
          ),
          // initialValue: 'Male',
          allowClear: true,
          items: [1, 2, 3, 4, 5, 6]
              .map((gender) => DropdownMenuItem(
                    value: gender,
                    child: Text('$gender'),
                  ))
              .toList(),
        ),
        FormBuilderDropdown(
          name: 'gender',
          decoration: InputDecoration(
            labelText: 'Nombre Sub-Finca',
          ),
          // initialValue: 'Male',
          allowClear: true,
          items: [1, 2, 3, 4, 5, 6]
              .map((gender) => DropdownMenuItem(
                    value: gender,
                    child: Text('$gender'),
                  ))
              .toList(),
        ),
      ],
    );
  }

  SurveySection _sectionB() {
    return SurveySection(
      title: Text('Variedad a Evaluar'),
      content: [
        FormBuilderTextField(
          name: 'age',
          decoration: InputDecoration(
            labelText: 'Variedad',
          ),
          keyboardType: TextInputType.text,
        ),
      ],
    );
  }

  SurveySection _sectionC() {
    return SurveySection(
      title: Text('Recepción'),
      content: [
        FormBuilderTextField(
          name: 'age',
          decoration: InputDecoration(
            labelText: 'Tallos Muestreados Recepción',
          ),
          keyboardType: TextInputType.number,
        ),
        FormBuilderTextField(
          name: 'age',
          decoration: InputDecoration(
            labelText: 'Presencia de Maltrato Recepción',
          ),
          keyboardType: TextInputType.number,
        ),
        FormBuilderTextField(
          name: 'age',
          decoration: InputDecoration(
            labelText: '% Incidencia Recepción',
          ),
          keyboardType: TextInputType.text,
        ),
      ],
    );
  }

  SurveySection _sectionD() {
    return SurveySection(
      title: Text('Clasificación - Boncheo'),
      content: [
        FormBuilderDropdown(
          name: 'gender',
          decoration: InputDecoration(
            labelText: 'Nombre Sub-Finca',
          ),
          // initialValue: 'Male',
          allowClear: true,
          items: [1, 2, 3, 4, 5, 6]
              .map((gender) => DropdownMenuItem(
                    value: gender,
                    child: Text('$gender'),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
