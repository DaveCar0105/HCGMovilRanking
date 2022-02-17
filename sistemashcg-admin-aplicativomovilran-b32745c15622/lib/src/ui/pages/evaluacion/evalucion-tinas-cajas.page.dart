import 'package:flutter/material.dart';


class EvaluacionTinasCajasPage extends StatefulWidget{
  bool valor;
  int ramosId;
  EvaluacionTinasCajasPage(bool valor, int ramosId){
    this.valor = valor;
    this.ramosId=ramosId;
  }
 @override
  _EvaluacionTinasCajasState createState() => _EvaluacionTinasCajasState(this.valor, this.ramosId);
}

class _EvaluacionTinasCajasState extends State<EvaluacionTinasCajasPage>{
   final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  
  bool elite = false;
  int ramosId= 1; 
  _EvaluacionTinasCajasState(bool valor, int ramosId){
    elite=valor;
    ramosId=ramosId;
  }
  
  
  @override
   Widget build(BuildContext context) {
     return  Scaffold(
       key: scaffoldKey,
       appBar: AppBar(title: Text('EVALUACION TINAS Y CAJAS'),
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
