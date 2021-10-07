import 'dart:convert';
import 'package:web/control/nodeServer.dart';
import 'package:web/model/login.dart';

class WriteContent {
  static Future<Map> addContent({required String content, required String userId}) async {
    bool check = false;
    Map resultMap = Map();
    if (content == '' || content.isEmpty) {
      resultMap = {'title':'빈칸을 채워주세요', 'message':'하고싶은 말을 적어주세요'};
    } else {
      await NodeServer.setContents(content: content, userId: userId).then((value) => {
        check = value
      });
      print('=============================');
      print('check : $check');
      resultMap = {'title':'pass','message':''};
    }
    return resultMap;
  }

  List<Login> parsePhotos(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Login>((json) => Login.fromJson(json)).toList();
  }
}
