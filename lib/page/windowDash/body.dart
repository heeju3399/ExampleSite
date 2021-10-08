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
          Container(
            height: 1000,
            child: FutureBuilder(
                  future: fetchPostContent(),
                  builder: (context, snap) {
                    if (!snap.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }else{
                      // Map<String,String>? map = snap.data as Map<String, String>?;
                      // return ListView.builder(
                      //     itemCount: map!.length,
                      //     padding: const EdgeInsets.all(10),
                      //     itemBuilder: (context, index) {
                      //       return InkWell(
                      //           onTap: () {
                      //             print('pass : $index');
                      //           },
                      //           child: Card(
                      //               child: Container(
                      //                 color: Colors.black,
                      //                 height: 100,
                      //                 child: Row(
                      //                   children: [
                      //                     Padding(
                      //                       padding: const EdgeInsets.all(8.0),
                      //                       child: Text(
                      //                         '${map.keys.elementAt(index)}',
                      //                         style: TextStyle(color: Colors.white),
                      //                         textScaleFactor: 3,
                      //                       ),
                      //                     ),
                      //                     Padding(
                      //                       padding: const EdgeInsets.all(8.0),
                      //                       child: Text(
                      //                         '${map.values.elementAt(index)}',
                      //                         style: TextStyle(color: Colors.white),
                      //                         textScaleFactor: 3,
                      //                       ),
                      //                     ),
                      //                   ],
                      //                 ),
                      //               )));
                      //     });
                      return AllContentPage();
                    }

                  }),
            ),



          Container(
            color: Colors.yellow,
            height: 1000,
          ),
          Container(
            color: Colors.orange,
            height: 1000,
          ),
        ],
      ),
    );
  }

  Future<Map> fetchPostContent() async {
    var request = {
      'user1': 'um...1',
      'user2': 'um...2',
      'user3': 'um...3',
      'user4': 'um...4',
      'user5': 'um...5',
      'user6': 'um...7',
    };
    return Future.delayed(Duration(seconds: 1), () {
      return request;
    });
  }


}
