import 'dart:convert';
import 'package:web/control/nodeServer.dart';
import 'package:web/model/login.dart';

class WriteContent {
  static Future<Map> addContent({required String content}) async {

    String resultTitle = '';
    String resultMessage = '';
    int resultStateCode = 0;
    Map resultMap = Map();

    if (content == '' || content.isEmpty) {
      resultMap = {'title': '빈칸을 채워주세요', 'message': '하고싶은 말을 적어주세요'};
    } else {
      // await NodeServer.setContents(content).then((value) => {
      //   resultTitle = value.title,
      //   resultMessage = value.message,
      //   resultStateCode = value.stateCode
      // });
      print('=============================');
      print('resultTitle : $resultTitle');
      print('resultMessage : $resultMessage');
      print('resultStateCode : $resultStateCode');
      if (resultTitle == 'doubleCheck') {
        resultMap = {'title':resultTitle, 'message':resultMessage};
      } else if (resultTitle == 'no') {
        resultMap = {'title':resultTitle, 'message':resultMessage};
      }else if(resultTitle == 'pass'){
        resultMap = {'title':resultTitle, 'message':resultMessage};
      }else{
        resultMap = {'title':resultTitle, 'message':resultMessage};
      }
    }

    return resultMap;
  }

  List<Login> parsePhotos(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Login>((json) => Login.fromJson(json)).toList();
  }
}
