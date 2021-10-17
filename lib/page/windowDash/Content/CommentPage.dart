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

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    //_controller.dispose(); // dispose the controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
            child: Center(
                child: Container(
                    width: 800,
                    alignment: Alignment.topCenter,
                    child: ListView.builder(
                      itemBuilder: (BuildContext context, int index) {
                        print('listView Build pass int index???? $index');
                        print(content.children.length);
                        MainCommentDataModel item = content.children[index];
                        return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                                child: Container(
                                    width: 900,
                                    decoration: BoxDecoration(
                                        color: Colors.black,
                                        border: Border.all(
                                          width: 1,
                                          color: Colors.white,
                                        )),
                                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, crossAxisAlignment: CrossAxisAlignment.end, children: [
                                      Expanded(
                                          flex: 9,
                                          child: Padding(
                                              padding: const EdgeInsets.all(18.0),
                                              child: Text('NO $index \n${item.comment}', overflow: TextOverflow.clip, maxLines: 5, style: TextStyle(fontSize: 25, color: Colors.white)))),
                                      Expanded(
                                          flex: 1,
                                          child: Padding(
                                              padding: const EdgeInsets.all(18.0),
                                              child: IconButton(
                                                icon: Icon(Icons.delete_forever),
                                                color: Colors.white,
                                                iconSize: 30,
                                                onPressed: () {
                                                  print('delete pass $index');
                                                  widget.content.children.removeAt(index);
                                                  setState(() {});
                                                },
                                              )))
                                    ]))));
                      },
                      itemCount: widget.content.children.length,
                      shrinkWrap: true,
                    )))));
  }
}
