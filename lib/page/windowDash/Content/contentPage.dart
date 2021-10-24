import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:web/control/content.dart';
import 'package:web/model/content.dart';
import 'package:web/model/mainContentTileColor.dart';
import 'package:web/model/myWord.dart';
import 'package:web/page/dialog/dialog.dart';
import 'package:web/page/windowDash/Content/CommentPage.dart';
import 'package:web/page/windowDash/body.dart';

class AllContentPage extends StatefulWidget {
  const AllContentPage({Key? key, required this.data, required this.userId}) : super(key: key);
  final List<MainContentDataModel> data;
  final String userId;

  @override
  _AllContentPageState createState() => _AllContentPageState(data: data, userId: userId);
}

class _AllContentPageState extends State<AllContentPage> {
  _AllContentPageState({required this.data, required this.userId});

  final List<MainContentDataModel> data;
  final String userId;
  List<Widget> widgetList = [];
  List<TextEditingController> textEditingController = [];
  List<bool> favoriteOnHover = [];
  List<bool> badOnHover = [];
  List<int> valueList = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  String exString1 = '';
  Map returnMap = Map();
  Map mapEx1 = Map();
  String utf8StringContent = '';

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        MainContentDataModel item = data[index];
        return _mainBuild(item, index, context);
      },
      itemCount: data.length,
      shrinkWrap: true,
    );
  }

  Widget _mainBuild(MainContentDataModel item, int index, BuildContext context) {
    List<dynamic> changeStructure = jsonDecode(item.content);
    List<int> intList = [];
    changeStructure.forEach((element) {
      intList.add(element);
    });
    utf8StringContent = utf8.decode(intList).toString();
    textEditingController.add(TextEditingController());
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ExpansionTile(
            subtitle: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Icon(Icons.favorite, color: MainContentWidgetModel.iconColor),
                  Text('  ( ${item.likeCount} )', style: TextStyle(color: MainContentWidgetModel.textColor)),
                  Padding(padding: const EdgeInsets.only(left: 30), child: Icon(Icons.mood_bad, color: MainContentWidgetModel.iconColor)),
                  Text('  ( ${item.badCount} )', style: TextStyle(color: MainContentWidgetModel.textColor)),
                  Padding(padding: const EdgeInsets.only(left: 30), child: Icon(Icons.comment, color: MainContentWidgetModel.iconColor)),
                  Text('  ( ${item.children.length} )', style: TextStyle(color: MainContentWidgetModel.textColor)),
                  Padding(padding: const EdgeInsets.only(left: 30), child: MainContentWidgetModel.myText(item.userId)),
                  Padding(padding: const EdgeInsets.only(left: 30), child: MainContentWidgetModel.myText(item.createTime))
                ])),
            collapsedBackgroundColor: MainContentWidgetModel.backgroundColor,
            backgroundColor: Colors.black12,
            trailing: Icon(Icons.comment, color: MainContentWidgetModel.iconColor),
            onExpansionChanged: (v) {
              if (v) {
                int id = item.contentId;
                String sId = id.toString();
                Map sortToMap = {sId: 1};
                for (int i = 0; i < sortToMap.length; i++) {
                  exString1 = sortToMap.keys.elementAt(i);
                  valueList[index] = sortToMap.values.elementAt(i) + valueList[index];
                  mapEx1 = {exString1: valueList[index]};
                  returnMap.addAll(mapEx1);
                }
                setState(() {});
              }
            },
            title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Container(
                      width: 850,
                      child: Text('$utf8StringContent',
                          maxLines: 5, overflow: TextOverflow.clip, style: TextStyle(color: MainContentWidgetModel.textColor, fontSize: MainContentWidgetModel.basicFontSize))),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [likeAndBadIcon(0, item, index), likeAndBadIcon(1, item, index)])
                ])),
            children: tenComment(item, index, context)));
  }

  Widget likeAndBadIcon(int flag, MainContentDataModel item, int index) {
    favoriteOnHover.add(false);
    badOnHover.add(false);
    int contentId = item.contentId;
    return InkWell(
        onTap: () {
          MainContentControl.setLikeAndBad(contentId: contentId, flag: flag);
          Body.of(context)!.setBool = false;
        },
        onHover: (v) {
          if (flag == 0 && v) {
            setState(() {
              favoriteOnHover[index] = true;
            });
          } else if (flag == 1 && v) {
            setState(() {
              badOnHover[index] = true;
            });
          } else {
            setState(() {
              favoriteOnHover[index] = false;
              badOnHover[index] = false;
            });
          }
        },
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          if (flag == 0) Icon(Icons.favorite, color: favoriteOnHover[index] ? Colors.red : MainContentWidgetModel.iconColor),
          if (flag == 1) Padding(padding: const EdgeInsets.only(left: 20, right: 10), child: Icon(Icons.mood_bad, color: badOnHover[index] ? Colors.blue : MainContentWidgetModel.iconColor))
        ]));
  }

  List<Widget> tenComment(MainContentDataModel item, int index, BuildContext context) {
    int itemChildrenLength = item.children.length;
    widgetList = [inputComment(item, index, context)];
    for (int i = 0; i < 10; i++) {
      if (i < itemChildrenLength) {
        try {
          MainCommentDataModel mainCommentDataModel = MainCommentDataModel.fromJson(item.children[i]);
          widgetList.add(commentList(mainCommentDataModel, item, i));
        } catch (e) {
          print('tenComment err *_*; $e');
        }
      }
    }
    if (10 < itemChildrenLength) {
      widgetList.add(lastClickPage(index, item, context));
    }
    widgetList.add(Divider(
      color: Colors.white,
      height: 50,
    ));
    return widgetList;
  }

  Widget lastClickPage(int index, MainContentDataModel item, BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(18.0),
        child: Container(
            width: 400,
            height: 50,
            child: ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blueGrey)),
                child: Text('덧글 전체보기', textScaleFactor: 2),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => CommentPage(content: item)));
                })));
  }

  Widget inputComment(MainContentDataModel item, int index, BuildContext context) {
    return Container(
        width: 890,
        child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: TextField(
                controller: textEditingController[index],
                autofocus: true,
                onSubmitted: (v) {
                  if (v != '' && v.isNotEmpty) {
                    if (userId != MyWord.LOGIN) {
                      MainContentControl.setComment(index: index, item: item, value: v, userId: userId, context: context);
                      Body.of(context)!.setBool = false;
                      textEditingController[index].clear();
                    } else {
                      textEditingController[index].clear();
                      MyDialog.setContentDialog(title: '접속불가', message: '로그인 부탁드려요', context: context);
                    }
                  }
                },
                style: TextStyle(fontSize: 25, color: Colors.white),
                decoration: const InputDecoration(
                    labelText: '댓 글',
                    hintText: '입력 후 엔터',
                    hintStyle: TextStyle(fontSize: 20, color: Colors.white),
                    labelStyle: TextStyle(fontSize: 20, color: Colors.white),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(1.0)), borderSide: BorderSide(width: 1, color: Colors.white)),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(1.0)), borderSide: BorderSide(width: 1, color: Colors.white)),
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(1.0)))))));
  }

  Widget commentList(MainCommentDataModel comment, MainContentDataModel item, int order) {
    List<dynamic> utf8List = jsonDecode(comment.comment);
    List<int> intList = [];
    utf8List.forEach((element) {
      intList.add(element);
    });
    String decodeComment = utf8.decode(intList).toString();
    bool myIdCheck = false;
    if (comment.userId == userId) {
      myIdCheck = true;
    }
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
            hoverColor: Colors.black12,
            selectedTileColor: MainContentWidgetModel.tileColor,
            tileColor: MainContentWidgetModel.tileColor,
            title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Container(
                      width: 850,
                      child: Text(decodeComment, style: TextStyle(color: MainContentWidgetModel.textColor, fontSize: MainContentWidgetModel.basicFontSize), maxLines: 5, overflow: TextOverflow.clip)),
                  myIdCheck
                      ? IconButton(
                          icon: Icon(Icons.delete_forever, color: MainContentWidgetModel.iconColor, size: 30),
                          onPressed: () {
                            MainContentControl.deleteComment(contentId: item.contentId, userId: userId, order: order);
                            Body.of(context)!.setBool = false;
                          })
                      : Container(child: MainContentWidgetModel.myText('${comment.userId}'))
                ]))));
  }
}