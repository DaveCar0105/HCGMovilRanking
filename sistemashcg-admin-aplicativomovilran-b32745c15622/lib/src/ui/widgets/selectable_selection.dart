import 'package:flutter/material.dart';
import 'package:ranking_app/src/dtos/evaluacion-finca-mock.dart';
import 'package:ranking_app/src/ui/widgets/category_section.dart';
import 'package:ranking_app/src/ui/widgets/divider_widget.dart';

enum SingingCharacter { SI, NO }

class SelectableSelection extends StatefulWidget {
  final content;

  SelectableSelection({Key key, this.content}) : super(key: key);

  @override
  State<SelectableSelection> createState() => _SelectableSelectionState();
}

class _SelectableSelectionState extends State<SelectableSelection> {
  SingingCharacter _character = SingingCharacter.NO;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildRadio(),
        if (_character == SingingCharacter.SI) widget.content
      ],
    );
  }

  Row _buildRadio() {
    return Row(
      children: <Widget>[
        Expanded(
          child: ListTile(
            title: const Text('Si'),
            leading: Radio<SingingCharacter>(
              value: SingingCharacter.SI,
              groupValue: _character,
              onChanged: (SingingCharacter value) =>
                  setState(() => _character = value),
            ),
          ),
        ),
        Expanded(
          child: ListTile(
            title: const Text('No'),
            leading: Radio<SingingCharacter>(
              value: SingingCharacter.NO,
              groupValue: _character,
              onChanged: (SingingCharacter value) =>
                  setState(() => _character = value),
            ),
          ),
        ),
      ],
    );
  }
}
