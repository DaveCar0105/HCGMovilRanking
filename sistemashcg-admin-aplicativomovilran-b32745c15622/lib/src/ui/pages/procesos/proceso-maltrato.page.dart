import 'package:flutter/material.dart';


class ProcesoMaltratoPage extends StatefulWidget{
  bool valor;
  int ramosId;
  ProcesoMaltratoPage(bool valor, int ramosId){
    this.valor = valor;
    this.ramosId=ramosId;
  }
 @override
  _ProcesoMaltratoState createState() => _ProcesoMaltratoState(this.valor, this.ramosId);
}

class _ProcesoMaltratoState extends State<ProcesoMaltratoPage>{
   final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  
  bool elite = false;
  int ramosId= 1; 
  _ProcesoMaltratoState(bool valor, int ramosId){
    elite=valor;
    ramosId=ramosId;
  }
  
  
  @override
   Widget build(BuildContext context) {
     return  Scaffold(
       key: scaffoldKey,
       appBar: AppBar(title: Text('PROCESO MALTRATO'),
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
