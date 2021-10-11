import 'package:shared_preferences/shared_preferences.dart';

class MyShared {
  static void setUserId(String userId) async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    sh.setString('userid', userId);
  }

  static Future<String> getUserId() async {
    String result = 'LogIn';
    SharedPreferences sh = await SharedPreferences.getInstance();
    if (sh.containsKey('userid')) {
      if (sh.getString('userid').toString() != '' && sh.getString('userid').toString().isNotEmpty) {
        result = sh.getString('userid').toString();
      }
    }
    return result;
  }

  static void setData(String userId) async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    sh.setString('data', userId);
  }

  static Future<String> getDate() async {
    String result = 'data';
    SharedPreferences sh = await SharedPreferences.getInstance();
    if (sh.containsKey('data')) {
      if (sh.getString('data').toString() != '' && sh.getString('data').toString().isNotEmpty) {
        result = sh.getString('data').toString();
      }
    }
    return result;
  }

  static void setIntData(int intData) async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    sh.setInt('data', intData);
  }

  static Future<int> getIntDate() async {
    int result = 0;
    SharedPreferences sh = await SharedPreferences.getInstance();
    if (sh.containsKey('data')) {
      if (sh.getInt('data') != null) {
        result = sh.getInt('data')!.toInt();
      }
    }
    return result;
  }

  static void setContentViewCount({required String name, required List<String> count}) async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    sh.setStringList(name, count);
  }

  static Future<Map> getContentViewCount({required String name}) async {
    Map<String, int> result = Map();
    List<String> list = List<String>.generate(0, (counter) => '');
    int countp = 0;
    SharedPreferences sh = await SharedPreferences.getInstance();
    if (sh.containsKey(name)) {
      if (sh.getStringList(name) != null) {
        sh.getStringList(name)!.forEach((element) {
          String aa = element.toString();
          int bb = int.parse(aa);
          result.addAll({'count$countp': bb});
          countp++;
        });
      }
    }
    return result;
  }
}
