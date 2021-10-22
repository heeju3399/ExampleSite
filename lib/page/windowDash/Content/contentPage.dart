import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:web/control/content.dart';
import 'package:web/model/content.dart';
import 'package:web/model/mainContentTileColor.dart';
import 'package:web/model/shared.dart';
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
  Map viewCountMap = Map();
  Map likeCountMap = Map();
  Map badCountMap = Map();
  int viewCount = 0;
  int likeCount = 0;
  int badCount = 0;
  bool timerCancel = false;
  List<bool> favoriteOnHover = [];
  List<bool> badOnHover = [];
  List<Map> refinedList = List.generate(0, (index) => {});
  List<String> keyList = List.generate(0, (index) => '');
  List<int> valueList = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
  String exString1 = '';
  int exInt1 = 0;
  int count = 0;
  Map returnMap = Map();
  Map mapEx1 = Map();
  String utf8StringContent = '';
  bool passpass = true;

  @override
  Widget build(BuildContext context) {
    //print('처음부터 값이 들어오나? ${data.length}');
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        //print(data[index].content);
        //print(data.length);
        MainContentDataModel item = data[index];
        return _mainBuild(item, index, context);
      },
      itemCount: data.length,
      shrinkWrap: true,
    );
  }

  Widget _mainBuild(MainContentDataModel item, int index, BuildContext context) {
    List<dynamic> aa = jsonDecode(item.content);
    List<int> intList = [];
    aa.forEach((element) {
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
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Icon(Icons.mood_bad, color: MainContentWidgetModel.iconColor),
                ),
                Text('  ( ${item.badCount} )', style: TextStyle(color: MainContentWidgetModel.textColor)),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Icon(Icons.comment, color: MainContentWidgetModel.iconColor),
                ),
                Text('  ( ${item.children.length} )', style: TextStyle(color: MainContentWidgetModel.textColor)),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: MainContentWidgetModel.myText(item.userId),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: MainContentWidgetModel.myText(item.createTime),
                )
              ])),
          collapsedBackgroundColor: MainContentWidgetModel.backgroundColor,
          backgroundColor: Colors.black12,
          trailing: Icon(
            Icons.comment,
            color: MainContentWidgetModel.iconColor,
          ),
          onExpansionChanged: (v) {
            //print('열고 닫힐때 : $v');
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
                    child: Text(
                      '$utf8StringContent',
                      maxLines: 5,
                      overflow: TextOverflow.clip,
                      style: TextStyle(color: MainContentWidgetModel.textColor, fontSize: MainContentWidgetModel.basicFontSize),
                    )),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  likeAndBadIcon(0, item, index), //이녀석의 성격은 좀 다름  셋할때 할것
                  likeAndBadIcon(1, item, index), //이녀석의 성격은 좀 다름 ㅍ 셋할때 할것
                ])
              ])),
          children: tenComment(item, index, context)),
    );
  }

  Widget likeAndBadIcon(int flag, MainContentDataModel item, int index) {
    favoriteOnHover.add(false);
    badOnHover.add(false);
    int contentId = item.contentId;
    return InkWell(
        onTap: () {
          //flag 0 좋아여
          //flag 1 싫어요
          MainContentControl.setLikeAndBad(contentId: contentId, flag: flag);
          Body.of(context)!.setBool = false;
        },
        onHover: (v) {
          if (flag == 0 && v) {
            print('0 pass $v');
            setState(() {
              favoriteOnHover[index] = true;
            });
          } else if (flag == 1 && v) {
            print('1 pass $v');
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
          if (flag == 1)
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 10),
              child: Icon(Icons.mood_bad, color: badOnHover[index] ? Colors.blue : MainContentWidgetModel.iconColor),
            )
        ]));
  }

  List<Widget> tenComment(MainContentDataModel item, int index, BuildContext context) {
    //print('====all comment pass====');
    int itemChildrenLength = item.children.length;
    //print('itemChildrenLength : $itemChildrenLength');
    //MainCommentDataModel mainCommentDataModel = item.children[index];

    widgetList = [inputComment(item, index, context)];
    //print('5555');
    for (int i = 0; i < 10; i++) {
      if (i < itemChildrenLength) {
        try {
          MainCommentDataModel mainCommentDataModel = MainCommentDataModel.fromJson(item.children[i]);
          widgetList.add(commentList(mainCommentDataModel, item, i));
        } catch (e) {
          print('tenComment err *_* ;; $e');
        }
      }
    }
    if (10 < itemChildrenLength) {
      widgetList.add(lastClickPage(index, item, context));
    }
    //print('9999');
    widgetList.add(Divider(
      color: Colors.white,
      height: 50,
    ));
    return widgetList;
  }

  Widget lastClickPage(int index,MainContentDataModel item, BuildContext context) {
    // print('last click page pass');
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        width: 400,
        height: 50,
        child: ElevatedButton(
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blueGrey)),
          child: Text('덧글 전체보기', textScaleFactor: 2),
          onPressed: () {
            //print('인덱스?아 $index');
            // MainContentDataModel itemedd = data.elementAt(index);
            // itemedd.children.forEach((element) {
            //   //print('comment?? ${element.comment}');
            // });
            // //print('comment?? ${itemedd.content}');
             Navigator.of(context).push(MaterialPageRoute(builder: (context) => CommentPage(content: item)));
          },
          //  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.orange)),
        ),
      ),
    );
  }

  //댓글입력창
  Widget inputComment(MainContentDataModel item, int index, BuildContext context) {
    //print('input comment pass');
    return Container(
        width: 890,
        child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: TextField(
                controller: textEditingController[index],
                autofocus: true,
                onSubmitted: (v) {
                  print('덧글 입력 : $v');
                  if (v != '' && v.isNotEmpty) {
                    if (userId != 'LogIn') {
                      MainContentControl.setComment(index: index, item: item, value: v, userId: userId, context: context);
                      // MainDash.of(context)!.setState(() {});
                      Body.of(context)!.setBool = false;
                      textEditingController[index].clear();
                    }else{
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
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(1.0)),
                      borderSide: BorderSide(width: 1, color: Colors.white),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(1.0)),
                      borderSide: BorderSide(width: 1, color: Colors.white),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(1.0)),
                    )))));
  }

  Widget commentList(MainCommentDataModel comment, MainContentDataModel item, int order) {
    //print('commentList commentList pass');
    List<dynamic> utf8List = jsonDecode(comment.comment);
    List<int> intList = [];
    utf8List.forEach((element) {
      intList.add(element);
    });
    String decodeComment = utf8.decode(intList).toString();
    /////////////////////
    bool myIdCheck = false;
    if (comment.userId == userId) {
      myIdCheck = true;
    }

    /////////////////////

    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
            hoverColor: Colors.black12,
            selectedTileColor: MainContentWidgetModel.tileColor,
            tileColor: MainContentWidgetModel.tileColor,
            //subtitle: ,
            title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Container(
                    width: 850,
                    child: Text(
                      decodeComment,
                      style: TextStyle(color: MainContentWidgetModel.textColor, fontSize: MainContentWidgetModel.basicFontSize),
                      maxLines: 5,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  myIdCheck
                      ? IconButton(
                          //내가 적은 덧글이면 휴지통 표시가 나오고 아니면 아묵것도 안나오는것롤 !!
                          //delete
                          icon: Icon(
                            Icons.delete_forever,
                            color: MainContentWidgetModel.iconColor,
                            size: 30,
                          ),
                          onPressed: () {
                            //content id , index
                            print('***********************************');
                            print('userid : ${item.userId}');
                            print('contentid : ${item.contentId}');
                            print('덧글 목록 차수 : $order');
                            MainContentControl.deleteComment(contentId: item.contentId, userId: userId, order: order);
                            Body.of(context)!.setBool = false;
                            print('***********************************');
                          })
                      : Container(
                          child: MainContentWidgetModel.myText('${comment.userId}'),
                        ),
                ]))));
  }
}
//
// class ContentItem extends StatefulWidget {
//   const ContentItem(this.item);
//
//   final Item item;
//
//
//   @override
//   _ContentItemState createState() => _ContentItemState();
// }
//
// class _ContentItemState extends State<ContentItem> {
//
//   bool favoriteOnHover = false;
//   bool badOnHover = false;
//
//   Widget _buildItem(Item item) {
//     // print('title ${root.title}');
//     // print('build tiles call ${root.children.toString()}');
//     // print('skip? 00 ${root.children.skip(0)}');
//     // print('list>?????????? ${root.children.map(_buildItem).toList()}');
//     // if (root.children.isEmpty)
//     //   return Padding(
//     //     padding: const EdgeInsets.all(8.0),
//     //     child: ListTile(),
//     //   );
//     // if (root.children.isEmpty)
//     //   return Padding(
//     //     padding: const EdgeInsets.all(8.0),
//     //     child: ListTile(
//     //       //key: PageStorageKey<Item>(root),
//     //       hoverColor: Colors.black,
//     //       selectedTileColor: MainContentModel.tileColor,
//     //       tileColor: MainContentModel.tileColor,
//     //       //subtitle: ,
//     //       title: Padding(
//     //         padding: const EdgeInsets.all(8.0),
//     //         child: Row(
//     //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     //           children: [
//     //             Container(
//     //               width: 920,
//     //               child: Text(
//     //                 'root.titlesdffsdfsfssdffsdfsfssdffsdfsfsdffsdfsfssdffsdfsfssdffsdfsfssdffsdfsfssdffsdfsfsssdffsdfsfssdffsdfsfssdffsdfsfssdffsdfsfssdffsdfsfsdffsdfsfssdffsdfsfssdffsdfsfssdffsdfsfssdffsdfsfsssdffsdfsfssdffsdfsfssdffsdfsfssdffsdfsfssdffsdfsfsdffsdfsfssdffsdfsfssdffsdfsfssdffsdfsfssdffsdfsfsssdffsdfsfssdffsdfsfssdffsdfsfssdffsdfsfssdffsdfsfsdffsdfsfssdffsdfsfssdffsdfsfssdffsdfsfssdffsdfsfsssdffsdfsfssdffsdfsfs',
//     //                 style: TextStyle(color: MainContentModel.textColor),
//     //                 maxLines: 5,
//     //                 overflow: TextOverflow.ellipsis,
//     //                 textScaleFactor: 2,
//     //               )
//     //             ),
//     //             IconButton(icon: Icon(Icons.delete_forever,color: MainContentModel.iconColor,size: 30,), onPressed: (){print('pass');})
//     //           ]
//     //         )
//     //       ),
//     //       onTap: () {
//     //         print('?????????? $root');
//     //       },
//     //     ),
//     //   );
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: ExpansionTile(
//         subtitle:
//             //Text('생성일 (2002-05-08)',style: TextStyle(color: MainContentModel.textColor),),
//             Row(
//           mainAxisAlignment: MainAxisAlignment.end,
//           children: [
//             subTitle(0),
//             subTitle(1),
//             subTitle(2),
//             subTitle(3),
//             subTitle(4),
//             //subTitle(5),
//           ],
//         ),
//         collapsedBackgroundColor: MainContentModel.backgroundColor,
//         backgroundColor: MainContentModel.backgroundColor,
//         trailing: Icon(
//           Icons.comment,
//           color: MainContentModel.iconColor,
//         ),
//         onExpansionChanged: (v) {
//           print('뭐지이건? : $v');
//         },
//         //열었을때 작업뭐할지 정하는 메소드
//
//         //key: PageStorageKey<Item>(root),
//         title: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Container(
//                 width: 850,
//                 child: Text(
//                   '? ${item.title}',
//                   maxLines: 5,
//                   overflow: TextOverflow.ellipsis,
//                   style: TextStyle(color: MainContentModel.textColor),
//                   textScaleFactor: 2,
//                 ),
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   likeAndBadIcon(0),
//                   likeAndBadIcon(1),
//                 ],
//               ),
//             ],
//           ),
//         ),
//         children: allComment(item),
//       ),
//     );
//   }
//
//   Widget comment() {
//
//     return Container(
//         width: 900,
//         child: Padding(
//           padding: const EdgeInsets.all(28.0),
//           child: TextField(
//               onSubmitted: (v) {
//                 print(v);
//               },
//               style: TextStyle(fontSize: 25, color: Colors.white),
//               decoration: const InputDecoration(
//                   labelText: '댓 글',
//                   hintText: '입력 후 엔터',
//                   hintStyle: TextStyle(fontSize: 20, color: Colors.white),
//                   labelStyle: TextStyle(fontSize: 20, color: Colors.white),
//                   focusedBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(1.0)),
//                     borderSide: BorderSide(width: 1, color: Colors.white),
//                   ),
//                   enabledBorder: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(1.0)),
//                     borderSide: BorderSide(width: 1, color: Colors.white),
//                   ),
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.all(Radius.circular(1.0)),
//                   ))),
//         ));
//
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: ListTile(
//         //key: PageStorageKey<Item>(root),
//         hoverColor: Colors.black,
//         selectedTileColor: MainContentModel.tileColor,
//         tileColor: MainContentModel.tileColor,
//         //subtitle: ,
//         title: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//               Container(
//                   width: 920,
//                   child: Text(
//                     'roottitlesdffsdfsfssdffsdfsfssdffsdfsfsdffsdfsfssdffsdfsfssdffsdfsfssdffsdfsfssdffsdfsfsssdffsdfsfssdffsdfsfssdffsdfsfssdffsdfsfssdffsdfsfsdffsdfsfssdffsdfsfssdffsdfsfssdffsdfsfssdffsdfsfsssdffsdfsfssdffsdfsfssdffsdfsfssdffsdfsfssdffsdfsfsdffsdfsfssdffsdfsfssdffsdfsfssdffsdfsfssdffsdfsfsssdffsdfsfssdffsdfsfssdffsdfsfssdffsdfsfssdffsdfsfsdffsdfsfssdffsdfsfssdffsdfsfssdffsdfsfssdffsdfsfsssdffsdfsfssdffsdfsfs',
//                     style: TextStyle(color: MainContentModel.textColor),
//                     maxLines: 5,
//                     overflow: TextOverflow.ellipsis,
//                     textScaleFactor: 2,
//                   )),
//               IconButton(
//                   icon: Icon(
//                     Icons.delete_forever,
//                     color: MainContentModel.iconColor,
//                     size: 30,
//                   ),
//                   onPressed: () {
//                     print('pass');
//                   })
//             ])),
//         onTap: () {
//           print('??????????');
//         },
//       ),
//     );
//   }
//
//   List<Widget> allComment(Item item) {
//     //root.children.elementAt(0),
//     List<Widget> sss = [];
//     for (int i = 0; i < item.children.length; i++) {
//       sss.add(comment());
//     }
//     return sss;
//   }
//
//   Widget subTitle(int flag) {
//     return Container(
//         width: 90,
//         child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
//           if (flag == 0) Row(children: [Icon(Icons.favorite, color: MainContentModel.iconColor), Text('  ( 5 )', style: TextStyle(color: MainContentModel.textColor))]),
//           if (flag == 1) Row(children: [Icon(Icons.mood_bad, color: MainContentModel.iconColor), Text('  ( 5 )', style: TextStyle(color: MainContentModel.textColor))]),
//           if (flag == 2) Row(children: [Icon(Icons.remove_red_eye, color: MainContentModel.iconColor), Text('  ( 5 )', style: TextStyle(color: MainContentModel.textColor))]),
//           if (flag == 3) MainContentModel.myText('userId'),
//           if (flag == 4) MainContentModel.myText('2020-08-08'),
//           //if (flag == 5) Icon(Icons.delete_forever_sharp, color: MainContentModel.iconColor),
//         ]));
//   }
//
//   Widget likeAndBadIcon(int flag) {
//     return InkWell(
//         onTap: () {
//           print('$flag 패쓰');
//         },
//         onHover: (v) {
//           if (flag == 0 && v) {
//             print('0 pass $v');
//             setState(() {
//               favoriteOnHover = true;
//             });
//           } else if (flag == 1 && v) {
//             print('1 pass $v');
//             setState(() {
//               badOnHover = true;
//             });
//           } else {
//             setState(() {
//               favoriteOnHover = false;
//               badOnHover = false;
//             });
//           }
//         },
//         child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
//           if (flag == 0) Icon(Icons.favorite, color: favoriteOnHover ? Colors.red : MainContentModel.iconColor),
//           if (flag == 1)
//             Padding(
//               padding: const EdgeInsets.only(left: 20, right: 10),
//               child: Icon(Icons.mood_bad, color: badOnHover ? Colors.blue : MainContentModel.iconColor),
//             )
//         ]));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     print('widget item?? ${widget.item}');
//     return _buildItem(widget.item);
//   }
// }
