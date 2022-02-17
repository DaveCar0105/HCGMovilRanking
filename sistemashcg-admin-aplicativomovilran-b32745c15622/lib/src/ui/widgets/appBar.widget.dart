import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ranking_app/src/constant.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  AppBarWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        /*leading:
            IconButton(onPressed: () {}, icon: Image.asset(Constant.ICON_HCG)),
        titleSpacing: -10,*/
        title: Wrap(crossAxisAlignment: WrapCrossAlignment.center, children: [
          IconButton(
              onPressed: () {},
              icon: Image.asset(Constant.ICON_HCG),
              iconSize: MediaQuery.of(context).size.height * 0.01),
          Text(
            'Ranking HCG',
            style: TextStyle(
                color: Constant.COLOR_SECONDARY,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.height * 0.023),
          ),
        ]),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.refresh))],
        actionsIconTheme: IconThemeData(color: Constant.COLOR_SECONDARY));
  }

  @override
  final Size preferredSize = Size.fromHeight(kToolbarHeight * 0.70);
}
