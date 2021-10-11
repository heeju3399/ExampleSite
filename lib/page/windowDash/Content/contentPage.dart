import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:web/control/readContent.dart';
import 'package:web/model/mainContentTileColor.dart';
import 'package:web/model/shared.dart';
import 'CommentPage.dart';

class AllContentPage extends StatefulWidget {
  const AllContentPage({Key? key, required this.data}) : super(key: key);
  final List data;

  @override
  _AllContentPageState createState() => _AllContentPageState(data: data);
}

class _AllContentPageState extends State<AllContentPage> {
  _AllContentPageState({required this.data});

  final List data;
  bool favoriteOnHover = false;
  bool badOnHover = false;
  List<Widget> widgetList = [];
  List<TextEditingController> textEditingController = [];
  int viewCount = 0;
  int likeCount = 0;
  int badCount = 0;



  @override
  void initState() {
    super.initState();
  }


  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //print('처음부터 값이 들어오나? ${data.length}');
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        MainContent item = data[index];
        return _mainBuild(item, index, context);
      },
      itemCount: data.length,
      shrinkWrap: true,
    );
  }

  Widget _mainBuild(MainContent item, int index, BuildContext context) {
    textEditingController.add(TextEditingController());
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ExpansionTile(
            subtitle: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Icon(Icons.favorite, color: MainContentModel.iconColor),
                  Text('  ( ${item.likeCount} )', style: TextStyle(color: MainContentModel.textColor)),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Icon(Icons.mood_bad, color: MainContentModel.iconColor),
                  ),
                  Text('  ( ${item.badCount} )', style: TextStyle(color: MainContentModel.textColor)),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Icon(Icons.remove_red_eye, color: MainContentModel.iconColor),
                  ),
                  Text('  ( ${item.viewCount} )', style: TextStyle(color: MainContentModel.textColor)),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: MainContentModel.myText(item.userId),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: MainContentModel.myText(item.createTime),
                  )
                ])),
            collapsedBackgroundColor: MainContentModel.backgroundColor,
            backgroundColor: Colors.black12,
            trailing: Icon(
              Icons.comment,
              color: MainContentModel.iconColor,
            ),
            onExpansionChanged: (v) {
              print('열고 닫힐때 : $v');
              if (v) {
                viewCount++;
              }
            },
            //열었을때 작업뭐할지 정하는 메소드
            //key: PageStorageKey<Item>(root),
            title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Container(
                      width: 850,
                      child: Text(
                        '${item.content}',
                        maxLines: 5,
                        overflow: TextOverflow.clip,
                        style: TextStyle(color: MainContentModel.textColor, fontSize: MainContentModel.basicFontSize),
                      )),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    likeAndBadIcon(0), //이녀석의 성격은 좀 다름  셋할때 할것
                    likeAndBadIcon(1), //이녀석의 성격은 좀 다름 ㅍ 셋할때 할것
                  ])
                ])),
            children: tenComment(item, index, context)));
  }

  List<Widget> tenComment(MainContent item, int index, BuildContext context) {
    //print('all comment pass');
    int itemChildrenLength = item.children.length;
    widgetList = [inputComment(item, index)];
    for (int i = 0; i < 10; i++) {
      if (i < itemChildrenLength) {
        widgetList.add(commentList(item.children[i], item, index, i));
      }
    }
    if (10 < itemChildrenLength) {
      widgetList.add(lastClickPage(index, context));
    }
    widgetList.add(Divider(
      color: Colors.white,
      height: 50,
    ));
    return widgetList;
  }

  Widget lastClickPage(int index, BuildContext context) {
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
            MainContent itemedd = data.elementAt(index);
            itemedd.children.forEach((element) {
              //print('comment?? ${element.comment}');
            });
            //print('comment?? ${itemedd.content}');
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => CommentPage(content: itemedd)));
          },
          //  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.orange)),
        ),
      ),
    );
  }

  //댓글입력창
  Widget inputComment(MainContent item, int index) {
    return Container(
        width: 890,
        child: Padding(
            padding: const EdgeInsets.all(28.0),
            child: TextField(
                controller: textEditingController[index],
                autofocus: true,
                onSubmitted: (v) {
                  //print('덧글 입력 : $v');
                  MainComment mainComment = MainComment(comment: '${v.toString()}', visible: 1, userId: 'kkkk123', createTime: '${DateTime.now().toString()}');
                  item.children.insert(0, mainComment);
                  //item.children.add(mainComment);
                  item.children.forEach((element) {
                    //print(element.comment.toString());
                  });
                  setState(() {});
                  textEditingController[index].clear();
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

  Widget commentList(MainComment comment, MainContent item, int index, int i) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
            hoverColor: Colors.black12,
            selectedTileColor: MainContentModel.tileColor,
            tileColor: MainContentModel.tileColor,
            //subtitle: ,
            title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  Container(
                      width: 920,
                      child: Text(
                        '${comment.comment}',
                        style: TextStyle(color: MainContentModel.textColor, fontSize: MainContentModel.basicFontSize),
                        maxLines: 5,
                        overflow: TextOverflow.clip,
                      )),
                  IconButton(
                      //delete
                      icon: Icon(
                        Icons.delete_forever,
                        color: MainContentModel.iconColor,
                        size: 30,
                      ),
                      onPressed: () {
                        print('delete pass : $i');
                        print(widgetList.toString());
                        item.children.removeAt(i);
                        print('***********************************');
                        setState(() {});
                      })
                ]))));
  }

  Widget likeAndBadIcon(int flag) {
    return InkWell(
        onTap: () {
          print('$flag 패쓰');
        },
        onHover: (v) {
          if (flag == 0 && v) {
            print('0 pass $v');
            setState(() {
              favoriteOnHover = true;
            });
          } else if (flag == 1 && v) {
            print('1 pass $v');
            setState(() {
              badOnHover = true;
            });
          } else {
            setState(() {
              favoriteOnHover = false;
              badOnHover = false;
            });
          }
        },
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          if (flag == 0) Icon(Icons.favorite, color: favoriteOnHover ? Colors.red : MainContentModel.iconColor),
          if (flag == 1)
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 10),
              child: Icon(Icons.mood_bad, color: badOnHover ? Colors.blue : MainContentModel.iconColor),
            )
        ]));
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
