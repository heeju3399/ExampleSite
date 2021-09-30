import 'dart:async';
import 'package:ionicons/ionicons.dart';
import 'package:flutter/material.dart';
import '../responsive.dart';

class MainDash extends StatefulWidget {
  const MainDash({Key? key}) : super(key: key);
  static String routeName = '/MAIN_DASH';

  @override
  _MainDashState createState() => _MainDashState();
}

class _MainDashState extends State<MainDash> {
  bool floatingBTN = false;
  bool appBarCenterTitle = true;
  final List<String> items = List<String>.generate(0, (i) => 'Item $i');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: SingleChildScrollView(child: Responsive.isLarge(context) ? isWindow(context) : isMobile(context)),
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
            Container(
              alignment: Alignment.center,
              color: Colors.red,
              height: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Test Site',
                    textScaleFactor: 3,
                    style: TextStyle(color: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                            onPressed: () {},
                            child: Icon(
                              Ionicons.log_in,
                              size: 40,
                              color: Colors.white,
                            )),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextButton(
                            onPressed: () {},
                            child: Icon(
                              Ionicons.create,
                              size: 40,
                              color: Colors.white,
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Divider(
              height: 30,
              color: Colors.white12,
              indent: 0,
            ),
            Container(
              color: Colors.black12,
              width: 1050,
              height: 1000,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 1000,
                        height: 200,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GridView.builder(
                              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 300, childAspectRatio: 3 / 2, crossAxisSpacing: 20, mainAxisSpacing: 20),
                              itemCount: 4,
                              itemBuilder: (BuildContext ctx, index) {
                                return InkWell(
                                  onTap: () {
                                    print('click : $index');
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'zzzzzzzzzzz',
                                      textScaleFactor: 2,
                                    ),
                                    decoration: BoxDecoration(color: Colors.amber, borderRadius: BorderRadius.circular(15)),
                                  ),
                                );
                              }),
                        ),
                      )
                    ],
                  ),
                  //메인바
                  Divider(
                    height: 30,
                    color: Colors.white12,
                    indent: 0,
                  ),
                  //list
                  Container(
                    width: 900,
                    height: 500,
                    child: ListView.builder(
                        padding: const EdgeInsets.symmetric(vertical:30),
                        itemCount: 100,
                        itemBuilder: (BuildContext context, int index) {
                          print("itembuilder: ${index}");
                          return Container(
                            height: 50,
                            color: Colors.amber[index],
                            child: Row(
                              children: [
                                Center(child: Text('Entry : $index')),
                              ],
                            ),
                          );
                        }
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
