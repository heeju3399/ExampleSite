// // FutureBuilder(
// // future: Server.fetchPost(),
// // builder: (context, snap) {
// // if (!snap.hasData) {
// // return CircularProgressIndicator();
// // }
// // return Text(snap.data.toString(),style: TextStyle(color: Colors.white),textScaleFactor: 3,);
// // }),
//
// Future<String> fetchPost() async {
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
//     return 'empty';
//     // 만약 응답이 OK가 아니면, 에러를 던집니다.
//     throw Exception('Failed to load post');
//   }
// }

