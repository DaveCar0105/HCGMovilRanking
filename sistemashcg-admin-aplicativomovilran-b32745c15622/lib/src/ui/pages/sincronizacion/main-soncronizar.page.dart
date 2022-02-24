import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:ranking_app/src/ui/pages/procesos/tamano-boton/proceso-tamano-boton.page.dart';

class MainSincroPage extends StatefulWidget {
   @override
  _MainSincroPageState createState() => _MainSincroPageState();
}

class _MainSincroPageState extends State<MainSincroPage>{
  bool _switchVal = true;
  bool sinc = false;
    final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
    final _formKey = GlobalKey<FormBuilderState>();

  @override
   Widget build(BuildContext context) {
     var width = MediaQuery.of(context).size.width;
     return  Scaffold(
       key: scaffoldKey,

      //  appBar: AppBar(title: Text('Proceso tamano boton'),
      //  ),
       body: Container(
         margin: EdgeInsets.all(10),
         padding: EdgeInsets.all(15),
         decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(10),
           border: Border.all(color: Colors.orange, width: 2),
         ),
         width: double.infinity,
         child: Container(
           child: ListView(children:<Widget> [
             Column(
          
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: <Widget>[
                Text('INFORMACION GENERAL EVALUACION FINCA'),
                Divider(),
                 Column(
                   children: [
                     Text('TAMANO BOTON', style: Theme.of(context).textTheme.headline6),
                     Row(
                       children: [Text('Numero de Formulios:',style: Theme.of(context).textTheme.subtitle1),],
                     ),
                      Row(
                       children: [
                        RaisedButton(child: Text('Sicronizar'),
                        color: Colors.green,
                        disabledColor:Colors.green,
                        padding: EdgeInsets.all(10),
                        onPressed: (){print("sincronizado");},
                        
                         )],
                     ),
                   ],
                 ),
                 Divider(),
                  Column(
                    children: [
                     Text('MALTRATO', style: Theme.of(context).textTheme.headline6),
                     Row(
                       children: [Text('Numero de Formulios:',style: Theme.of(context).textTheme.subtitle1),],
                     ),
                      Row(
                       children: [
                        RaisedButton(child: Text('Sicronizar'),
                        color: Colors.green,
                        disabledColor:Colors.green,
                        padding: EdgeInsets.all(10),
                        onPressed: (){print("sincronizado");},
                        
                         )],
                     ),
                   ],
                 ),
                
                Divider(),
                 Column(
                children: [
                     Text('INFORMACION ADICIONAL', style: Theme.of(context).textTheme.headline6),
                     Row(
                       children: [Text('Numero de Formulios:',style: Theme.of(context).textTheme.subtitle1),],
                     ),
                      Row(
                       children: [
                        RaisedButton(child: Text('Sicronizar'),
                        color: Colors.green,
                        disabledColor:Colors.green,
                        padding: EdgeInsets.all(10),
                        onPressed: (){print("sincronizado");},
                        
                         )],
                     ),
                   ],
                 ),
                 Divider(),
                  Column(
                   children: [
                     Text('REPORTE DE AGENCIA HC', style: Theme.of(context).textTheme.headline6),
                     Row(
                       children: [Text('Numero de Formulios:',style: Theme.of(context).textTheme.subtitle1),],
                     ),
                      Row(
                       children: [
                        RaisedButton(child: Text('Sicronizar'),
                        color: Colors.green,
                        disabledColor:Colors.green,
                        padding: EdgeInsets.all(10),
                        onPressed: (){print("sincronizado");},
                        
                         )],
                     ),
                   ],
                 ),
                 Divider(),
                  Column(
                   children: [
                     Text('EVALUACION TINAS Y CAJAS', style: Theme.of(context).textTheme.headline6),
                     Row(
                       children: [Text('Numero de Formulios:',style: Theme.of(context).textTheme.subtitle1),],
                     ),
                      Row(  
                       children: [
                        RaisedButton(child: Text('Sicronizar'),
                        color: Colors.green,
                        disabledColor:Colors.green,
                        padding: EdgeInsets.all(10),
                        onPressed: (){print("sincronizado");},
                        
                         )],
                     ),
                   ],
                 ),
                

               ],
             ),
            //  Column(children: <Widget>[
            //           Expanded(
            //             child: RaisedButton.icon(
            //               //onPressed: _validarFormulario,
            //               color: Colors.red,
            //               textColor: Colors.white,
            //               icon: Icon(Icons.save),
            //               label: Text('Guardar'),
            //             ),
            //           )
            //         ],
            //         ),

           ],),
         ),
       ),
     );
   }


// class Botones extends StatelessWidget {
//   final Widget child;
//   //final String text;
//   const Botones({
//     @required this.child,
//     // @required this.text,
//     Key key,
//   }) : super(key: key);

// @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Center(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: <Widget>[
//               this.child,
//               SizedBox(
//                 height: 10,
//               ),
//               //Text(this.text, textAlign: TextAlign.center),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
}