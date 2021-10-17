import 'dart:convert';
import "dart:convert" show utf8;
import 'package:http/http.dart' as http;
import 'package:web/model/content.dart';
import 'package:web/model/login.dart';
import 'package:web/model/signUp.dart';

class NodeServer {

  static Future<bool> setComment({required MainCommentDataModel comment, required int contentId}) async {
    String flag = 'setcomment';
    String siteKey = 'secretKey'; //실제 쓰일댄 이렇게 쓰면안됨 파이버 베이스 같은곳에 넣어서 쓰기
    bool returnResult = false;
    Map<String, String> map = Map();
    map = {"siteKey": '$siteKey', "id": '${comment.userId}', "comment": '${comment.comment}', "flag": '$flag', "nowtime": '${comment.createTime}', "visible": '${comment.visible}', "contentid": '$contentId'};
    try {
      var response = await http.post(Uri.parse('http://localhost:3000/setcomment'), headers: map);
      int stateCode = response.statusCode;
      print('$stateCode pass');
      if (stateCode == 200) {
        String result = response.body.toString();
        print('body : $result');
        result = result.substring(10, 14);
        print('sub?? $result');
        if (result.contains('pass')) {

          returnResult = true;
        } else if (result.contains('no')) {
          returnResult = false;
        }
      }
    } catch (e) {
      print('setComment error :$e');
      returnResult = false;
    }
    print('return value : $returnResult');
    return returnResult;
  }
















  static Future<String> fetchPost() async {
    var response;
    Map<String, String> map = Map();
    map = {"userheader": "1234", "uu": "k546565464564564564k"};
    try {
      // response = await http.get(Uri.parse('http://172.30.1.19:3000/'),
      //     headers: {"userheader":"1234","uu":"k546565464564564564k"},);
      response = await http.post(Uri.parse('http://172.30.1.19:3000/'), headers: map);
    } catch (e) {
      print(e);
    }
    print('code?? : ${response.statusCode}');
    if (response.statusCode == 200) {
      print('response : ${response.body}');
      var ss = response.body.toString();
      return ss;
    } else {
      return 'empty';
      // 만약 응답이 OK가 아니면, 에러를 던집니다.
      throw Exception('Failed to load post');
    }
  }

  // Future<Map> fetchPostContent() async {
  //   var response;
  //   try {
  //     response = await http.get(Uri.parse('http://172.30.1.19:3000/'),
  //         headers: {"userheader":"1234"});
  //   } catch (e) {
  //     print(e);
  //   }
  //   print('code?? : ${response.statusCode}');
  //   if (response.statusCode == 200) {
  //     print('response : ${response.body}');
  //     var ss = response.body.toString();
  //     return ss;
  //   } else {
  //     throw Exception('Failed to load post');
  //     return 'empty';
  //     // 만약 응답이 OK가 아니면, 에러를 던집니다.
  //
  //   }
  //   // // dma json
  //   // var request = {
  //   //   'user1': 'um...1',
  //   //   'user2': 'um...2',
  //   //   'user3': 'um...3',
  //   //   'user4': 'um...4',
  //   //   'user5': 'um...5',
  //   //   'user6': 'um...7',
  //   // };
  //   // return Future.delayed(Duration(seconds: 2), () {
  //   //   return request;
  //   // });
  // }

  // void setLikeAndBad() async {
  //   String flag = 'setcontent';
  //   String siteKey = 'secretKey'; //실제 쓰일댄 이렇게 쓰면안됨 파이버 베이스 같은곳에 넣어서 쓰기
  //   bool returnResult = false;
  //   String nowTime = DateTime.now().toString();
  //   String visible = '1';
  //   print('contetn : $content');
  //   var contentEncode = utf8.encode(content);
  //   //var contentDe = utf8.decode(contentEncode);
  //   Map<String, String> map = Map();
  //   map = {"siteKey": '$siteKey', "id": '$userId', "content": '$contentEncode', "flag": '$flag', "nowtime": '$nowTime', "visible": '$visible'};
  //   try {
  //     var response = await http.post(Uri.parse('http://localhost:3000/setlikeandbad'), headers: map);
  //     int stateCode = response.statusCode;
  //     print('$stateCode pass');
  //     if (stateCode == 200) {
  //       String result = response.body.toString();
  //       print('body : $result');
  //       result = result.substring(10,14);
  //       print('sub?? $result');
  //       if(result.contains('pass')){
  //         returnResult = true;
  //       }else if(result.contains('no')){
  //         returnResult = false;
  //       }
  //     }
  //   } catch (e) {
  //     print(e);
  //     returnResult = false;
  //   }
  //   print('return pre : $returnResult');
  //   return returnResult;
  // }

  void getLikeAndBad() async {}

  static Future<bool> setContents({required String content, required String userId}) async {
    String flag = 'setcontent';
    String siteKey = 'secretKey'; //실제 쓰일댄 이렇게 쓰면안됨 파이버 베이스 같은곳에 넣어서 쓰기
    bool returnResult = false;
    String nowTime = DateTime.now().toString();
    String visible = '1';
    print('contetn : $content');
    var contentEncode = utf8.encode(content);
    //var contentDe = utf8.decode(contentEncode);
    Map<String, String> map = Map();
    map = {"siteKey": '$siteKey', "id": '$userId', "content": '$contentEncode', "flag": '$flag', "nowtime": '$nowTime', "visible": '$visible'};
    try {
      var response = await http.post(Uri.parse('http://localhost:3000/setcontent'), headers: map);
      int stateCode = response.statusCode;
      print('$stateCode pass');
      if (stateCode == 200) {
        String result = response.body.toString();
        print('body : $result');
        result = result.substring(10, 14);
        print('sub?? $result');
        if (result.contains('pass')) {
          returnResult = true;
        } else if (result.contains('no')) {
          returnResult = false;
        }
      }
    } catch (e) {
      print('error :$e');
      returnResult = false;
    }
    print('return pre : $returnResult');
    return returnResult;
  }

  static Future<List<dynamic>> getAllContents() async {
    String flag = 'setcontent';
    String siteKey = 'secretKey'; //실제 쓰일댄 이렇게 쓰면안됨 파이버 베이스 같은곳에 넣어서 쓰기
    Map<String, String> map = Map();
    List returnList = [];
    map = {"siteKey": '$siteKey', "flag": '$flag'};
    try {
      var response = await http.post(Uri.parse('http://localhost:3000/getallcontent'), headers: map);
      int stateCode = response.statusCode;
      print('$stateCode pass');
      if (stateCode == 200) {
        Map<dynamic, dynamic> responsePassCheck = jsonDecode(response.body);
        if (responsePassCheck.values.elementAt(0).contains('pass')) {// pass 인지?
          returnList.add('pass');
          Map mainDashContent = responsePassCheck.values.elementAt(1);
          ResponseContent unMainDashContent = ResponseContent.fromJson(mainDashContent);
          //print('/************************** ${unMainDashContent.mainDashContent}');
          returnList.add(unMainDashContent.mainDashContent);
        }
      }else{
        returnList.add('no');
      }
    } catch (e) {
      print('에러남 -_- : $e');
      returnList.add('err');
    }
    //print('returnListreturnListreturnList pre : $returnList');
    return returnList;
  }

  //
  // static Future<MainContentModel> getContents() async {
  //   String flag = 'setcontent';
  //   String siteKey = 'secretKey'; //실제 쓰일댄 이렇게 쓰면안됨 파이버 베이스 같은곳에 넣어서 쓰기
  //
  //   //var contentDe = utf8.decode(contentEncode);
  //   Map<String, String> map = Map();
  //   map = {"siteKey": '$siteKey',"flag": '$flag'};
  //   try {
  //     var response = await http.post(Uri.parse('http://localhost:3000/getcontent'), headers: map);
  //     int stateCode = response.statusCode;
  //     print('$stateCode pass');
  //     if (stateCode == 200) {
  //       String result = response.body.toString();
  //       print('body : $result');
  //       result = result.substring(10, 14);
  //       print('sub?? $result');
  //       if (result.contains('pass')) {
  //         returnResult = true;
  //       } else if (result.contains('no')) {
  //         returnResult = false;
  //       }
  //     }
  //   } catch (e) {
  //     print(e);
  //     returnResult = false;
  //   }
  //   print('return pre : $returnResult');
  //   return returnResult;
  // }

  static Future<LogInResponse> signIn(String id, String pass) async {
    String flag = 'signIn';
    String siteKey = 'secretKey'; //실제 쓰일댄 이렇게 쓰면안됨 파이버 베이스 같은곳에 넣어서 쓰기
    var response;
    LogInResponse logInResult = LogInResponse(stateCode: 000, message: '서버 접속 불가', title: 'err');
    Map<String, String> map = Map();
    map = {"siteKey": '$siteKey', "id": '$id', "pass": '$pass', "flag": '$flag'};
    try {
      response = await http.post(Uri.parse('http://localhost:3000/login'), headers: map);
      //print('response : ${response.body}');
      //print('response.statusCode : ${response.statusCode}');
      int stateCode = response.statusCode;
      print('200 pass');
      Map map5 = Map();
      Map<dynamic, dynamic> map2 = Map();
      var decode = jsonDecode(response.body);
      //print('decode : $decode');
      map2.addAll(decode);
      map5 = {'stateCode': stateCode};
      map2.addAll(map5);
      //print('map2 : $map2');
      logInResult = LogInResponse.fromJson(map2);
      //logInResult = LogInResponse.fromJson(jsonDecode(response.body));
      // print('logInResult : ${logInResult.title}');
      // print('logInResult : ${logInResult.message}');
      // print('logInResult : ${logInResult.stateCode}');
    } catch (e) {
      print(e);
    }
    return logInResult;
  }

  static Future<SignupResponse> signUp({required String id, required String pass, required String name}) async {
    //print('**************************************************');
    String flag = 'signup';
    String siteKey = 'secretKey'; //실제 쓰일댄 이렇게 쓰면안됨 파이버 베이스 같은곳에 넣어서 쓰기
    Map<String, String> requestMap = Map();
    requestMap = {"siteKey": '$siteKey', "id": '$id', "pass": '$pass', "name": '$name', "flag": '$flag'};
    SignupResponse signUpResponse = SignupResponse(stateCode: 000, message: '서버 접속 불가', title: 'err');

    try {
      var response = await http.post(Uri.parse('http://localhost:3000/signup'), headers: requestMap);
      //print('response : ${response.body}');
      //print('response.statusCode : ${response.statusCode}');
      //print('==========================================');
      int stateCode = response.statusCode;
      print('200 pass');
      Map map5 = Map();
      Map<dynamic, dynamic> map2 = Map();
      var decode = jsonDecode(response.body);

      //print('decode : $decode');
      map2.addAll(decode);
      map5 = {'stateCode': stateCode};
      map2.addAll(map5);
      //print('map2 : $map2');
      signUpResponse = SignupResponse.fromJson(map2);
      //logInResult = LogInResponse.fromJson(jsonDecode(response.body));
      // print('logInResult : ${logInResult.title}');
      // print('logInResult : ${logInResult.message}');
      // print('logInResult : ${logInResult.stateCode}');
    } catch (e) {
      print(e);
    }
    return signUpResponse;
  }
}
