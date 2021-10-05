import 'dart:convert';
import 'package:web/control/nodeServer.dart';
import 'package:web/model/login.dart';

class SignUpController {
  static Future<Map> checkIdAndPassAndName({required String id,required String pass,required String name}) async {

    String resultTitle = '';
    String resultMessage = '';
    int resultStateCode = 0;
    Map resultMap = Map();

    if (id == '' || id.isEmpty || pass == '' || pass.isEmpty || name.isEmpty) {
      resultMap = {'title': '빈칸을 채워주세요', 'message': '아이디와 비밀번호, 이름을 입력해 주세요'};
    } else {
      await NodeServer.signUp(id: id, name: name, pass: pass).then((value) => {
        resultTitle = value.title,
        resultMessage = value.message,
        resultStateCode = value.stateCode
      });
      print('=============================');
      print('resultTitle : $resultTitle');
      print('resultMessage : $resultMessage');
      print('resultStateCode : $resultStateCode');
      if (resultTitle == 'doubleCheck') {//회원가입 안됨이유는 아이디 중복
        resultMap = {'title':resultTitle, 'message':resultMessage};
      } else if (resultTitle == 'no') {//회원가입 뭔가모를 에러로 안됨
        resultMap = {'title':resultTitle, 'message':resultMessage};
      }else if(resultTitle == 'pass'){//ok
        resultMap = {'title':resultTitle, 'message':resultMessage};
      }else{

      }
    }

    return resultMap;
  }

  List<Login> parsePhotos(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Login>((json) => Login.fromJson(json)).toList();
  }
}
