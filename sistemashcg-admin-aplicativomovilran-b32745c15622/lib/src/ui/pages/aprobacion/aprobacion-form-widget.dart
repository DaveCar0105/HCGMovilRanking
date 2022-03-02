import 'package:flutter/material.dart';
import 'package:ranking_app/locator.dart';
import 'package:ranking_app/src/dtos/tamano-boton.dto.dart';
import 'package:ranking_app/src/repositories/tamano-boton.repository.dart';

import '../../../repositories/informacion-adicional.repository.dart';
import '../../../repositories/maltrato.repository.dart';

class AprobacionForm extends StatefulWidget {
  @override
  State<AprobacionForm> createState() => _AprobacionFormState();
}

class _AprobacionFormState extends State<AprobacionForm>
    with SingleTickerProviderStateMixin {
  var index = 0;

  static const List<Tab> myTabs = <Tab>[
    Tab(
      icon: Icon(Icons.local_florist),
    ),
    Tab(
      icon: Icon(Icons.set_meal),
    ),
    Tab(
      icon: Icon(Icons.local_shipping),
    )
  ];

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: myTabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: TabBar(controller: _tabController, tabs: myTabs),
        ),
        body: TabBarView(controller: _tabController, children: [
          FutureBuilder(
            future: locator<TamanoBotonRepository>().selectAll(),
            builder: (context, snapshot) {
                    if (!snapshot.hasData) return CircularProgressIndicator();
                    var list = snapshot.data;
                    return ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, index) =>
                          FormDetail(detailContent: list[index], titleContent: "Tamano Boton",),
                    );
            },
          ),
          FutureBuilder(
            future: locator<MaltratoRepository>().selectAll(),
            builder: (context, snapshot) {
                    if (!snapshot.hasData) return CircularProgressIndicator();
                    var list = snapshot.data;
                    return ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, index) =>
                          FormDetail(detailContent: list[index], titleContent: "Proceso Maltrato",),
                    );
            },
          ),
          FutureBuilder(
            future: locator<InformacionAdicionalRepository>().selectAll(),
            
            builder: (context, snapshot) {
                    if (!snapshot.hasData) return CircularProgressIndicator();
                    var list = snapshot.data;
                    return ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, index) =>
                          FormDetail(detailContent: list[index], titleContent: "Informacion Adicional",),
                    );
            },
          ),
          
        ]),
      ),
    );
  }
}

class FormDetail extends StatelessWidget {
  final detailContent;
  final titleContent;

  const FormDetail({
    Key key,
    this.detailContent,
    this.titleContent
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(15),
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.fromLTRB(15, 19, 25, 0),
              title: Text(this.titleContent??"S/N", style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            ...detailContent
                .toJsonAprobacion()
                .entries
                .map((e) => detalleItemWidget(e))
                .toList()
          ],
        ),
      ),
    );
  }

  Widget detalleItemWidget(e){
    return Row(
      children: [
        Expanded(child: Text(e.key)),
        Expanded(child: Text(e.value.toString())),
      ],
    );
  }
}
