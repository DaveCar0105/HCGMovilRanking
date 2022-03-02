import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';

class DetalleTinasReportPage extends StatefulWidget {
  DetalleTinasReportPage({key, this.id}) : super(key: key);

  final String id;

  @override
  State<DetalleTinasReportPage> createState() => _DetalleTinasReportPageState();
}

class _DetalleTinasReportPageState extends State<DetalleTinasReportPage> {
  bool _switchVal = true;
  bool sinc = false;

  HDTRefreshController _hdtRefreshController = HDTRefreshController();

  static const int sortName = 0;
  static const int sortStatus = 1;
  bool isAscending = true;
  int sortType = sortName;

  @override
  void initState() {
    finca.initData(5);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: HorizontalDataTable(
          leftHandSideColumnWidth: 80,
          rightHandSideColumnWidth: MediaQuery.of(context).size.width - 80,
          isFixedHeader: true,
          headerWidgets: _getTitleWidget(),
          leftSideItemBuilder: _generateFirstColumnRow,
          rightSideItemBuilder: _generateRightHandSideColumnRow,
          itemCount: finca.fincaInfo.length,
          rowSeparatorWidget: const Divider(
            color: Colors.black54,
            height: 2.0,
            thickness: 0.0,
          ),
          leftHandSideColBackgroundColor: Color(0xFFFFFFFF),
          rightHandSideColBackgroundColor: Color(0xFFFFFFFF),
          verticalScrollbarStyle: const ScrollbarStyle(
            thumbColor: Colors.yellow,
            isAlwaysShown: true,
            thickness: 4.0,
            radius: Radius.circular(5.0),
          ),
          horizontalScrollbarStyle: const ScrollbarStyle(
            thumbColor: Colors.red,
            isAlwaysShown: true,
            thickness: 4.0,
            radius: Radius.circular(5.0),
          ),
          enablePullToRefresh: true,
          refreshIndicator: const WaterDropHeader(),
          refreshIndicatorHeight: 60,
          onRefresh: () async {
            //Do sth
            await Future.delayed(const Duration(milliseconds: 500));
            _hdtRefreshController.refreshCompleted();
          },
          enablePullToLoadNewData: true,
          loadIndicator: const ClassicFooter(),
          onLoad: () async {
            //Do sth
            await Future.delayed(const Duration(milliseconds: 500));
            _hdtRefreshController.loadComplete();
          },
          htdRefreshController: _hdtRefreshController,
        ),
        height: MediaQuery.of(context).size.height,
      ),
    );
  }
  List<Widget> _getTitleWidget() {
    return [
      _getTitleItemWidget('...', 50),
      TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        child: _getTitleItemWidget(
            'Fecha' + (sortType == sortName ? (isAscending ? '↓' : '↑') : ''),
            100),
        onPressed: () {
          sortType = sortName;
          isAscending = !isAscending;
          finca.sortName(isAscending);
          setState(() {});
        },
      ),
      TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        child: _getTitleItemWidget(
            'Finca' + (sortType == sortName ? (isAscending ? '↓' : '↑') : ''),
            100),
        onPressed: () {
          sortType = sortName;
          isAscending = !isAscending;
          finca.sortName(isAscending);
          setState(() {});
        },
      ),
      _getTitleItemWidget('Tipo', 100),
    ];
  }

  Widget _getTitleItemWidget(String label, double width) {
    return Container(
      child: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
      width: width,
      height: 56,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return Container(
      child: Center(
        child: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        DetalleTinasReportPage(id: finca.fincaInfo[index].id.toString(),)
                    )
                );
            },
            icon: Icon(Icons.remove_red_eye_rounded),
            iconSize: MediaQuery.of(context).size.height * 0.04),
      ),
      width: 20,
      height: 52,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return Row(
      children: <Widget>[
        Container(
          child: Text(finca.fincaInfo[index].fecha.toLocal().toString()),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Text(finca.fincaInfo[index].nombreFinca),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Text(finca.fincaInfo[index].tipoFinca),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
      ],
    );
  }
}

Finca finca = Finca();

class Finca {
  List<FincaInfo> fincaInfo = [];

  void initData(int size) {
    for (int i = 0; i < size; i++) {
      fincaInfo
          .add(FincaInfo(DateTime(2022, 2, 25, 17, 30), "Finca_$i", 'N/A',12345));
    }
  }

  ///
  /// Single sort, sort Name's id
  void sortName(bool isAscending) {
    fincaInfo.sort((a, b) {
      int aId = int.tryParse(a.nombreFinca.replaceFirst('User_', '')) ?? 0;
      int bId = int.tryParse(b.nombreFinca.replaceFirst('User_', '')) ?? 0;
      return (aId - bId) * (isAscending ? 1 : -1);
    });
  }

  ///
  /// sort with Status and Name as the 2nd Sort
  /* void sortStatus(DateTime isAscending) {
    fincaInfo.sort((a, b) {
      if (a.fecha == b.fecha) {
        int aId = int.tryParse(a.fecha.replaceFirst('User_', '')) ?? 0;
        int bId = int.tryParse(b.fecha.replaceFirst('User_', '')) ?? 0;
        return (aId - bId);
      } else if (a.status) {
        return isAscending ? 1 : -1;
      } else {
        return isAscending ? -1 : 1;
      }
    });
  } */
}

class FincaInfo {
  int id;
  DateTime fecha;
  String nombreFinca;
  String tipoFinca;

  FincaInfo(this.fecha, this.nombreFinca, this.tipoFinca, this.id);
}




