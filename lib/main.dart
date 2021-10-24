import 'package:flutter/material.dart';
import 'package:web/model/myWord.dart';
import 'package:web/model/shared.dart';
import 'package:web/page/mainDash.dart';

void main() async{
  String userId = await MyShared.getUserId();
  runApp(MyApp(userId: userId,));
}

class MyApp extends StatelessWidget {
  MyApp({required this.userId});
  final String userId;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: MyWord.TEST_SITE,
      home: MainDash(userId: this.userId),
    );
  }
}
