import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web/exex/todo.dart';

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
  String userId = '로그인';

  set setChartPageValue(Map map) {
    print('여기 통과?');
    getTextFiledString(map);
  }

  @override
  void initState() {
    super.initState();

  }

  String getUserId() {
    String result = 'LogIn';
    final args = ModalRoute.of(context)!.settings.arguments;
    print('args : $args');
    if(args != null){
      print('pass?');
      result = args.toString();
    }else{
      result = 'LogIn';
    }
    return result;

  }


  void getTextFiledString(Map map) async {
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
    String userId = getUserId();
    print('뭐지이건2222222 userid?> : $userId');
    return WillPopScope(
      onWillPop: () {
        print('뭐지이건?');
        Navigator.pop(context);
        return Future(() => false);
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: RawScrollbar(
            thumbColor: Colors.white,
            isAlwaysShown: true,
            radius: Radius.circular(20),
            thickness: 15,
            child: SingleChildScrollView(child: Responsive.isLarge(context) ? isWindow(context, userId) : isMobile(context))),
        floatingActionButton: floatingBTN
            ? null
            : FloatingActionButton(
                onPressed: () {},
                child: Icon(Icons.add),
              ),
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
  Widget isWindow(BuildContext context, String userId) {
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
        Header(
          userId: userId,
        ),
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
