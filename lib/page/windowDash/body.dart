import 'package:flutter/material.dart';
import 'package:web/control/readContent.dart';
import 'Content/contentPage.dart';

class Body extends StatelessWidget {
  const Body({required this.textFiledMap, Key? key}) : super(key: key);
  final Map textFiledMap;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      width: 1050,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(15),
                height: 100,
                color: Colors.black,
                child: Text(
                  '검색내용 : ${textFiledMap.values.join('getTextFiledMap')}',
                  textScaleFactor: 3,
                  style: TextStyle(color: Colors.white),
                ),
              ),
              Container(
                padding: EdgeInsets.all(15),
                height: 100,
                color: Colors.black,
                child: Text(
                  '검색결과 : ${textFiledMap.values.join('getTextFiledMap')}',
                  textScaleFactor: 3,
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          FutureBuilder(
              future: ReadContentControl.getContentData(),
              builder: (context, snap) {
                if (!snap.hasData) {
                  return Center(
                      child: CircularProgressIndicator(
                    backgroundColor: Colors.white,
                  ));
                } else {
                  return AllContentPage(data: snap.data as List<Item>);
                  return Container();
                }
              }),
        ],
      ),
    );
  }
}
