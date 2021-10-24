import 'dart:convert';
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:web/control/content.dart';
import 'package:web/model/content.dart';
import 'package:web/model/mainContentTileColor.dart';
import 'package:web/model/shared.dart';
import 'package:web/page/windowDash/body.dart';

import '../../responsive.dart';

class ProFile extends StatefulWidget {
  const ProFile({Key? key, required this.userId}) : super(key: key);
  static String routeName = '/ProFile';
  final String userId;

  @override
  _ProFileState createState() => _ProFileState(userId: userId);
}

class _ProFileState extends State<ProFile> {
  _ProFileState({required this.userId});

  bool reload = true;
  final String userId;
  int contentId2 = 0;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        //child: SingleChildScrollView(physics: ScrollPhysics(), child: Responsive.isLarge(context) ? isWindow(context, userId) : isMobile(context)),
        body: reload ? SingleChildScrollView(physics: ScrollPhysics(), child: Responsive.isLarge(context) ? windows() : mobile()) : CircularProgressIndicator());
  }

  Center mobile() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(padding: const EdgeInsets.only(top: 10), child: Text('$userId 님의 글', maxLines: 1, overflow: TextOverflow.clip, style: TextStyle(fontSize: 15, color: Colors.white))),
              Padding(padding: const EdgeInsets.only(top: 10), child: Text('길게 누르면 지워집니다', maxLines: 1, overflow: TextOverflow.clip, style: TextStyle(fontSize: 15, color: Colors.white))),
              Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white12,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: TextButton(
                      onPressed: () {
                        MyShared.setUserId('LogIn');
                        html.window.location.reload();
                      },
                      child: Container(
                          width: 130,
                          height: 40,
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.logout,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                '로그아웃',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          )),
                    ),
                  )),
            ],
          ),
          Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                width: 500,
                child: FutureBuilder(
                    future: MainContentControl.getUserContents(userId: userId),
                    builder: (context, snap) {
                      if (!snap.hasData) {
                        return Center(
                            child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                        ));
                      } else {
                        List data22 = snap.data as List;
                        return ListView.builder(
                          itemBuilder: (BuildContext context, int index) {
                            MainContentDataModel item = data22[index];
                            return _mainMobileBuild(context: context, item: item, index: index);
                          },
                          itemCount: data22.length,
                          shrinkWrap: true,
                        );
                      }
                    }),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    width: 200,
                    height: 40,
                    decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: TextButton(
                        onPressed: () {
                          contentAllDelete(contentId2);
                        },
                        child: Text('전체삭제', textScaleFactor: 2, style: TextStyle(color: Colors.white)))),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                    width: 200,
                    height: 40,
                    decoration: BoxDecoration(color: Colors.redAccent, borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: TextButton(
                        onPressed: () {
                          userDelete();
                        },
                        child: Text('회원탈퇴', textScaleFactor: 2, style: TextStyle(color: Colors.white)))),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Center windows() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Text(
                  '$userId 님의 글',
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Text(
                  '길게 누르면 지워집니다',
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white12,
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: TextButton(
                      onPressed: () {
                        MyShared.setUserId('LogIn');
                        html.window.location.reload();
                      },
                      child: Container(
                          width: 200,
                          height: 50,
                          alignment: Alignment.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.logout,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                '로그아웃',
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          )),
                    ),
                  )),
            ],
          ),
          Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Container(
                width: 1000,
                child: FutureBuilder(
                    future: MainContentControl.getUserContents(userId: userId),
                    builder: (context, snap) {
                      if (!snap.hasData) {
                        return Center(
                            child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                        ));
                      } else {
                        List data22 = snap.data as List;
                        return ListView.builder(
                          itemBuilder: (BuildContext context, int index) {
                            MainContentDataModel item = data22[index];
                            return _mainBuild(context: context, item: item, index: index);
                          },
                          itemCount: data22.length,
                          shrinkWrap: true,
                        );
                      }
                    }),
              )),
          Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
            SizedBox(
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                  width: 250,
                  height: 60,
                  decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: TextButton(
                      onPressed: () {
                        contentAllDelete(contentId2);
                      },
                      child: Text('전체삭제', textScaleFactor: 2, style: TextStyle(color: Colors.white)))),
            ),
            Padding(
                padding: const EdgeInsets.all(18.0),
                child: Container(
                    width: 250,
                    height: 60,
                    decoration: BoxDecoration(color: Colors.redAccent, borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: TextButton(
                        onPressed: () {
                          userDelete();
                        },
                        child: Text('회원탈퇴', textScaleFactor: 2, style: TextStyle(color: Colors.white)))))
          ]),
          SizedBox(
            height: 100,
          )
        ],
      ),
    );
  }

  Widget _mainMobileBuild({required MainContentDataModel item, required int index, required BuildContext context}) {
    List<dynamic> aa = jsonDecode(item.content);
    List<int> intList = [];
    aa.forEach((element) {
      intList.add(element);
    });
    String utf8StringContent = utf8.decode(intList).toString();
    contentId2 = item.contentId;
    return InkWell(
        onLongPress: () {
          print('index $index');
          contentDelete(item.contentId);
        },
        child: Card(
            color: Colors.white12,
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(mainAxisAlignment: MainAxisAlignment.end, crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Padding(padding: const EdgeInsets.all(8.0), child: Text('$utf8StringContent', maxLines: 5, overflow: TextOverflow.clip, style: TextStyle(color: MainContentWidgetModel.textColor))),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Icon(Icons.favorite, size: 15, color: MainContentWidgetModel.iconColor),
                      Text('  ( ${item.likeCount} )', style: TextStyle(color: MainContentWidgetModel.textColor, fontSize: 12)),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Icon(Icons.mood_bad, size: 15, color: MainContentWidgetModel.iconColor),
                      ),
                      Text('  ( ${item.badCount} )', style: TextStyle(color: MainContentWidgetModel.textColor, fontSize: 12)),
                      Padding(
                        padding: const EdgeInsets.only(left: 30),
                        child: Icon(Icons.comment, size: 15, color: MainContentWidgetModel.iconColor),
                      ),
                      Text('  ( ${item.children.length} )', style: TextStyle(color: MainContentWidgetModel.textColor, fontSize: 12)),
                      Padding(padding: const EdgeInsets.only(left: 30), child: MainContentWidgetModel.myText(item.createTime))
                    ]),
                  ),
                ]))));
  }

  Widget _mainBuild({required MainContentDataModel item, required int index, required BuildContext context}) {
    List<dynamic> aa = jsonDecode(item.content);
    List<int> intList = [];
    aa.forEach((element) {
      intList.add(element);
    });
    String utf8StringContent = utf8.decode(intList).toString();
    contentId2 = item.contentId;
    return InkWell(
      onLongPress: () {
        print('index $index');
        contentDelete(item.contentId);
      },
      child: Card(
        color: Colors.white12,
        child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('$utf8StringContent',
                        maxLines: 5, overflow: TextOverflow.clip, style: TextStyle(color: MainContentWidgetModel.textColor, fontSize: MainContentWidgetModel.basicFontSize))),
                Row(mainAxisAlignment: MainAxisAlignment.end, children: [
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
                ]),
              ],
            )),
      ),
    );
  }

  void refreshMethod() async {
    setState(() {
      reload = false;
    });
    await Future.delayed(Duration(milliseconds: 5));
    setState(() {
      reload = true;
    });
  }

  void contentDelete(int contentId) {
    MainContentControl.deleteContent(contentId, userId);
    refreshMethod();
  }

  void contentAllDelete(int contentId) {
    MainContentControl.deleteAllContent(contentId, userId);
    refreshMethod();
  }

  void userDelete() {
    MainContentControl.userDelete(userId: userId);
  }
}
