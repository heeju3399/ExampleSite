import 'package:shared_preferences/shared_preferences.dart';

class MyShared {

  static void setUserId (String userId) async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    sh.setString('userid', userId);
  }

  static Future<String> getUserId () async {
    String result = 'LogIn';
    SharedPreferences sh = await SharedPreferences.getInstance();
    if(sh.containsKey('userid')){
      if(sh.getString('userid').toString() != '' && sh.getString('userid').toString().isNotEmpty){
        result = sh.getString('userid').toString();
      }
    }
    return result;
  }
}