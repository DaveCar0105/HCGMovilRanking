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
    ),
    Tab(
      icon: Icon(Icons.directions_boat),
    ),
    Tab(
      icon: Icon(Icons.anchor_rounded),
    ),
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
          ...[
            locator<TamanoBotonRepository>().selectAll(),
            locator<MaltratoRepository>().selectAll(),
            locator<InformacionAdicionalRepository>().selectAll(),
            locator<TamanoBotonRepository>().selectAll(),
            locator<TamanoBotonRepository>().selectAll(),
          ]
              .map(
                (e) => FutureBuilder(
                  future: e,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) return CircularProgressIndicator();

                    var list = snapshot.data;
                    return ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (context, index) =>
                          FormDetail(detailContent: list[index]),
                    );
                  },
                ),
              )
              .toList()
        ]),
        // body: TabBarView(
        // //   children: [
        // //     ListView.builder(
        // //       // itemCount: listaReportes.length,
        // //       // itemBuilder: (context, index) =>
        // //       //     _itemReporte(listaReportes[index], w),
        // //     ),
        // //     ListView.builder(
        // //       // itemCount: listaBandas.length,
        // //       // itemBuilder: (context, index) => _itemResumenBanda(
        // //       //     listaBandas[index], w), //cambiar la variable despues
        // //     ),
        // //     ListView.builder(
        // //       // itemCount: listaReporteDestinoEcommerce.length,
        // //       // itemBuilder: (context, index) => _itemResumenDestinoEcommerce(
        // //       //     listaReporteDestinoEcommerce[index], w),
        // //     ),
        // //     ListView.builder(

        // //       // itemCount: listaProcesoMaritimo.length,
        // //       // itemBuilder: (context, index) =>
        // //       //     _itemResumenProcesoMaritimo(listaProcesoMaritimo, index),
        // //     ),
        // //     ListView.builder(

        // //     //   itemCount: listaProcesoMaritimoAlstroemeria.length,
        // //     //   itemBuilder: (context, index) =>
        // //     //       _itemResumenProcesoMaritimoAlstroemeria(
        // //     //           listaProcesoMaritimoAlstroemeria, index),
        // //     )
        // //   ],
        // ),
        // floatingActionButton: listaReportes.length +
        //             listaBandas.length +
        //             listaEcuador.length +
        //             listaProcesoMaritimo.length +
        //             listaReporteDestinoEcommerce.length +
        //             listaProcesoMaritimoAlstroemeria.length >
        //         0
        //     ?
        // FloatingActionButton(
        //     onPressed: () {
        //       Navigator.pushNamed(context, 'listaFirma');
        //     },
        //     child: Icon(Icons.assignment_turned_in_rounded),
        //   )
        // : null,
      ),
    );
  }
}

class FormDetail extends StatelessWidget {
  final detailContent;

  const FormDetail({
    Key key,
    this.detailContent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ...detailContent
                .toJson()
                .entries
                .map((e) => Text('${e.key} ${e.value}'))
                .toList()
          ],
        ),
      ),
    );
  }
}
