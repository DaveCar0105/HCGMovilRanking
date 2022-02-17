import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ranking_app/src/constant.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Constant.COLOR_SECONDARY,
              ),
              accountName: Text(
                'HIGH CONTROL GROUP',
                style: TextStyle(color: Constant.COLOR_PRIMARY),
              ),
              accountEmail: Text(
                'https://highcontrolgroup.com/',
                style: TextStyle(color: Colors.blueAccent),
              ),
              currentAccountPicture: Container(
                height: 40,
                width: 40,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(30)),
                child: Image.asset(
                  'assets/img/logo_app.jpg',
                  fit: BoxFit.cover,
                ),
              )),
          ListTile(
            title: Text("Reportes Sincronizados"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '');
            },
          ),
          ListTile(
            title: Text("Errores"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '');
            },
          ),
          ListTile(
            title: Text("Salir"),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '');
            },
          )
        ],
      ),
    );
  }
}
