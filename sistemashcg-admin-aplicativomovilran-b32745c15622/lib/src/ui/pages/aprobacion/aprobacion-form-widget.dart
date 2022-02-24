


import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class AprobacionForm extends StatelessWidget {

   final _formKey = GlobalKey<FormBuilderState>();


  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        
        appBar: AppBar(
          title: TabBar(
            tabs: [
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
            ],
          ),
        ),
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