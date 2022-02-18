import 'package:flutter/material.dart';
import 'package:ranking_app/src/dtos/autocompletar.dto.dart';
import 'package:ranking_app/src/dtos/causa.dto.dart';
import 'package:ranking_app/src/dtos/cliente.dto.dart';
import 'package:ranking_app/src/repositories/causa.repository.dart';
import 'package:ranking_app/src/repositories/cliente.repository.dart';
import 'package:ranking_app/src/repositories/error.repository.dart';
import 'package:ranking_app/src/ui/widgets/autocompletar.widget.dart';


class InformacionAdicionalPage extends StatefulWidget{
  bool valor;
  int ramosId;
  InformacionAdicionalPage(bool valor, int ramosId){
    this.valor = valor;
    this.ramosId=ramosId;
  }
 @override
  _InformacionAdicionalState createState() => _InformacionAdicionalState(ClienteRepository(ErrorRepository()),ClienteRepository(ErrorRepository()), CausaRepository(ErrorRepository()),
  CausaRepository(ErrorRepository()),CausaRepository(ErrorRepository()),CausaRepository(ErrorRepository()),CausaRepository(ErrorRepository()), this.valor, this.ramosId);
}

class _InformacionAdicionalState extends State<InformacionAdicionalPage>{
   final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  //RENDIMIENTO
 final rendimientoSala = TextEditingController();
 final rendimientoBoncheo = TextEditingController();
 final rendimientoCorte = TextEditingController();
 final rendimientoFinca = TextEditingController();

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
//FLOR NACIONAL
  final porcentajeFlorNacional = TextEditingController();

   GlobalKey<ListaBusquedaState> _keyCausa1 = GlobalKey();
  static List<AutoComplete> listaCausa1 =[];
  final CausaRepository _causaRepository; // hacerlo para subclientes
  String causa1Nombre="";
  int causa1Id=0;
  bool causa1Enable=false;
  final porcentajeCausa1 = TextEditingController();

   GlobalKey<ListaBusquedaState> _keyCausa2 = GlobalKey();
  static List<AutoComplete> listaCausa2 =[];
  final CausaRepository _causaRepository2; // hacerlo para subclientes
  String causa2Nombre="";
  int causa2Id=0;
  bool causa2Enable=false;
  final porcentajeCausa2 = TextEditingController();

   GlobalKey<ListaBusquedaState> _keyCausa3 = GlobalKey();
  static List<AutoComplete> listaCausa3 =[];
  final CausaRepository _causaRepository3; // hacerlo para subclientes
  String causa3Nombre="";
  int causa3Id=0;
  bool causa3Enable=false;
  final porcentajeCausa3 = TextEditingController();

   GlobalKey<ListaBusquedaState> _keyCausa4 = GlobalKey();
  static List<AutoComplete> listaCausa4 =[];
  final CausaRepository _causaRepository4; // hacerlo para subclientes
  String causa4Nombre="";
  int causa4Id=0;
  bool causa4Enable=false;
  final porcentajeCausa4 = TextEditingController();

   GlobalKey<ListaBusquedaState> _keyCausa5 = GlobalKey();
  static List<AutoComplete> listaCausa5 =[];
  final CausaRepository _causaRepository5; // hacerlo para subclientes
  String causa5Nombre="";
  int causa5Id=0;
  bool causa5Enable=false;
  final porcentajeCausa5 = TextEditingController();


  bool elite = false;
  int ramosId= 1; 
  _InformacionAdicionalState(this._clienteRepository,this._subclienteRepository,this._causaRepository,
  this._causaRepository2,this._causaRepository3,this._causaRepository4,this._causaRepository5, valor, int ramosId){
    elite=valor;
    ramosId=ramosId;
  }
  cargarRamos(int ramosId) async {
    listaCliente = [];
    listaSubCliente=[];
    listaCausa1= [];
    listaCausa2 =[];
    listaCausa3 =[];
    listaCausa4 =[];
    listaCausa5 =[];
  
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

    List<CausaDto> causa1 =[];
     causa1  = await this._causaRepository.selectAll();
    causa1 .forEach((element) {
      listaCausa1.add(
          AutoComplete(id: element.causaId, nombre: element.causaNombre));
    });
    List<CausaDto> causa2 =[];
     causa2  = await this._causaRepository.selectAll();
    causa2 .forEach((element) {
      listaCausa1.add(
          AutoComplete(id: element.causaId, nombre: element.causaNombre));
    });
    List<CausaDto> causa3 =[];
     causa3  = await this._causaRepository.selectAll();
    causa3 .forEach((element) {
      listaCausa1.add(
          AutoComplete(id: element.causaId, nombre: element.causaNombre));
    });
    List<CausaDto> causa4 =[];
     causa4  = await this._causaRepository.selectAll();
    causa4 .forEach((element) {
      listaCausa1.add(
          AutoComplete(id: element.causaId, nombre: element.causaNombre));
    });
    List<CausaDto> causa5 =[];
     causa5  = await this._causaRepository.selectAll();
    causa5 .forEach((element) {
      listaCausa1.add(
          AutoComplete(id: element.causaId, nombre: element.causaNombre));
    });

 
    setState(() {
      clientEnable = true;
      subClientEnable=true;
      causa1Enable=true;
      causa2Enable=true;
      causa3Enable=true;
      causa4Enable=true;
      causa5Enable=true;
    });
  }
  
  @override
   Widget build(BuildContext context) {
     return  Scaffold(
       key: scaffoldKey,
       appBar: AppBar(title: Text('INFORMACION ADICIONAL'),
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
                 Text('INFORMACION GENERAL EVALUACION FINCA'),
                 _cliente(context),
                 _subCliente(context),
                 Divider(),
                 Text('RENDIMIENTO PROMEDIO'),
                 _rendimientoSala(),
                 _rendimientoBoncheo(),
                 _rendimientoCorte(),
                 _rendimientoFinca(),
                 Divider(),
                 Text('FLOR NACIONAL'),
                 _porcentajeFlorNacional(),
                 Divider(),
                 _causa1(context),
                 _porcentajeCausa1(),
                 Divider(),
                 _causa2(context),
                 _porcentajeCausa2(),
                 Divider(),
                 _causa3(context),
                 _porcentajeCausa3(),
                 Divider(),
                 _causa4(context),
                 _porcentajeCausa4(),
                 Divider(),
                 _causa5(context),
                 _porcentajeCausa5()

               ],
             ),

           ],),
         ),
       ),
     );
   }


  Widget _cliente(context) {
    return Container(
      child: clientEnable
          ? ListaBusqueda(
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
          : Container(
              child: CircularProgressIndicator(),
            ),
    );
  }

Widget _subCliente(context) {
    return Container(
      child: subClientEnable
          ? ListaBusqueda(
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
          : Container(
              child: CircularProgressIndicator(),
            ),
    );
  }

 // RENDIMIENTO PROMEDIO
 Widget _rendimientoSala(){
  return Container(
     //width: MediaQuery.of(context).size.width * 0.85,
      child: TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: 'Rendimiento Sala (t/p/h)',
          labelText: 'Rendimiento Sala(t/p/h)',
        ),
        controller: rendimientoSala,
      ),
  );
}
 Widget _rendimientoBoncheo(){
  return Container(
     //width: MediaQuery.of(context).size.width * 0.85,
      child: TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: 'Rendimiento Boncheo(t/p/h)',
          labelText: 'Rendimiento Boncheo(t/p/h)',
        ),
        controller: rendimientoBoncheo,
      ),
  );
}
 Widget _rendimientoCorte(){
  return Container(
     //width: MediaQuery.of(context).size.width * 0.85,
      child: TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: 'Rendimiento Corte(t/p/h)',
          labelText: 'Rendimiento Corte(t/p/h)',
        ),
        controller: rendimientoCorte,
      ),
  );
}
 Widget _rendimientoFinca(){
  return Container(
     //width: MediaQuery.of(context).size.width * 0.85,
      child: TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: 'Rendimiento Finca(t/p/h)',
          labelText: 'Rendimiento Finca(t/p/h)',
        ),
        controller: rendimientoFinca,
      ),
  );
}
//FLORE NACIONAL
 Widget _porcentajeFlorNacional(){
  return Container(
     //width: MediaQuery.of(context).size.width * 0.85,
      child: TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: '% Flor Nacional',
          labelText: '% Flor Nacional',
        ),
        controller: porcentajeFlorNacional,
      ),
  );
}
  Widget _causa1(context) {
    return Container(
      child: causa1Enable
          ? ListaBusqueda(
              key: _keyCausa1,
              lista: listaCausa1,
              hintText: "Causa1",
              valorDefecto: causa1Nombre,
              hintSearchText: "Escriba el nombre del producto",
              icon: Icon(Icons.local_florist),
              width: MediaQuery.of(context).size.width * 0.75,
              style: TextStyle(
                fontSize: 15,
              ),
              parentAction: (value) {
                if (value != null && value != "") {
                  AutoComplete causa1 = listaCausa1.firstWhere((item) {
                    return item.nombre == value;
                  });
                  causa1Id = causa1.id;
                }
              },
            )
          : Container(
              child: CircularProgressIndicator(),
            ),
    );
  }
   Widget _porcentajeCausa1(){
  return Container(
     //width: MediaQuery.of(context).size.width * 0.85,
      child: TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: '% Causa1',
          labelText: '% Causa1',
        ),
        controller: porcentajeCausa1,
      ),
  );
}
  Widget _causa2(context) {
    return Container(
      child: causa2Enable
          ? ListaBusqueda(
              key: _keyCausa2,
              lista: listaCausa2,
              hintText: "Causa2",
              valorDefecto: causa2Nombre,
              hintSearchText: "Escriba el nombre del producto",
              icon: Icon(Icons.local_florist),
              width: MediaQuery.of(context).size.width * 0.75,
              style: TextStyle(
                fontSize: 15,
              ),
              parentAction: (value) {
                if (value != null && value != "") {
                  AutoComplete causa2 = listaCausa2.firstWhere((item) {
                    return item.nombre == value;
                  });
                  causa2Id = causa2.id;
                }
              },
            )
          : Container(
              child: CircularProgressIndicator(),
            ),
    );
  }
   Widget _porcentajeCausa2(){
  return Container(
     //width: MediaQuery.of(context).size.width * 0.85,
      child: TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: '% Causa2',
          labelText: '% Causa2',
        ),
        controller: porcentajeCausa2,
      ),
  );
}
  Widget _causa3(context) {
    return Container(
      child: causa3Enable
          ? ListaBusqueda(
              key: _keyCausa3,
              lista: listaCausa3,
              hintText: "Causa3",
              valorDefecto: causa3Nombre,
              hintSearchText: "Escriba el nombre del producto",
              icon: Icon(Icons.local_florist),
              width: MediaQuery.of(context).size.width * 0.75,
              style: TextStyle(
                fontSize: 15,
              ),
              parentAction: (value) {
                if (value != null && value != "") {
                  AutoComplete causa3 = listaCausa3.firstWhere((item) {
                    return item.nombre == value;
                  });
                  causa3Id = causa3.id;
                }
              },
            )
          : Container(
              child: CircularProgressIndicator(),
            ),
    );
  }
   Widget _porcentajeCausa3(){
  return Container(
     //width: MediaQuery.of(context).size.width * 0.85,
      child: TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: '% Causa3',
          labelText: '% Causa3',
        ),
        controller: porcentajeCausa3,
      ),
  );
}
  Widget _causa4(context) {
    return Container(
      child: causa1Enable
          ? ListaBusqueda(
              key: _keyCausa4,
              lista: listaCausa4,
              hintText: "Causa4",
              valorDefecto: causa4Nombre,
              hintSearchText: "Escriba el nombre del producto",
              icon: Icon(Icons.local_florist),
              width: MediaQuery.of(context).size.width * 0.75,
              style: TextStyle(
                fontSize: 15,
              ),
              parentAction: (value) {
                if (value != null && value != "") {
                  AutoComplete causa4 = listaCausa4.firstWhere((item) {
                    return item.nombre == value;
                  });
                  causa4Id = causa4.id;
                }
              },
            )
          : Container(
              child: CircularProgressIndicator(),
            ),
    );
  }
   Widget _porcentajeCausa4(){
  return Container(
     //width: MediaQuery.of(context).size.width * 0.85,
      child: TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: '% Causa4',
          labelText: '% Causa4',
        ),
        controller: porcentajeCausa4,
      ),
  );
}
  Widget _causa5(context) {
    return Container(
      child: causa5Enable
          ? ListaBusqueda(
              key: _keyCausa5,
              lista: listaCausa5,
              hintText: "Causa5",
              valorDefecto: causa5Nombre,
              hintSearchText: "Escriba el nombre del producto",
              icon: Icon(Icons.local_florist),
              width: MediaQuery.of(context).size.width * 0.75,
              style: TextStyle(
                fontSize: 15,
              ),
              parentAction: (value) {
                if (value != null && value != "") {
                  AutoComplete causa5 = listaCausa5.firstWhere((item) {
                    return item.nombre == value;
                  });
                  causa5Id = causa5.id;
                }
              },
            )
          : Container(
              child: CircularProgressIndicator(),
            ),
    );
  }
   Widget _porcentajeCausa5(){
  return Container(
     //width: MediaQuery.of(context).size.width * 0.85,
      child: TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: '% Causa5',
          labelText: '% Causa5',
        ),
        controller: porcentajeCausa5,
      ),
  );
}
}

