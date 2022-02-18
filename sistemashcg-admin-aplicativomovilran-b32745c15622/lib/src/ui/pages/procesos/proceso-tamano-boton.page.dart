




import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ranking_app/src/dtos/autocompletar.dto.dart';
import 'package:ranking_app/src/dtos/cliente.dto.dart';
import 'package:ranking_app/src/dtos/variedad.dto.dart';
import 'package:ranking_app/src/repositories/cliente.repository.dart';
import 'package:ranking_app/src/repositories/error.repository.dart';
import 'package:ranking_app/src/repositories/variedad.repository.dart';
import 'package:ranking_app/src/ui/widgets/autocompletar.widget.dart';
// import 'package:intl/intl.dart';
// import 'package:intl/date_symbol_data_local.dart';



class ProcesoTamanoBotonPage extends StatefulWidget{
  bool valor;
  int ramosId;
  ProcesoTamanoBotonPage(bool valor, int ramosId){
    this.valor = valor;
    this.ramosId=ramosId;
  }
 @override
  _ProcesoTamanoBotonState createState() => _ProcesoTamanoBotonState(ClienteRepository(ErrorRepository()),ClienteRepository(ErrorRepository()),VariedadRepository(ErrorRepository()), this.valor, this.ramosId);
}

class _ProcesoTamanoBotonState extends State<ProcesoTamanoBotonPage>{
   final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

   final gradoCm = TextEditingController();

   final areaRamoLargo = TextEditingController();
   final areaRamoAncho = TextEditingController();

   final tamanoBoton1 = TextEditingController();
   final tamanoBoton2 = TextEditingController();
   final tamanoBoton3 = TextEditingController();
   final numeroPetalos = TextEditingController();
   
 GlobalKey<ListaBusquedaState> _keyCliente = GlobalKey();
  static List<AutoComplete> listaCliente = [];
  final ClienteRepository _clienteRepository;
  String clienteNombre = "";
  int clienteId = 0;
  bool clientEnable = false;

  GlobalKey<ListaBusquedaState> _keySubCliente = GlobalKey();
  static List<AutoComplete> listaSubCliente =[];
  final ClienteRepository _subclienteRepository; // hacerlo para subclientes
  String subClienteNombre="";
  int subClienteId=0;
  bool subClientEnable=false;

  GlobalKey<ListaBusquedaState> _keyVariedad =GlobalKey();
  static List<AutoComplete> listaVariedad=[];
  final VariedadRepository _variedadRepository;
  String variedadNombre="";
  int variedadId=0;
  bool variedadEnable=false; 


  bool elite = false;
  int ramosId= 1; 
  _ProcesoTamanoBotonState(this._clienteRepository,this._subclienteRepository,this._variedadRepository, valor, int ramosId){
    elite=valor;
    ramosId=ramosId;
  }

cargarRamos(int ramosId) async {
    listaCliente = [];
    listaSubCliente=[];
    listaVariedad=[];
  
    int valor = 0;
    if (elite) {
      valor = 1;
    }
    List<ClienteDto> clientes = [];
    clientes = await this._clienteRepository.selectAll();
    clientes.forEach((element) {
      listaCliente.add(
          AutoComplete(id: element.clienteId, nombre: element.clienteNombre));
    });

List<ClienteDto> subClientes = [];
    subClientes  = await this._clienteRepository.selectAll();
    subClientes .forEach((element) {
      listaCliente.add(
          AutoComplete(id: element.clienteId, nombre: element.clienteNombre));
    });

  List<VariedadDto> variedades=[];
  variedades=await this._variedadRepository.selectAll();
  variedades.forEach((element){
    listaVariedad.add(AutoComplete(id: element.variedadId, nombre: element.variedadNombre));
  });

    setState(() {
      clientEnable = true;
      subClientEnable=true;
      variedadEnable=true;

      
    });
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
                 Divider(),
                Text('INFORMACION GENERAL EVALUACION FINCA'),
                 _cliente(context),
                 _subCliente(context),
                Divider(),
                Text('VARIEDAD A EVALUAR '),
                _variedad(context),
                _gradoCm(),
                Divider(),
                Text('AREA DEL RAMO'),
                _areaRamoLargo(),
                _areaRamoAncho(),
                Divider(),
                Text('TAMANO DE BOTON'),
                _tamanoBoton1(),
                _tamanoBoton2(),
                _tamanoBoton3(),
                Divider(),
                Text('NUMERO DE PETALOS'),
                _numeroPetalos()
               

                 

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

//INFORMACION GENERAL EVALUACION FINCA

Widget _cliente(context) {
    return Container(
      child: 
      //clientEnable?
           ListaBusqueda(
              key: _keyCliente,
              lista: listaCliente,
              hintText: "Producto",
              valorDefecto: clienteNombre,
              hintSearchText: "Escriba el nombre del producto",
              icon: Icon(Icons.local_florist),
              width: MediaQuery.of(context).size.width * 0.75,
              style: TextStyle(
                fontSize: 15,
              ),
              parentAction: (value) {
                if (value != null && value != "") {
                  AutoComplete cliente = listaCliente.firstWhere((item) {
                    return item.nombre == value;
                  });
                  clienteId = cliente.id;
                }
              },
            )
          // : Container(
          //     child: CircularProgressIndicator(),
          //   ),
    );
  }

Widget _subCliente(context) {
    return Container(
      child: 
      //subClientEnable?
           
          ListaBusqueda(
              key: _keySubCliente,
              lista: listaSubCliente,
              hintText: "Producto",
              valorDefecto: subClienteNombre,
              hintSearchText: "Escriba el nombre del producto",
              icon: Icon(Icons.local_florist),
              width: MediaQuery.of(context).size.width * 0.75,
              style: TextStyle(
                fontSize: 15,
              ),
              parentAction: (value) {
                if (value != null && value != "") {
                  AutoComplete subCliente = listaSubCliente.firstWhere((item) {
                    return item.nombre == value;
                  });
                  subClienteId = subCliente.id;
                }
              },
            )
          // : Container(
          //     child: CircularProgressIndicator(),
          //   ),
    );
  }
  //VARIEDAD A EVALUAR
  Widget _variedad(context) {
    return Container(
      child: 
      //variedadEnable?
           ListaBusqueda(
              key: _keyVariedad,
              lista: listaVariedad,
              hintText: "Producto",
              valorDefecto: variedadNombre,
              hintSearchText: "Escriba el nombre del producto",
              icon: Icon(Icons.local_florist),
              width: MediaQuery.of(context).size.width * 0.75,
              style: TextStyle(
                fontSize: 15,
              ),
              parentAction: (value) {
                if (value != null && value != "") {
                  AutoComplete variedad = listaVariedad.firstWhere((item) {
                    return item.nombre == value;
                  });
                  variedadId = variedad.id;
                }
              },
            )
          // : Container(
          //     child: CircularProgressIndicator(),
          //   ),
    );
  }

Widget _gradoCm(){
  return Container(
     //width: MediaQuery.of(context).size.width * 0.85,
      child: TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: 'Grado(cm)',
          labelText: 'Grado(cm)',
        ),
        controller: gradoCm,
      ),
  );
}

//AREA DE RAMO

Widget _areaRamoLargo(){
  return Container(
     //width: MediaQuery.of(context).size.width * 0.85,
      child: TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: 'Largo(cm)',
          labelText: 'Largo(cm)',
        ),
        controller: areaRamoLargo,
      ),
  );
}
Widget _areaRamoAncho(){
  return Container(
     //width: MediaQuery.of(context).size.width * 0.85,
      child: TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: 'Ancho(cm)',
          labelText: 'Ancho(cm)',
        ),
        controller: areaRamoAncho,
      ),
  );
}

//TAMANO BOTON

Widget _tamanoBoton1(){
  return Container(
     //width: MediaQuery.of(context).size.width * 0.85,
      child: TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: 'Tamano del Boton1(cm)',
          labelText: 'Tamano del Boton1(cm)',
        ),
        controller: tamanoBoton1,
      ),
  );
}
Widget _tamanoBoton2(){
  return Container(
     //width: MediaQuery.of(context).size.width * 0.85,
      child: TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: 'Tamano del Boton2(cm)',
          labelText: 'Tamano del Boton2(cm)',
        ),
        controller: tamanoBoton2,
      ),
  );
}
Widget _tamanoBoton3(){
  return Container(
     //width: MediaQuery.of(context).size.width * 0.85,
      child: TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: 'Tamano del Boton3(cm)',
          labelText: 'Tamano del Boton3(cm)',
        ),
        controller: tamanoBoton3,
      ),
  );
}


//NUMERO DE PETALOS
Widget _numeroPetalos(){
  return Container(
     //width: MediaQuery.of(context).size.width * 0.85,
      child: TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: 'Numero de petalos',
          labelText: 'Numero de petalos',
        ),
        controller: numeroPetalos,
      ),
  );
}

}


//  Widget _listaClientes() {

//    String dropValue ='Seleccione el cliente';
//    @override
//    Widget build(BuildContext context) {
//      return DropdownButton<String>(
//        value: dropValue,
//        icon: const Icon(Icons.arrow_downward),
//        elevation: 16,
//        style: const TextStyle(color: Colors.orange),
//        underline: Container(height: 2, color: Colors.orange,),
//        onChanged: (String newValue){
//          setState((){dropValue=newValue;});
//        },
//        items: <String>['cliente1','cliente2'].map<DropdownMenuItem<String>>((String value){
//          return DropdownMenuItem(value: value,child: Text(value));
//        },).toList(),);
//    }

//   }





  
  

