import 'package:flutter/material.dart';
import 'package:ranking_app/src/ui/widgets/divider_widget.dart';

class SurveySection extends StatelessWidget {
  final content;
  final title;
  const SurveySection({Key key, this.content, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Header(
            displayText: title,
          ),
          content
        ],
      ),
    );
  }
}
