import 'package:flutter/material.dart';
import 'package:flutter_form_builder/src/form_builder.dart';

import '../../dtos/evaluacion-finca-form-parse.dto.dart';
import 'divider_widget.dart';
import 'selectable_selection.dart';
import 'sub_category_section.dart';

class CategorySection extends StatefulWidget {
  final Categoria category;
  final GlobalKey<FormBuilderState> formKey;

  CategorySection({
    Key key,
    this.category,
    this.formKey,
  }) : super(key: key);

  @override
  State<CategorySection> createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
  @override
  Widget build(BuildContext context) {
    return _buildSectionBody();
  }

  Column _buildSectionBody() {
    return Column(
      children: [
        Header(
          displayText: Text(widget.category.categoriaNombre),
        ),
        ListView.builder(
          shrinkWrap: true,
          itemCount: widget.category.subcategorias.length,
          itemBuilder: (context, index) {
            Subcategoria actualElement = widget.category.subcategorias[index];
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(actualElement.subcategoriaNombre),
                  Divider(),
                  SelectableSelection(
                    content: SubCategorySection(
                      category: widget.category,
                      subCategory: actualElement,
                      formkey: widget.formKey,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
