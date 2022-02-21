import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

enum FieldType {
  date,
  dateRange,
  time,
  text,
  dropdown,
  numeric,
  average,
  numberResult
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
    var inputDecoration = InputDecoration(
      labelText: e.value['label'],
    );

    if (e.value['type'] == FieldType.date)
      return FormBuilderDateTimePicker(
        name: e.key,
        decoration: inputDecoration,
      );
    if (e.value['type'] == FieldType.time)
      return FormBuilderDateTimePicker(
        inputType: InputType.time,
        name: e.key,
        decoration: inputDecoration,
      );
    if (e.value['type'] == FieldType.dropdown)
      return FormBuilderDropdown(
        name: e.key,
        decoration: inputDecoration,
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
        decoration: inputDecoration,
        keyboardType: TextInputType.number,
      );
    if (e.value['type'] == FieldType.numberResult)
      return FormBuilderTextField(
        name: e.key,
        decoration: inputDecoration,
        keyboardType: TextInputType.number,
      );
    else
      return FormBuilderTextField(
        name: e.key,
        decoration: inputDecoration,
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
    List<String> list,
    String r,
  ) {
    var numbers = list.map((e) => formKey.currentState.fields[e]?.value ?? "");
    var resultField = formKey.currentState.fields[r]?.value ?? "";

    if (numbers.isNotEmpty && resultField.isNotEmpty) {
      //Compute fields
      // var reduce =
      //     numbers.map((e) => null).reduce<double>((value, element) => value + element);
      // var result = ((b * 100) / a) ?? 0;

      //setResult
      var result = 0;
      formKey.currentState.fields[r].didChange(result.toString());
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
      var result = (a * b) ?? 0;
      formKey.currentState.fields[v].didChange(result.toString());
    }
  }

  static List<FormFieldWidget> generateElements(Map args, formKey) {
    return args.entries
        .map((e) => FormFieldWidget(
              formKey: formKey,
              element: e,
            ))
        .toList();
  }
}
