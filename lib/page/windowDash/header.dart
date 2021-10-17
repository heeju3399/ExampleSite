import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:web/page/login/login.dart';
import 'package:web/page/mainDash.dart';
import 'dart:html' as html;
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
    if (userId != 'LogIn') {
      //로그인 안했을때
      loginCheck = true;
    }

    print('header build widget pass : $userId');
    return Container(
      alignment: Alignment.center,
      color: Colors.black,
      height: 150,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Test Site',
            textScaleFactor: 3,
            style: TextStyle(color: Colors.white),
          ),
          Container(
            width: 500,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                width: 5,
                color: Colors.indigo,
              ),
            ), //  POINT: BoxDecoration
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 350,
                  child: TextField(
                    controller: controller,
                    autofocus: true,
                    textInputAction: TextInputAction.go,
                    onSubmitted: (text) {
                      print(text);
                      searchOK(0);
                    },
                    style: TextStyle(
                      fontSize: 25,
                    ),
                    decoration: InputDecoration(hintText: 'Search', contentPadding: EdgeInsets.only(left: 10, right: 10)),
                  ),
                ),
                Container(
                  height: 50,
                  width: 50,
                  color: Colors.indigo,
                  child: InkWell(
                    onTap: () {
                      searchOK(1);
                    },
                    child: Icon(
                      Icons.search,
                      size: 35,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                    height: 50,
                    width: 90,
                    color: Colors.indigo,
                    alignment: Alignment.center,
                    child: InkWell(
                      onTap: () {
                        searchOK(2);
                      },
                      child: Text(
                        '통합검색',
                        textScaleFactor: 1.5,
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      if (userId == 'LogIn') {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Login(
                                  userId: userId,
                                )));
                      } else {
                        //자신의 아이디로 로그인 했을때
                        //프로필?
                        //html.window.location.reload();
                      }
                    },
                    child: Text(
                      '$userId',
                      textScaleFactor: 2,
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
              SizedBox(
                width: 20,
              ),
              Padding(
                  //회원가입이 안되어 있으면 버튼 눌려지지 않게? 아니면 버튼 누르면 회원가입 유도
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      if (loginCheck) {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => WriteContentMain(
                                  userId: userId,
                                )));
                      }
                    },
                    child: loginCheck
                        ? Icon(
                            Ionicons.create,
                            size: 40,
                            color: Colors.white,
                          )
                        : InkWell(
                            onTap: () {
                              print('refresh!');
                              // html.window.location.reload();
                            },
                            child: Icon(
                              Ionicons.refresh_circle_outline,
                              size: 40,
                              color: Colors.white,
                            ),
                          ),
                  )),

              SizedBox(
                width: 20,
              ),
              Padding(
                  //회원가입이 안되어 있으면 버튼 눌려지지 않게? 아니면 버튼 누르면 회원가입 유도
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => WriteContentMain(
                                  userId: 'admin',
                                )));
                      },
                      child: Icon(
                        Ionicons.create,
                        size: 40,
                        color: Colors.white,
                      )))


            ],
          ),
        ],
      ),
    );
  }

  void searchOK(int index) {
    String text = controller.text;
    if (index == 2) {
      text = '통합검색';
    }
    print('search icon click :$text');
    MainDash.of(context)!.setChartPageValue = {'textFiledString': '$text'};
    controller.clear();
  }
}
