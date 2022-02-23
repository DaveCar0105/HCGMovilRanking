import 'package:flutter/material.dart';

class FormFooter extends StatelessWidget {
  final Function onSubmit;
  final Function onReset;

  const FormFooter({Key key, this.onSubmit, this.onReset}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        footerButton(context, "Submit", onSubmit),
        SizedBox(width: 20),
        footerButton(context, "Reset", onReset)
      ],
    );
  }

  Expanded footerButton(BuildContext context, text, callback) {
    return Expanded(
      child: MaterialButton(
        color: Theme.of(context).colorScheme.secondary,
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
        onPressed: callback,
      ),
    );
  }
}
