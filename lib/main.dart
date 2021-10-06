import 'package:flutter/material.dart';
import 'package:web/page/login/login.dart';
import 'package:web/page/login/signup.dart';
import 'package:web/page/mainDash.dart';
import 'package:web/page/windowDash/Content/writhcontent.dart';

import 'exex/todo.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        MainDash.routeName: (context) => const MainDash(),
        WriteContentMain.routeName: (context) => const WriteContentMain(),
        Login.routeName: (context) => const Login(),
        SignUp.routeName: (context) => const SignUp(),
      },//넘어갈 페이지 넣어놓기
      home: const WriteContentMain(),
    );
  }
}
