import 'package:flutter/material.dart';
import 'package:web/model/myWord.dart';
import 'package:web/page/login/login.dart';
import 'package:web/page/login/signup.dart';
import 'package:web/page/mainDash.dart';
import 'package:web/page/windowDash/Content/writhcontent.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TestSite',
      home: const MainDash(userId: MyWord.userId,),
    );
  }
}
