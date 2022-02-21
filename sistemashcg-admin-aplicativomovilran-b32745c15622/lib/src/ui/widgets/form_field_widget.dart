import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

enum FieldType {
  date,
  dateRange,
  text,
  dropdown,
  numeric,
  average,
  averageResult
}

class FormFieldWidget extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;
  final MapEntry element;

  const FormFieldWidget({Key key, this.formKey, this.element})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return fieldGenerator(element);
  }

  fieldGenerator(MapEntry e) {
    if (e.value['type'] == FieldType.date)
      return FormBuilderDateTimePicker(
        name: e.key,
        decoration: InputDecoration(
          labelText: e.value['label'],
        ),
      );
    if (e.value['type'] == FieldType.dropdown)
      return FormBuilderDropdown(
        name: e.key,
        decoration: InputDecoration(
          labelText: e.value['label'],
        ),
        allowClear: true,
        items: e.value['dropdownOptions']
            .map<DropdownMenuItem>(
              (s) => DropdownMenuItem(
                value: s,
                child: Text('$s'),
              ),
            )
            .toList(),
      );
    if (e.value['type'] == FieldType.average)
      return FormBuilderTextField(
        initialValue: '0',
        name: e.key,
        onChanged: (_) {
          _getPercent(e.value['options'].elementAt(0),
              e.value['options'].elementAt(1), e.value['options'].elementAt(2));
        },
        decoration: InputDecoration(
          labelText: e.value['label'],
        ),
        keyboardType: TextInputType.number,
      );
    if (e.value['type'] == FieldType.averageResult)
      return FormBuilderTextField(
        name: e.key,
        decoration: InputDecoration(
          labelText: e.value['label'],
        ),
        keyboardType: TextInputType.number,
      );
    else
      return FormBuilderTextField(
        name: e.key,
        decoration: InputDecoration(
          labelText: e.value['label'],
        ),
      );
  }

  void _getPercent(
    String s,
    String t,
    String v,
  ) {
    var firstValue = formKey.currentState.fields[s]?.value ?? "";
    var secondValue = formKey.currentState.fields[t]?.value ?? "";
    if (firstValue.isNotEmpty && secondValue.isNotEmpty) {
      var a = int.tryParse(formKey.currentState.fields[s].value) ?? 0;
      var b = int.tryParse(formKey.currentState.fields[t].value) ?? 0;
      var result = ((b * 100) / a) ?? 0;
      formKey.currentState.fields[v].didChange(result.toString());
    }
  }

  void _getAverage(
    String s,
    String t,
    String v,
  ) {
    var firstValue = formKey.currentState.fields[s]?.value ?? "";
    var secondValue = formKey.currentState.fields[t]?.value ?? "";
    if (firstValue.isNotEmpty && secondValue.isNotEmpty) {
      var a = int.tryParse(formKey.currentState.fields[s].value) ?? 0;
      var b = int.tryParse(formKey.currentState.fields[t].value) ?? 0;
      var result = ((b * 100) / a) ?? 0;
      formKey.currentState.fields[v].didChange(result.toString());
    }
  }

  void _getArea(
    String s,
    String t,
    String v,
  ) {
    var firstValue = formKey.currentState.fields[s]?.value ?? "";
    var secondValue = formKey.currentState.fields[t]?.value ?? "";
    if (firstValue.isNotEmpty && secondValue.isNotEmpty) {
      var a = int.tryParse(formKey.currentState.fields[s].value) ?? 0;
      var b = int.tryParse(formKey.currentState.fields[t].value) ?? 0;
      var result = ((b * 100) / a) ?? 0;
      formKey.currentState.fields[v].didChange(result.toString());
    }
  }
}
