import 'package:flutter/material.dart';
import 'package:web/control/login.dart';
import 'package:web/model/myWord.dart';
import 'package:web/model/shared.dart';
import 'package:web/page/mainDash.dart';
import 'package:web/page/user/signup.dart';

class Login extends StatefulWidget {
  const Login({Key? key, required this.userId}) : super(key: key);
  final String userId;

  @override
  _LoginState createState() => _LoginState(userId22: userId);
}

class _LoginState extends State<Login> {
  _LoginState({required this.userId22});

  final String userId22;

  Color btnColor = Colors.blueAccent;
  bool isChecked = false;
  final textFiledIdController = TextEditingController();
  final textFiledPassController = TextEditingController();
  bool logInCircle = true;
  bool overClick = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Center(
            child: SingleChildScrollView(
                child: Container(
                    width: 380,
                    height: 800,
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(50))),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.center, mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                      Padding(padding: const EdgeInsets.all(18.0), child: Text(MyWord.TEST_SITE, textScaleFactor: 2, style: TextStyle(color: Colors.black))),
                      Container(
                          width: 300,
                          child: TextField(
                              controller: textFiledIdController,
                              style: TextStyle(fontSize: 20),
                              decoration: const InputDecoration(
                                  labelText: 'ID',
                                  labelStyle: TextStyle(fontSize: 20),
                                  suffixStyle: TextStyle(fontSize: 20),
                                  hintStyle: TextStyle(fontSize: 20),
                                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)), borderSide: BorderSide(width: 1, color: Colors.redAccent)),
                                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)), borderSide: BorderSide(width: 1, color: Colors.redAccent)),
                                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)))))),
                      Container(
                          width: 300,
                          child: TextField(
                              controller: textFiledPassController,
                              onSubmitted: (v) {
                                _logInOperation(context);
                              },
                              style: TextStyle(fontSize: 20),
                              obscureText: true,
                              decoration: const InputDecoration(
                                  labelText: 'PASS',
                                  labelStyle: TextStyle(fontSize: 20),
                                  suffixStyle: TextStyle(fontSize: 20),
                                  hintStyle: TextStyle(fontSize: 20),
                                  focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)), borderSide: BorderSide(width: 1, color: Colors.redAccent)),
                                  enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)), borderSide: BorderSide(width: 1, color: Colors.redAccent)),
                                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10.0)))))),
                      Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: InkWell(
                              onTap: () {
                                _logInOperation(context);
                              },
                              onHover: (isis) {
                                if (isis) {
                                  btnColor = Colors.green;
                                } else {
                                  btnColor = Colors.blue;
                                }
                                setState(() {});
                              },
                              child: Container(
                                  width: 250,
                                  height: 60,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(color: btnColor, borderRadius: BorderRadius.all(Radius.circular(10))),
                                  child: logInCircle ? Text('LogIn', textScaleFactor: 2, style: TextStyle(color: Colors.white)) : CircularProgressIndicator(backgroundColor: Colors.white)))),
                      Row(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Container(
                            width: 170,
                            child: CheckboxListTile(
                                value: isChecked,
                                onChanged: (v) {
                                  setState(() {
                                    isChecked = v!;
                                  });
                                },
                                title: Text('로그인유지', style: TextStyle(fontSize: 17, color: Colors.black)),
                                controlAffinity: ListTileControlAffinity.leading,
                                activeColor: Colors.red)),
                        Container(
                            width: 170,
                            child: CheckboxListTile(
                                value: isChecked,
                                onChanged: (v) {
                                  setState(() {
                                    isChecked = v!;
                                  });
                                },
                                title: new Text('아이디저장', style: TextStyle(fontSize: 17, color: Colors.black)),
                                controlAffinity: ListTileControlAffinity.leading,
                                activeColor: Colors.red)),
                      ]),
                      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                        Container(
                            width: 120,
                            height: 60,
                            child: TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUp()));
                                },
                                child: Text('회원가입', style: TextStyle(fontSize: 17, color: Colors.black)))),
                        Container(width: 120, height: 60, child: TextButton(onPressed: () {}, child: Text('아이디찾기', style: TextStyle(fontSize: 17, color: Colors.black)))),
                        Container(width: 120, height: 60, child: TextButton(onPressed: () {}, child: Text('비밀번호 찾기', style: TextStyle(fontSize: 17, color: Colors.black))))
                      ]),
                      Divider(),
                      Container(
                          color: Colors.green,
                          height: 50,
                          width: 300,
                          alignment: Alignment.center,
                          child: InkWell(
                              onTap: () {},
                              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                                Spacer(flex: 1),
                                Padding(padding: const EdgeInsets.all(8.0), child: Image.asset('./assets/images/naver.ico')),
                                Spacer(flex: 5),
                                Text('네이버로 로그인', style: TextStyle(color: Colors.white, fontSize: 15)),
                                Spacer(flex: 5)
                              ]))),
                      Container(
                          color: Colors.yellow,
                          height: 50,
                          width: 300,
                          alignment: Alignment.center,
                          child: InkWell(
                              onTap: () {},
                              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                                Spacer(flex: 1),
                                Padding(padding: const EdgeInsets.all(8.0), child: Image.asset('./assets/images/kakao.png')),
                                Spacer(flex: 5),
                                Text('카카오로 로그인', style: TextStyle(color: Colors.black, fontSize: 15)),
                                Spacer(flex: 5)
                              ]))),
                      Container(
                          color: Colors.blue,
                          height: 50,
                          width: 300,
                          alignment: Alignment.center,
                          child: InkWell(
                              onTap: () {},
                              child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                                Spacer(flex: 1),
                                Padding(padding: const EdgeInsets.all(8.0), child: Image.asset('./assets/images/google.png')),
                                Spacer(flex: 5),
                                Text('google로 로그인', style: TextStyle(color: Colors.white, fontSize: 15)),
                                Spacer(flex: 5)
                              ]))),
                      Padding(padding: const EdgeInsets.all(18.0), child: Text('Test Corporate', textScaleFactor: 1, style: TextStyle(color: Colors.black)))
                    ])))));
  }

  void _showDialog(String title, String content) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            elevation: 20,
            shape: ContinuousRectangleBorder(side: BorderSide(color: Colors.blueAccent), borderRadius: BorderRadius.circular(30)),
            title: new Text("$title"),
            content: new Text("$content"),
          );
        });
  }

  void _logInOperation(BuildContext context) async {
    if (overClick) {
      setState(() {
        logInCircle = !logInCircle;
      });
      overClick = false;
      await LoginControl.checkIdAndPass(textFiledIdController.text, textFiledPassController.text).then((map) {
        if (map.isNotEmpty) {
          if (map.values.first == 'pass') {
            String userid = textFiledIdController.text.toString();
            MyShared.setUserId(userid);
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainDash(userId: userid)));
          } else {
            _showDialog(map.values.first, map.values.last);
            textFiledPassController.clear();
          }
          setState(() {
            logInCircle = !logInCircle;
          });
        }
        overClick = true;
      });
    }
  }
}
