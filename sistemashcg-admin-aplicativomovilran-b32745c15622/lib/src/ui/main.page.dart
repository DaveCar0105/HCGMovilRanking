import 'package:flutter/material.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:ranking_app/src/ui/main-aprobacion.page.dart';
import 'package:ranking_app/src/ui/main-evaluacion.page.dart';
import 'package:ranking_app/src/ui/main-process.page.dart';
import 'package:ranking_app/src/ui/main-reporte.page.dart';
import 'package:ranking_app/src/ui/main-soncronizar.page.dart';
import 'package:ranking_app/src/ui/widgets/appBar.widget.dart';
import 'package:ranking_app/src/ui/widgets/drawer.widget.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _currenIndexBottomNavigation = 2;
  bool sinc = false;

  final pages =[
    MainProcessPage(),
    MainEvalutionPage(),
    MainSincroPage(),
    MainAprobacionPage(),
    MainReportPage()
   
    
  ];


  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
        child: Builder(
            builder: (context) => Center(
                  child: Scaffold(
                      resizeToAvoidBottomInset: false,
                      appBar: AppBarWidget(),
                      drawer: DrawerWidget(),
                      body: pages[_currenIndexBottomNavigation],
                      bottomNavigationBar: Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: Colors.black38,
                              spreadRadius: 0,
                              blurRadius: 10)
                        ]),
                        child: ClipRRect(
                          child: _navigationBottomWidget(),
                        ),
                      ) //_navigationBottomWidget(),
                      ),
                )));
  }

  Widget _navigationBottomWidget() {
    return BottomNavigationBar(
        currentIndex: _currenIndexBottomNavigation,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              
              icon: Icon(Icons.account_balance_wallet_outlined),
              activeIcon: Icon(Icons.account_balance_wallet),
              label:"Proceso"
              
              
              ),
          BottomNavigationBarItem(
              icon: Icon(Icons.fact_check_outlined),
              activeIcon: Icon(Icons.fact_check_rounded),
              label:"Evaluación"),
          BottomNavigationBarItem(
              icon: Icon(Icons.cloud_done_outlined),
              activeIcon: Icon(Icons.cloud_done_rounded),
              label:"Sincronización"),
          BottomNavigationBarItem(
              icon: Icon(Icons.library_add_check_outlined),
              activeIcon: Icon(Icons.library_add_check_rounded),
              label:"Aprobación"),
          BottomNavigationBarItem(
              icon: Icon(Icons.assessment_outlined),
              activeIcon: Icon(Icons.assessment),
              label:"Reporte"),
        ],
        onTap: (index) {
          setState(() {
            _currenIndexBottomNavigation = index;

          });
        });
  }
}
