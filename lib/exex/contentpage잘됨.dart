import 'dart:html';

import 'package:flutter/material.dart';
import 'package:web/control/readContent.dart';
import 'package:web/model/mainContentTileColor.dart';

class AllContentPage extends StatefulWidget {
  const AllContentPage({Key? key, required this.data}) : super(key: key);
  final List data;

  @override
  _AllContentPageState createState() => _AllContentPageState(data: data);
}

class _AllContentPageState extends State<AllContentPage> {
  _AllContentPageState({required this.data});

  final List data;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => ContentItem(data[0]),
      itemCount: data.length,
    );
  }
}

class ContentItem extends StatefulWidget {
  const ContentItem(this.item);

  final Item item;

  @override
  _ContentItemState createState() => _ContentItemState();
}

class _ContentItemState extends State<ContentItem> {
  bool favoriteOnHover = false;
  bool badOnHover = false;

  Widget _buildItem(Item item) {
    // print('title ${root.title}');
    // print('build tiles call ${root.children.toString()}');
    // print('skip? 00 ${root.children.skip(0)}');
    // print('list>?????????? ${root.children.map(_buildItem).toList()}');
    // if (root.children.isEmpty)
    //   return Padding(
    //     padding: const EdgeInsets.all(8.0),
    //     child: ListTile(),
    //   );
    // if (root.children.isEmpty)
    //   return Padding(
    //     padding: const EdgeInsets.all(8.0),
    //     child: ListTile(
    //       //key: PageStorageKey<Item>(root),
    //       hoverColor: Colors.black,
    //       selectedTileColor: MainContentModel.tileColor,
    //       tileColor: MainContentModel.tileColor,
    //       //subtitle: ,
    //       title: Padding(
    //         padding: const EdgeInsets.all(8.0),
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             Container(
    //               width: 920,
    //               child: Text(
    //                 'root.titlesdffsdfsfssdffsdfsfssdffsdfsfsdffsdfsfssdffsdfsfssdffsdfsfssdffsdfsfssdffsdfsfsssdffsdfsfssdffsdfsfssdffsdfsfssdffsdfsfssdffsdfsfsdffsdfsfssdffsdfsfssdffsdfsfssdffsdfsfssdffsdfsfsssdffsdfsfssdffsdfsfssdffsdfsfssdffsdfsfssdffsdfsfsdffsdfsfssdffsdfsfssdffsdfsfssdffsdfsfssdffsdfsfsssdffsdfsfssdffsdfsfssdffsdfsfssdffsdfsfssdffsdfsfsdffsdfsfssdffsdfsfssdffsdfsfssdffsdfsfssdffsdfsfsssdffsdfsfssdffsdfsfs',
    //                 style: TextStyle(color: MainContentModel.textColor),
    //                 maxLines: 5,
    //                 overflow: TextOverflow.ellipsis,
    //                 textScaleFactor: 2,
    //               )
    //             ),
    //             IconButton(icon: Icon(Icons.delete_forever,color: MainContentModel.iconColor,size: 30,), onPressed: (){print('pass');})
    //           ]
    //         )
    //       ),
    //       onTap: () {
    //         print('?????????? $root');
    //       },
    //     ),
    //   );
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ExpansionTile(
        subtitle:
        //Text('생성일 (2002-05-08)',style: TextStyle(color: MainContentModel.textColor),),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            subTitle(0),
            subTitle(1),
            subTitle(2),
            subTitle(3),
            subTitle(4),
            //subTitle(5),
          ],
        ),
        collapsedBackgroundColor: MainContentModel.backgroundColor,
        backgroundColor: MainContentModel.backgroundColor,
        trailing: Icon(
          Icons.comment,
          color: MainContentModel.iconColor,
        ),
        onExpansionChanged: (v) {
          print('뭐지이건? : $v');
        },
        //열었을때 작업뭐할지 정하는 메소드

        //key: PageStorageKey<Item>(root),
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 850,
                child: Text(
                  '? ${item.title}',
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: MainContentModel.textColor),
                  textScaleFactor: 2,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  likeAndBadIcon(0),
                  likeAndBadIcon(1),
                ],
              ),
            ],
          ),
        ),
        children: allComment(item),
      ),
    );
  }

  Widget comment() {

    return Container(
        width: 900,
        child: Padding(
          padding: const EdgeInsets.all(28.0),
          child: TextField(
              onSubmitted: (v) {
                print(v);
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
                  ))),
        ));

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        //key: PageStorageKey<Item>(root),
        hoverColor: Colors.black,
        selectedTileColor: MainContentModel.tileColor,
        tileColor: MainContentModel.tileColor,
        //subtitle: ,
        title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Container(
                  width: 920,
                  child: Text(
                    'roottitlesdffsdfsfssdffsdfsfssdffsdfsfsdffsdfsfssdffsdfsfssdffsdfsfssdffsdfsfssdffsdfsfsssdffsdfsfssdffsdfsfssdffsdfsfssdffsdfsfssdffsdfsfsdffsdfsfssdffsdfsfssdffsdfsfssdffsdfsfssdffsdfsfsssdffsdfsfssdffsdfsfssdffsdfsfssdffsdfsfssdffsdfsfsdffsdfsfssdffsdfsfssdffsdfsfssdffsdfsfssdffsdfsfsssdffsdfsfssdffsdfsfssdffsdfsfssdffsdfsfssdffsdfsfsdffsdfsfssdffsdfsfssdffsdfsfssdffsdfsfssdffsdfsfsssdffsdfsfssdffsdfsfs',
                    style: TextStyle(color: MainContentModel.textColor),
                    maxLines: 5,
                    overflow: TextOverflow.ellipsis,
                    textScaleFactor: 2,
                  )),
              IconButton(
                  icon: Icon(
                    Icons.delete_forever,
                    color: MainContentModel.iconColor,
                    size: 30,
                  ),
                  onPressed: () {
                    print('pass');
                  })
            ])),
        onTap: () {
          print('??????????');
        },
      ),
    );
  }

  List<Widget> allComment(Item item) {
    //root.children.elementAt(0),
    List<Widget> sss = [];
    for (int i = 0; i < item.children.length; i++) {
      sss.add(comment());
    }
    return sss;
  }

  Widget subTitle(int flag) {
    return Container(
        width: 90,
        child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          if (flag == 0) Row(children: [Icon(Icons.favorite, color: MainContentModel.iconColor), Text('  ( 5 )', style: TextStyle(color: MainContentModel.textColor))]),
          if (flag == 1) Row(children: [Icon(Icons.mood_bad, color: MainContentModel.iconColor), Text('  ( 5 )', style: TextStyle(color: MainContentModel.textColor))]),
          if (flag == 2) Row(children: [Icon(Icons.remove_red_eye, color: MainContentModel.iconColor), Text('  ( 5 )', style: TextStyle(color: MainContentModel.textColor))]),
          if (flag == 3) MainContentModel.myText('userId'),
          if (flag == 4) MainContentModel.myText('2020-08-08'),
          //if (flag == 5) Icon(Icons.delete_forever_sharp, color: MainContentModel.iconColor),
        ]));
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

  @override
  Widget build(BuildContext context) {
    print('widget item?? ${widget.item}');
    return _buildItem(widget.item);
  }
}
