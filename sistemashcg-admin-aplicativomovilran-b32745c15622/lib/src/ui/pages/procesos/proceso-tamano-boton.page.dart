

import 'package:flutter/material.dart';


class ProcesoTamanoBotonPage extends StatefulWidget{
  bool valor;
  int ramosId;
  ProcesoTamanoBotonPage(bool valor, int ramosId){
    this.valor = valor;
    this.ramosId=ramosId;
  }
 @override
  _ProcesoTamanoBotonState createState() => _ProcesoTamanoBotonState(this.valor, this.ramosId);
}

class _ProcesoTamanoBotonState extends State<ProcesoTamanoBotonPage>{
   final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  
  bool elite = false;
  int ramosId= 1; 
  _ProcesoTamanoBotonState(bool valor, int ramosId){
    elite=valor;
    ramosId=ramosId;
  }
  
  
  @override
   Widget build(BuildContext context) {
     return  Scaffold(
       key: scaffoldKey,
       appBar: AppBar(title: Text('Proceso tamano boton'),
       ),
       body: Container(
         padding: const EdgeInsets.all(16.0),
         width: double.infinity,
         child: Container(
           child: ListView(children:<Widget> [
             Column(
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: <Widget>[

               ],
             ),

           ],),
         ),
       ),
     );
   }
}
Widget _FechaDeAuditoria(){
  return Container(
    height: 100,
    width: 200,
    alignment: Alignment.center,
  
  );
}
