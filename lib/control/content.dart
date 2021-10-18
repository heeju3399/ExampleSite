import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:web/exex/mainDashFailed.dart';
import 'package:web/model/content.dart';
import 'dart:html' as html;
import 'package:web/server/nodeServer.dart';

class MainContentControl {
  static Future<Map> setContent({required String content, required String userId}) async {
    Map resultMap = Map();
    bool result = false;
    if (content == '' || content.isEmpty) {
      resultMap = {'title': '빈칸을 채워주세요', 'message': '하고싶은 말을 적어주세요'};
    } else {
      await NodeServer.setContents(content: content, userId: userId).then((value) => {result = value});
      if (result) {
        resultMap = {'title': 'pass', 'message': ''};
      } else {
        resultMap = {'title': '에러', 'message': '관리자에게 문의 하세요'};
      }
    }
    return resultMap;
  }

  static Future<List<MainContentDataModel>> getUserContents({required String userId}) async {
    print('getUserContents pass');
    List response = [];
    List<MainContentDataModel> returnList = [];
    await NodeServer.getUserContents(userId: userId).then((value) => {response = value});
    try {
      if (response.first == 'pass') {
        response = response.last;
        response.forEach((element) {
          MainContentDataModel mainContentDataModel = MainContentDataModel.fromJson(jsonDecode(jsonEncode(element)));
          //print('$element');
          returnList.add(mainContentDataModel);
        });
      }
    } catch (e) {
      print('오오오오오오오오오오억 *-* ($e)');
    }
    //returnList = returnList.reversed.toList();
    return returnList;
  }

  static Future<List<MainContentDataModel>> getContent2() async {
    List response = [];
    List<MainContentDataModel> returnList = [];
    await NodeServer.getAllContents().then((value) => {response = value});
  print('///////////////////////////////');
  print(response);
    try {
      if (response.first == 'pass') {
        response = response.last;
        response.forEach((element) {
          MainContentDataModel mainContentDataModel = MainContentDataModel.fromJson(jsonDecode(jsonEncode(element)));
          returnList.add(mainContentDataModel);
        });
      }
    } catch (e) {
      print('오오오오오오오오오오억 *-* ($e)');
    }
    //returnList = returnList.reversed.toList();
    return returnList;
  }

  static Future<bool> setComment({required String value, required int index, required MainContentDataModel item, required String userId, required BuildContext context}) async {
    bool result = false;
    print('setcomment pass');
    print(' value  : $value');
    print(' index : $index');
    print(' userid : $userId');
    print(' contentId : ${item.contentId}');
    print('setcomment pass');
    var contentEncode = utf8.encode(value); //변환후 입력해야함
    MainCommentDataModel mainCommentDataModel = MainCommentDataModel(comment: '$contentEncode', userId: userId, createTime: '${DateTime.now()}', visible: '1');
    await NodeServer.setComment(comment: mainCommentDataModel, contentId: item.contentId).then((value) => {result = value});

    return result;
  }

  static void setLikeAndBad({required int flag, required int contentId}) {
    NodeServer.setLikeAndBad(contentId: contentId, likeAndBad: flag).then((value) => {});
  }

  static void deleteContent(int contentId, String userId) {
    NodeServer.deleteContent(contentId, userId);//bool 타입으로 리턴되는데 뭐쓰지?
  }

}

// print('=============================aaaaaaaaaaaaaaaaaaaaa====================================');
// Map<dynamic, dynamic> response22 = jsonDecode(response.body);
// print('response22 : $response22');
// print('=================================================================');
// if (response22.values.elementAt(0).contains('pass')) {
//   Map  bb = response22.values.elementAt(1);
//   print('===========================bbbbbbbbbbbbbbbbbbbbb======================================');
//   print(bb);
//   ResponseContent aa = ResponseContent.fromJson(bb);
//   print('===========================ccccccccccccccccccccccccccc======================================');
//
//   print('/************************** ${aa.mainDashContent}');
//   aa.mainDashContent.forEach((element) {
//     print('00000000000000000000000000');
//     print(element);
//
//     Map<dynamic, dynamic> usermap = jsonDecode(jsonEncode(element));
//     print('==========================');
//     print(usermap);
//     MainContentDataModel mainContentDataModel = MainContentDataModel.fromJson(jsonDecode(jsonEncode(element)));
//     returnList.add(mainContentDataModel);
//     print('111111111111111111111111111');
//     print(mainContentDataModel.viewCount);
//     print('==========================');
//     print(mainContentDataModel.badCount);
//     print('==========================');
//     print(mainContentDataModel.content);
//     print('element /////////////// $element');
//
//   });
//   print('============================dddddddddddddddddddddddddddd=====================================');
//   List ss = aa.mainDashContent;
//   print(ss);
//returnList = aa.values.last;
//print('resutn list  : $returnList');
// responseContent = ResponseContent.fromJson(jsonDecode());
// print('responseContent^%%%%%%%%%%%%%%%%%% : ${responseContent.mainDashContent}');

// print('/////////////////////////////////////');
//
// try{
//   list.forEach((element) {
//     //print('list view $element');
//     Map map = Map();
//     map = element;
//     map.forEach((key, value) {
//       print(key);
//       print(value);
//     });
//   });
//   print('======================================');
//   print(mainContentDataModel.toString());
// }catch(e){
//   print('에러남 : $e');
// }

//var contentDe = utf8.decode();
//
//List<MainContentDataModel> allContentItem = <MainContentDataModel>[
//   MainContent(contentId: 4, createTime: '9999', userId: 'admin', visible: 1, children: <MainComment>[
//     MainComment(visible: 1,createTime: '9999', comment: '난알아요', userId: 'admin!!'),
//   ], content: '오케이', badCount: 0, likeCount: 0, viewCount: 0),
//   MainContent(contentId: 3,createTime: '9999', userId: 'admin', visible: 1, children: <MainComment>[
//     MainComment(visible: 1,createTime: '9999', comment: '난알아요', userId: 'admin!!'),
//     MainComment(visible: 1,createTime: '0049', comment: '우와 ', userId: 'admin!!'),
//     MainComment(visible: 1,createTime: '0505', comment: '우왕', userId: 'admin!!'),
//     MainComment(visible: 1,createTime: '4040', comment: 'ㅅㄴㅂ;;ㅇ,;ㅅ[게', userId: 'admin!!'),
//     MainComment(visible: 1,createTime: '9999', comment: '퀴즈탐험', userId: 'admin!!'),
//     MainComment(visible: 1,createTime: '9999', comment: '난알아요', userId: 'admin!!'),
//     MainComment(visible: 1,createTime: '0049', comment: '우와 ', userId: 'admin!!'),
//   ], content: '오로롱', badCount: 0, likeCount: 0, viewCount: 0),
//   MainContent(contentId: 0 ,createTime: '9999', userId: 'admin', visible: 1, children: <MainComment>[], content: '홍금보닷', badCount: 0, likeCount: 10, viewCount: 0),
//   MainContent(contentId: 1 ,createTime: '9999', userId: 'admin', visible: 1, children: <MainComment>[], content: '웃웃', badCount: 0, likeCount: 0, viewCount: 20),
//];
