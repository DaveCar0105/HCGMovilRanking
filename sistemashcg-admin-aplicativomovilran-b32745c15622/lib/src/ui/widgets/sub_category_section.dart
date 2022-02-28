import 'package:flutter/material.dart';
import 'package:flutter_form_builder/src/form_builder.dart';

import '../../../locator.dart';
import '../../dtos/evaluacion-finca-mock.dart';
import '../../repositories/postcosecha.repository.dart';
import 'divider_widget.dart';
import 'form_field_widget.dart';

class SubCategorySection extends StatefulWidget {
  final Category category;
  final SubCategory subCategory;
  final GlobalKey<FormBuilderState> formkey;

  SubCategorySection({
    Key key,
    this.category,
    this.subCategory,
    this.formkey,
  }) : super(key: key);

  @override
  State<SubCategorySection> createState() => _SubCategorySectionState();
}

class _SubCategorySectionState extends State<SubCategorySection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.subCategory.respuestas.map(
        (e) {
          Item item = e;
          return Row(
            children: FormFieldWidget.generateElements({
              'postcosechaId': {
                'label': e.itemNombre,
                'type': FieldType.numberRange,
                'required': true
              },
              'tipoEvaluacion': {
                'label': 'Tipo evaluacion',
                'type': FieldType.numberResult,
                'required': true
              },
            }, widget.formkey)
                .map(
                  (e) => Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: e,
                    ),
                  ),
                )
                .toList(),
          );
        },
      ).toList(),
    );
  }
}
