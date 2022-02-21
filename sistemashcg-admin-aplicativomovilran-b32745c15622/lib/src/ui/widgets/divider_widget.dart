import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final Text displayText;

  const Header({Key key, this.displayText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Center(
        child: Column(
          children: <Widget>[Divider(), displayText, Divider()],
        ),
      ),
    );
  }
}
