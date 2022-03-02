import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_image_picker/form_builder_image_picker.dart';
import 'package:ranking_app/src/dtos/evaluacion-finca-mock.dart';
import 'package:ranking_app/src/dtos/generic.dto.dart';

import '../../dtos/range.dto.dart';

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
  photo,
  numberRange,
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
        items: _generateDropdownOption(e),
      );
    if (e.value['type'] == FieldType.average)
      return FormBuilderTextField(
        valueTransformer: _numericTransform,
        name: e.key,
        onChanged: (_) => _getAverage(e.value['options'], e.value['result']),
        decoration: inputDecoration,
        keyboardType: TextInputType.number,
      );
    if (e.value['type'] == FieldType.numberRange)
      return FormBuilderTextField(
        valueTransformer: _numericTransform,
        name: e.key,
        onChanged: (_) {
          var a = int.tryParse(_);
          var rangesList = e.value['ranges'];
          Item ite = e.value['item'];
          print(a);
          _getRange(a, rangesList, e.value['result'], ite);
          print(a);
        },
        decoration: inputDecoration,
        keyboardType: TextInputType.number,
      );
    if (e.value['type'] == FieldType.numberResult)
      return FormBuilderTextField(
        enabled: false,
        name: e.key,
        valueTransformer: _numericTransform,
        decoration: inputDecoration,
        keyboardType: TextInputType.number,
      );
    if (e.value['type'] == FieldType.numeric)
      return FormBuilderTextField(
        name: e.key,
        valueTransformer: _numericTransform,
        decoration: inputDecoration,
        keyboardType: TextInputType.number,
      );
    if (e.value['type'] == FieldType.multiplication)
      return FormBuilderTextField(
        name: e.key,
        valueTransformer: _numericTransform,
        onChanged: (_) => _getMultiplication(
          e.value['options'],
          e.value['result'],
        ),
        decoration: inputDecoration,
        keyboardType: TextInputType.number,
      );
    if (e.value['type'] == FieldType.photo)
      return FormBuilderImagePicker(
        name: 'photos',
        decoration: const InputDecoration(labelText: 'Pick Photos'),
        maxImages: 1,
      );
    if (e.value['type'] == FieldType.percent)
      return FormBuilderTextField(
        valueTransformer: _numericTransform,
        name: e.key,
        onChanged: (_) => _getPercent(e.value['options'].elementAt(0),
            e.value['options'].elementAt(1), e.value['options'].elementAt(2)),
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

  _generateDropdownOption(MapEntry<dynamic, dynamic> e) {
    print(e);
    return e.value['dropdownOptions']
        .map<DropdownMenuItem>(
          (s) => DropdownMenuItem(
            value: s,
            child: Text('$s'),
          ),
        )
        .toList();
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

  _getRange(
    int i,
    List<Range> ranges,
    String v,
    Item item,
  ) {
    if (ranges.isNotEmpty) {
      var result = _computeRange(i, ranges);

      if (v != null) {
        item
          ..cantidadRespuesta = result
          ..totalRespuesta = i;
        formKey.currentState.fields[v].didChange(result?.toString() ?? "");
      }
    }
  }

  _computeRange(i, List<Range> ranges) {
    try {
      var result = ranges
          .where(
            (element) => _insideRange(i, element.minimo, element.maximo),
          )
          .map((range) => range.cantidadaDisminuir)
          .first;
      return result;
    } catch (e) {
      return double.infinity;
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

  _insideRange(num i, num lowerLimit, num highLimit) =>
      lowerLimit <= i && i < highLimit;

  _numericTransform(String value) {
    print(value);
    var result = num.tryParse(value ?? "") ?? 0;
    return result;
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
