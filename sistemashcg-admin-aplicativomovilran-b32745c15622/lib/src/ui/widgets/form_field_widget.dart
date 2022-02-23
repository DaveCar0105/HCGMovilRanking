import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:ranking_app/src/dtos/generic.dto.dart';

enum FieldType {
  date,
  dateRange,
  time,
  text,
  dropdown,
  numeric,
  average,
  numberResult,
  multiplication,
  futureField,
  percent,
}

class FormFieldWidget extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;
  final MapEntry element;

  const FormFieldWidget({Key key, this.formKey, this.element})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _fieldGenerator(element);
  }

  _fieldGenerator(MapEntry e) {
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
        valueTransformer: (text) => num.tryParse(text),
        name: e.key,
        onChanged: (_) {
          _getAverage(e.value['options'], e.value['result']);
        },
        decoration: inputDecoration,
        keyboardType: TextInputType.number,
      );
    if (e.value['type'] == FieldType.numberResult)
      return FormBuilderTextField(
        enabled: false,
        name: e.key,
        valueTransformer: (text) => num.tryParse(text),
        decoration: inputDecoration,
        keyboardType: TextInputType.number,
      );
    if (e.value['type'] == FieldType.numeric)
      return FormBuilderTextField(
        name: e.key,
        valueTransformer: (text) => num.tryParse(text),
        decoration: inputDecoration,
        keyboardType: TextInputType.number,
      );
    if (e.value['type'] == FieldType.multiplication)
      return FormBuilderTextField(
        name: e.key,
        valueTransformer: (text) => num.tryParse(text),
        onChanged: (_) {
          _getMultiplication(e.value['options'], e.value['result']);
        },
        decoration: inputDecoration,
        keyboardType: TextInputType.number,
      );
    if (e.value['type'] == FieldType.percent)
      return FormBuilderTextField(
        valueTransformer: (text) => num.tryParse(text),
        name: e.key,
        onChanged: (_) {
          _getPercent(e.value['options'].elementAt(0),
              e.value['options'].elementAt(1), e.value['options'].elementAt(2));
        },
        decoration: inputDecoration,
        keyboardType: TextInputType.number,
      );
    if (e.value['type'] == FieldType.futureField)
      return FutureFormField(
        formKey: formKey,
        element: e,
        future: e.value['future'],
      );
    else
      return FormBuilderTextField(
        initialValue: '',
        name: e.key,
        decoration: inputDecoration,
      );
  }

  _getPercent(
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

  _getAverage(
    List<String> list,
    String v,
  ) {
    if (list.isNotEmpty) {
      List<int> nombresList = list.map((i) {
        var result =
            int.tryParse(formKey.currentState.fields[i].value ?? "") ?? 0;
        return result;
      }).toList();

      var result =
          ((nombresList.reduce((value, element) => value + element)) ?? 0) /
              list.length;
      if (v != null)
        formKey.currentState.fields[v].didChange(result?.toString() ?? "");
    }
  }

  _getArea(String s, String t, String v) {
    var firstValue = formKey.currentState.fields[s]?.value ?? "";
    var secondValue = formKey.currentState.fields[t]?.value ?? "";
    if (firstValue.isNotEmpty && secondValue.isNotEmpty) {
      var a = int.tryParse(formKey.currentState.fields[s].value) ?? 0;
      var b = int.tryParse(formKey.currentState.fields[t].value) ?? 0;
      var result = (a * b) ?? 0;
      formKey.currentState.fields[v].didChange(result.toString());
    }
  }

  _getMultiplication(List<String> list, String v) {
    if (list.isNotEmpty) {
      List<int> nombresList = list
          .map((i) =>
              int.tryParse(formKey.currentState.fields[i].value ?? "") ?? 0)
          .toList();

      var result =
          (nombresList.reduce((value, element) => value * element)) ?? 0;
      if (v != null)
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

  static generateField(MapEntry args, formKey) {
    return FormFieldWidget(
      formKey: formKey,
      element: args,
    );
  }
}

class FutureFormField extends StatelessWidget {
  final GlobalKey<FormBuilderState> formKey;
  final MapEntry element;
  final Future future;

  const FutureFormField({Key key, this.formKey, this.element, this.future})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: future,
        builder: (_, s) {
          if (s.hasData) {
            List a = s.data.map((s) {
              GenericDto dto = s;
              return dto.id;
            }).toList();
            print(s.toString());
            element.value['type'] = FieldType.dropdown;
            element.value['dropdownOptions'] = a;
            return FormFieldWidget(
              formKey: formKey,
              element: element,
            );
          } else
            return CircularProgressIndicator();
        });
  }
}
