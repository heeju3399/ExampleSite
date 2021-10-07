import 'dart:convert';
import 'package:web/control/nodeServer.dart';
import 'package:web/model/login.dart';
import 'package:web/model/shared.dart';

class LoginController {
  static Future<Map> checkIdAndPass(String id, String pass) async {
    String resultTitle = '';
    String resultMessage = '';
    int resultStateCode = 0;
    Map resultMap = Map();

    if (id == '' || id.isEmpty || pass == '' || pass.isEmpty) {
      resultMap = {'title': '빈칸을 채워주세요', 'message': '아이디와 비밀번호를 입력해 주세요'};
    } else {
      await NodeServer.signIn(id, pass).then((value) => {
            resultTitle = value.title,
            resultMessage = value.message,
            resultStateCode = value.stateCode
          });
      print('=============================');
      print('resultTitle : $resultTitle');
      print('resultMessage : $resultMessage');
      print('resultStateCode : $resultStateCode');
      if (resultTitle == 'pass') {
        //로그인 됨

        resultMap = {'title':resultTitle, 'message':resultMessage};
      } else if (resultTitle == 'no') {
        //로근인 안됨
        resultMap = {'title': '회원정보가 없습니다', 'message': '아이디와 비밀번호를 확인해 주세요'};
      }else{
        resultMap = {'title':resultTitle, 'message':resultMessage};
      }
    }
    return resultMap;
  }

}
