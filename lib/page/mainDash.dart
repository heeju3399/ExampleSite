import 'package:flutter/material.dart';
import 'package:web/model/mainContentTileColor.dart';
import 'package:web/model/shared.dart';
import 'package:web/page/user/mobileLogIn.dart';
import 'package:web/page/user/profile.dart';
import 'package:web/page/windowDash/header.dart';
import '../responsive.dart';
import 'mobileDash/content/mobileWriteContentPage.dart';
import 'mobileDash/mobildMainBody.dart';
import 'mobileDash/mobileMainHead.dart';

import 'windowDash/body.dart';

class MainDash extends StatefulWidget {
  const MainDash({Key? key, required this.userId}) : super(key: key);
  final String userId;
  static String routeName = '/MAIN_DASH';

  static _MainDashState? of(BuildContext context) => context.findAncestorStateOfType<_MainDashState>();

  @override
  _MainDashState createState() => _MainDashState(userId: userId);
}

class _MainDashState extends State<MainDash> {
  _MainDashState({required this.userId});

  String userId;
  bool floatingBTN = false;
  bool appBarCenterTitle = true;
  final List<String> items = List<String>.generate(0, (i) => 'Item $i');
  Map getTextFiledMap = {'getTextFiledMap': 'Empty'};
  bool firstCheck = true;
  bool reloadCheck = true;

  set setBool(bool check) {
    reload();
  }

  void reload() async {
    print('pass **************************************************');
    setState(() {
      reloadCheck = false;
    });
    await Future.delayed(Duration(milliseconds: 100));
    setState(() {
      reloadCheck = true;
    });
  }

  set setChartPageValue(Map map) {
    print('여기 통과????????????');
    getTextFiledString(map);
  }

  @override
  void initState() {
    MyShared.setUserId(userId);
    super.initState();
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

  void mobileWriteContent(BuildContext context) async {
    await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => MobileWriteContentMain(
              userId: userId,
            )));
    reload();
  }

  @override
  Widget build(BuildContext context) {
    print('===Main dash build widget pass userID : $userId ===');
    return WillPopScope(
        onWillPop: () {
          print('뭐지이건?');
          Navigator.pop(context);
          return Future(() => true);
        },
        child: Responsive.isLarge(context) ? isWindowScaffold(context, userId) : isMobileScaffold(context));
  }

  Widget isMobileScaffold(BuildContext context) {
    bool checkLogin = false;
    if(userId == 'LogIn'){
      checkLogin = true;
    }
    return Scaffold(
        appBar: AppBar(
          title: Text('Test Site Mobile'),
          backgroundColor: Colors.white12,
          actions: [
            if (userId == 'LogIn')
              IconButton(
                  icon: Icon(Icons.login),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MobileLogin(
                              userId: userId,
                            )));
                  }),
            if (userId != 'LogIn')
              TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProFile(userId: userId)));
                  },
                  child: Text('$userId')),
          ],
        ),
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
            child: Container(
                child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, crossAxisAlignment: CrossAxisAlignment.center, children: [
          MobileMainHead(),
          Divider(
            height: 5,
            color: Colors.white12,
            indent: 0,
          ),
          reloadCheck
              ? MobileMainBody(
                  userId: userId,
                )
              : Padding(padding: const EdgeInsets.only(top: 200), child: Center(child: CircularProgressIndicator()))
        ]))),
        floatingActionButton: checkLogin? null : FloatingActionButton(
            onPressed: () {
              mobileWriteContent(context);
            },
            child: Icon(Icons.add)));
  }

  Widget isWindowScaffold(BuildContext context, String userId) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: RawScrollbar(
            thumbColor: Colors.white,
            isAlwaysShown: true,
            radius: Radius.circular(20),
            thickness: 15,
            child: SingleChildScrollView(
                physics: ScrollPhysics(),
                child: Center(
                    child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, crossAxisAlignment: CrossAxisAlignment.center, children: [
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
                  reloadCheck
                      ? Body(
                          textFiledMap: getTextFiledMap,
                          userId: userId,
                        )
                      : Padding(
                          padding: const EdgeInsets.only(top: 200),
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                  Container(height: 100, color: Colors.black, alignment: Alignment.center, child: MainContentWidgetModel.myText('Test Corp')),
                ])))));
  }
}
