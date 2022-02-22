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
  numberResult,
  multiplication
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
          _getAverage(e.value['options'], e.value['result']);
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
    if (e.value['type'] == FieldType.multiplication)
      return FormBuilderTextField(
        initialValue: '0',
        name: e.key,
        onChanged: (_) {
          _getMultiplication(e.value['options'], e.value['result']);
        },
        decoration: inputDecoration,
        keyboardType: TextInputType.number,
      );
    else
      return FormBuilderTextField(
        initialValue: '',
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
    String v,
  ) {
    //var map=list.map((s) =>formKey.currentState.fields[s]?.value ?? "");

    if (list.isNotEmpty) {
      List<int> nombresList = list
          .map((i) => int.tryParse(formKey.currentState.fields[i].value) ?? 0)
          .toList();

      var result =
          ((nombresList.reduce((value, element) => value + element)) ?? 0) /
              list.length;
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
      var result = (a * b) ?? 0;
      formKey.currentState.fields[v].didChange(result.toString());
    }
  }

  _getMultiplication(
    List<String> list,
    String v,
  ) {
    //var map=list.map((s) =>formKey.currentState.fields[s]?.value ?? "");

    if (list.isNotEmpty) {
      List<int> nombresList = list
          .map((i) => int.tryParse(formKey.currentState.fields[i].value) ?? 0)
          .toList();

      var result =
          (nombresList.reduce((value, element) => value * element)) ?? 0;
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
