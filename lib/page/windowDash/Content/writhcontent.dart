import 'package:flutter/material.dart';
import 'package:web/control/content.dart';
import 'package:web/model/myWord.dart';
import 'package:web/page/dialog/dialog.dart';

class WriteContentMain extends StatefulWidget {
  const WriteContentMain({Key? key, required this.userId}) : super(key: key);
  final String userId;

  @override
  _WriteContentMainState createState() => _WriteContentMainState(userId: userId);
}

class _WriteContentMainState extends State<WriteContentMain> {
  _WriteContentMainState({required this.userId});

  TextEditingController textFiledContentController = TextEditingController();
  final String userId;
  bool overClick = true;
  bool logInCircle = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
            child: Center(
                child: Container(
                    width: 400,
                    height: 600,
                    child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Padding(padding: const EdgeInsets.all(8.0), child: Text('$userId 님의 글', maxLines: 1, overflow: TextOverflow.clip, style: TextStyle(fontSize: 40, color: Colors.white))),
                      Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                              maxLines: 5,
                              textInputAction: TextInputAction.go,
                              autofocus: true,
                              onSubmitted: (v) {
                                setContext(context);
                              },
                              controller: textFiledContentController,
                              style: TextStyle(fontSize: 20, color: Colors.white),
                              decoration: const InputDecoration(
                                  labelText: '글쓰기',
                                  labelStyle: TextStyle(fontSize: 20, color: Colors.white),
                                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)), borderSide: BorderSide(width: 1, color: Colors.white)),
                                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)), borderSide: BorderSide(width: 1, color: Colors.white)),
                                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)))))),
                      Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: InkWell(
                              onTap: () {
                                setContext(context);
                              },
                              child: Container(
                                  width: 250,
                                  height: 60,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.all(Radius.circular(10))),
                                  child: logInCircle ? Text('글쓰기', textScaleFactor: 2, style: TextStyle(color: Colors.white)) : CircularProgressIndicator(backgroundColor: Colors.white))))
                    ])))));
  }

  void setContext(BuildContext context) async {
    if (overClick) {
      setState(() {
        logInCircle = !logInCircle;
      });
      overClick = false;
      await MainContentControl.setContent(content: textFiledContentController.text, userId: userId).then((map) {
        if (map.isNotEmpty) {
          if (map.values.first == MyWord.PASS) {
            Navigator.of(context).pop();
          } else {
            MyDialog.setContentDialog(title: '${map.values.first}', message: '${map.values.last}', context: context);
          }
          setState(() {
            logInCircle = !logInCircle;
          });
        }
        overClick = true;
      });
    }
  }
}
