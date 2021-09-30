import 'package:http/http.dart' as http;


class Server {

  static Future<String> fetchPost() async {
    var response;
    Map<String,String> map = Map();
    map = {"userheader":"1234","uu":"k546565464564564564k"};
    try {
      // response = await http.get(Uri.parse('http://172.30.1.19:3000/'),
      //     headers: {"userheader":"1234","uu":"k546565464564564564k"},);
      response = await http.post(Uri.parse('http://172.30.1.19:3000/'),
        headers: map);

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

  void setUser () async {

  }

  void getUser(){

  }

  void setContents(){}

  void getContents(){}



}