import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:ranking_app/locator.dart';
import 'package:ranking_app/src/dtos/sincronizacion.dto.dart';
import 'package:ranking_app/src/repositories/tamano-boton.repository.dart';
import 'package:ranking_app/src/services/sincronizacion.service.dart';

class MainSincroPage extends StatefulWidget {
   @override
  _MainSincroPageState createState() => _MainSincroPageState();
}

class _MainSincroPageState extends State<MainSincroPage>{
  bool sinc = false;
  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  String tamanioBoton = "";
  String maltrato = "";
  String informacionAdicional = "";
  String auditoriaFinca = "";
  String auditoriaAgencia = "";

  @override
  void initState() {
    loadData();
    super.initState();
  }

  loadData() async {
    SincronizacionDto sincronizacionDto = new SincronizacionDto();
    try{
      sincronizacionDto = await locator<SincronizacionService>().selectAllEntities();
    }catch(e){}
    tamanioBoton = 'Listado total del proceso de tamaño de botón\nCantidad '+ sincronizacionDto.tamanioBotonCantidad.toString();
    maltrato = 'Listado total del proceso de proceso maltrato\nCantidad '+ sincronizacionDto.maltratoCantidad.toString();
    informacionAdicional = 'Listado total del proceso de información adicional\nCantidad '+ sincronizacionDto.infoAdicionalCantidad.toString();
    auditoriaFinca = 'Listado total de auditoría en finca\nCantidad '+ sincronizacionDto.audiFincaCantidad.toString();
    auditoriaAgencia = 'Listado total de auditoría en agencia\nCantidad '+ sincronizacionDto.audiAgenciaCantidad.toString();
    setState(() {});
  }

  @override
   Widget build(BuildContext context) {
     var width = MediaQuery.of(context).size.width;
     return  Scaffold(
       key: scaffoldKey,
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
                Text('MÓDULO DE SINCRONIZACIÓN', style: Theme.of(context).textTheme.headline6,),
                Divider(),
                Column(
                   children: [
                     cardWidgetView(Icons.filter_vintage, "Tamaño de botón", tamanioBoton,function: () => {sincronizarTamanioBoton()}),
                     cardWidgetView(Icons.stream,"Proceso Maltrato", maltrato,function: () => {sincronizarMaltrato()}),
                     cardWidgetView(Icons.local_library,"Información adicional", informacionAdicional,function: () => {sincronizarInformacionAdicional()}),
                     cardWidgetView(Icons.table_view,"Auditoría en Finca", auditoriaFinca,function: () => {sincronizarEvaluacionFinca()}),
                     cardWidgetView(Icons.wysiwyg,"Auditoría en Agencia", auditoriaAgencia,function: () => {sincronizarEvaluacionAgencia()}),
                   ],
                 ),
               ],
             ),
           ],),
         ),
       ),
     );
   }

   Widget cardWidgetView(IconData icons, String title, String subtitle, {Function function}){
       return Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          margin: EdgeInsets.all(10),
          elevation: 10,
          child: Column(
            children: <Widget>[
              ListTile(
                contentPadding: EdgeInsets.fromLTRB(15, 10, 25, 0),
                title: Text(title??""),
                subtitle:  Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(subtitle??""),
                    //Text('Listado total del proceso de tamano de boton\nCantidad 12'),
                  ],
                ),
                leading: Icon(icons),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  FlatButton(onPressed: function , child: Text('Sincronizar'))
                ],
              )
            ],
          ),
        );
    }

   sincronizarTamanioBoton() async {
     await locator<SincronizacionService>().sincronizarTamanioBoton();
     loadData();
   }
   sincronizarMaltrato() async{
     await locator<SincronizacionService>().sincronizarMaltrato();
     loadData();
   }
   sincronizarInformacionAdicional() async{
     await locator<SincronizacionService>().sincronizarInformacionAdicional();
     loadData();
   }
   sincronizarEvaluacionFinca() async{
     await locator<SincronizacionService>().sincronizarAuditoriaFinca();
     loadData();
   }
   sincronizarEvaluacionAgencia() async{
     await locator<SincronizacionService>().sincronizarAuditoriaAgencia();
     loadData();
   }
}