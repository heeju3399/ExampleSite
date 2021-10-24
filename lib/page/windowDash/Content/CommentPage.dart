import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:web/model/content.dart';

class CommentPage extends StatefulWidget {
  const CommentPage({Key? key, required this.content}) : super(key: key);
  final MainContentDataModel content;

  @override
  _CommentPageState createState() => _CommentPageState(content: content);
}

class _CommentPageState extends State<CommentPage> {
  _CommentPageState({required this.content});

  final MainContentDataModel content;
  double height = 0.0;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    List<dynamic> utf8List = jsonDecode(content.content);
    List<int> intList = [];
    utf8List.forEach((element) {
      intList.add(element);
    });
    String contentString = utf8.decode(intList);

    return Scaffold(
        appBar: AppBar(title: Text('덧글 페이지 지울 수 있지만 저장되지 않습니다'), backgroundColor: Colors.white12),
        backgroundColor: Colors.black,
        body: SizedBox(
            child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.center, children: [
          Padding(
              padding: EdgeInsets.all(20),
              child: Container(alignment: Alignment.center, width: 500, height: 100, child: Text('$contentString', textScaleFactor: 3, style: TextStyle(color: Colors.white)))),
          SingleChildScrollView(
              child: Center(
                  child: Container(
                      width: 800,
                      height: height - 200,
                      alignment: Alignment.topCenter,
                      child: ListView.builder(
                          itemCount: content.children.length,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            Map item = content.children[index];
                            MainCommentDataModel mainCommentDataModel = MainCommentDataModel.fromJson(item);
                            List<dynamic> utf8List2 = jsonDecode(mainCommentDataModel.comment);
                            List<int> intList = [];
                            utf8List2.forEach((element) {
                              intList.add(element);
                            });
                            String commentString = utf8.decode(intList);
                            return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Card(
                                    child: Container(
                                        width: 900,
                                        decoration: BoxDecoration(color: Colors.black, border: Border.all(width: 1, color: Colors.white)),
                                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.end, children: [
                                          Expanded(
                                              flex: 9,
                                              child: Padding(
                                                  padding: const EdgeInsets.all(18.0),
                                                  child: Text('NO $index \n $commentString', overflow: TextOverflow.clip, maxLines: 5, style: TextStyle(fontSize: 25, color: Colors.white)))),
                                          Expanded(
                                              flex: 1,
                                              child: Padding(
                                                  padding: const EdgeInsets.all(18.0),
                                                  child: IconButton(
                                                      icon: Icon(Icons.delete_forever),
                                                      color: Colors.white,
                                                      iconSize: 30,
                                                      onPressed: () {
                                                        content.children.removeAt(index);
                                                        setState(() {});
                                                      })))
                                        ]))));
                          }))))
        ])));
  }
}
