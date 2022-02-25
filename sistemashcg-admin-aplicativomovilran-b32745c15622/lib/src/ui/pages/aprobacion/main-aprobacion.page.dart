import 'package:flutter/material.dart';
import 'package:ranking_app/src/ui/pages/aprobacion/aprobacion.page.dart';
import 'package:ranking_app/src/ui/pages/procesos/tamano-boton/proceso-tamano-boton.page.dart';

class MainAprobacionPage extends StatefulWidget {
  @override
  _MainAprobacionPageState createState() => _MainAprobacionPageState();
}

class _MainAprobacionPageState extends State<MainAprobacionPage> {
  bool _switchVal = true;
  bool sinc = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: AprobacionPage(valor: this._switchVal,ramosId: 10,),
    );
  }
}

class Botones extends StatelessWidget {
  final Widget child;
  //final String text;
  const Botones({
    @required this.child,
    // @required this.text,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              this.child,
              SizedBox(
                height: 10,
              ),
              //Text(this.text, textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}
