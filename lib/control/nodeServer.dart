import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:web/model/login.dart';

class NodeServer {
  static Future<String> fetchPost() async {
    var response;
    Map<String, String> map = Map();
    map = {"userheader": "1234", "uu": "k546565464564564564k"};
    try {
      // response = await http.get(Uri.parse('http://172.30.1.19:3000/'),
      //     headers: {"userheader":"1234","uu":"k546565464564564564k"},);
      response =
          await http.post(Uri.parse('http://172.30.1.19:3000/'), headers: map);
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

  void setUser() async {}

  void getUser() {}

  void setContents() {}

  void getContents() {}

  static Future<LogInResponse> signIn(String id, String pass) async {
    String flag = 'signIn';
    String siteKey = 'secretKey'; //실제 쓰일댄 이렇게 쓰면안됨 파이버 베이스 같은곳에 넣어서 쓰기
    var response;
    LogInResponse logInResult = LogInResponse(stateCode: 000, message: '서버접속불가', title: 'err');
    Map<String, String> map = Map();
    map = {
      "siteKey": '$siteKey',
      "id": '$id',
      "pass": '$pass',
      "flag": '$flag'
    };
    try {
      response = await http.post(Uri.parse('http://localhost:3000/'), headers: map);
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

  void signUp() {
    // String flag = 'signup';
    // var response;
    // Map<String,String> map = Map();
    // map = {"id":'$id',"pass":'$pass',"flag":'$flag'};
    // try {
    //   response = await http.post(Uri.parse('http://localhost:3000/'),headers: map);
    // } catch (e) {
    //   print(e);
    // }
    // print('response.statusCode : ${response.statusCode}');
    // if (response.statusCode == 200) {
    //   print('response : ${response.body}');
    //   String result = response.body.toString();
    //   print('result : $result');
    // } else {
    //
    // }
    // return '';
  }
}
