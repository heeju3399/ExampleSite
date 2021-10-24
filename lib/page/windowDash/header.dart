import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:web/model/myWord.dart';
import 'package:web/page/mainDash.dart';
import 'package:web/page/user/login.dart';
import 'package:web/page/user/profile.dart';
import 'Content/writhcontent.dart';

class Header extends StatefulWidget {
  const Header({Key? key, required this.userId}) : super(key: key);

  final String userId;

  @override
  _HeaderState createState() => _HeaderState(this.userId);
}

class _HeaderState extends State<Header> {
  _HeaderState(this.userId);

  final String userId;
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool loginCheck = false;
    if (userId != MyWord.LOGIN) {
      loginCheck = true;
    }
    return Container(
        alignment: Alignment.center,
        color: Colors.black,
        height: 150,
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Text(MyWord.TEST_SITE, textScaleFactor: 3, style: TextStyle(color: Colors.white)),
          Container(
            width: 500,
            height: 50,
            decoration: BoxDecoration(color: Colors.white, border: Border.all(width: 5, color: Colors.indigo)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    width: 350,
                    child: TextField(
                        controller: controller,
                        onSubmitted: (text) {
                          print(text);
                          searchOK(0);
                        },
                        style: TextStyle(
                          fontSize: 25,
                        ),
                        decoration: InputDecoration(hintText: MyWord.SEARCH, contentPadding: EdgeInsets.only(left: 10, right: 10)))),
                Container(
                    height: 50,
                    width: 50,
                    color: Colors.indigo,
                    child: InkWell(
                        onTap: () {
                          searchOK(1);
                        },
                        child: Icon(Icons.search, size: 35, color: Colors.white))),
                Container(
                    height: 50,
                    width: 90,
                    color: Colors.indigo,
                    alignment: Alignment.center,
                    child: InkWell(
                        onTap: () {
                          searchOK(2);
                        },
                        child: Text('통합검색', textScaleFactor: 1.5, style: TextStyle(color: Colors.white)))),
              ],
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                    onTap: () {
                      if (userId == MyWord.LOGIN) {
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => Login(userId: userId)));
                      } else {
                        myProfile();
                      }
                    },
                    child: Text('$userId', textScaleFactor: 2, style: TextStyle(color: Colors.white)))),
            SizedBox(
              width: 20,
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                    onTap: () {
                      if (loginCheck) {
                        writeContent(context);
                      }
                    },
                    child: loginCheck ? Icon(Ionicons.create, size: 40, color: Colors.white) : Container()))
          ])
        ]));
  }

  void writeContent(BuildContext context) async {
    await Navigator.of(context).push(MaterialPageRoute(builder: (context) => WriteContentMain(userId: userId)));
    MainDash.of(context)!.setBool = false;
  }

  void searchOK(int index) {
    String text = controller.text;
    if (index == 2) {
      text = '통합검색';
    }
    MainDash.of(context)!.setChartPageValue = {'textFiledString': '$text'};
    controller.clear();
  }

  void myProfile() async {
    await Navigator.of(context).push(MaterialPageRoute(builder: (context) => ProFile(userId: userId)));
    MainDash.of(context)!.setBool = false;
  }
}
