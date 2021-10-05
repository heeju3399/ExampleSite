import 'package:flutter/material.dart';

import 'package:web/page/windowDash/header.dart';

import '../responsive.dart';
import 'windowDash/body.dart';


class MainDash extends StatefulWidget {
  const MainDash({Key? key}) : super(key: key);
  static String routeName = '/MAIN_DASH';

  static _MainDashState? of(BuildContext context) => context.findAncestorStateOfType<_MainDashState>();

  @override
  _MainDashState createState() => _MainDashState();
}

class _MainDashState extends State<MainDash> {

  bool floatingBTN = false;
  bool appBarCenterTitle = true;
  final List<String> items = List<String>.generate(0, (i) => 'Item $i');
  Map getTextFiledMap = {'getTextFiledMap': 'Empty'};

  set setChartPageValue(Map map) {
    getTextFiledString(map);
  }

  @override
  void initState() {

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    Navigator.of(context).pop();
  }



  void getTextFiledString(Map map) async {
    print(map.toString());
    bool mapIsEmpty = map.isNotEmpty;
    if (mapIsEmpty) {
      var firstKey = map.keys.first;
      String value = map.values.join(firstKey);
      print(value);
      getTextFiledMap = {'getTextFiledMap': value};
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      body: RawScrollbar(
          thumbColor: Colors.white,
          isAlwaysShown: true,
          radius: Radius.circular(20),
          thickness: 15,
          child: SingleChildScrollView(child: Responsive.isLarge(context) ? isWindow(context) : isMobile(context))),
      floatingActionButton: floatingBTN
          ? null
          : FloatingActionButton(
              onPressed: () {},
              child: Icon(Icons.add),
            ),
    );
  }

  //mobile
  Widget isMobile(BuildContext context) {
    floatingBTN = false;
    appBarCenterTitle = false;
    return Center(
      child: Row(children: [
        Expanded(
          child: Container(
            alignment: Alignment.center,
            color: Colors.red,
            height: 150,
            child: Text(
              'Test Site',
              textScaleFactor: 3,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ), //contents list
      ]),
    );
  }

  // //window
  Widget isWindow(BuildContext context) {
    floatingBTN = true;
    appBarCenterTitle = true;
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Divider(
          height: 30,
          color: Colors.black,
          indent: 0,
        ),
        Header(),
        Divider(
          height: 30,
          color: Colors.white12,
          indent: 0,
        ),
        Body(
          textFiledMap: getTextFiledMap,
        ),
      ],
    ));
  }
}
