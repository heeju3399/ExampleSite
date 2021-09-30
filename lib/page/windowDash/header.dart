import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:web/page/mainDash.dart';

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                      Navigator.of(context).pushNamed('/Login');
                    },
                    child: Text(
                      '로그인',
                      textScaleFactor: 2,
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
              SizedBox(
                width: 20,
              ),
              Padding(//회원가입이 안되어 있으면 버튼 눌려지지 않게? 아니면 버튼 누르면 회원가입 유도
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed('/WriteContentMain');
                    },
                    child: Icon(
                      Ionicons.create,
                      size: 40,
                      color: Colors.white,
                    ),
                  ))
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
