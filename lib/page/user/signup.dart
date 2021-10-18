import 'package:flutter/material.dart';
import 'package:web/control/signUp.dart';
import 'package:web/page/mainDash.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);
  static String routeName = '/SignUp';

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool aaa = false;
  Color btnColor = Colors.blueAccent;
  bool isChecked = false;
  final textFiledIdController = TextEditingController();
  final textFiledPassController = TextEditingController();
  final textFiledNameController = TextEditingController();
  bool signUpCircle = true;

  @override
  Widget build(BuildContext context) {
    print('signUp build Widget Pass');
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 380,
            height: 800,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(50)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    'Test Site',
                    textScaleFactor: 2,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
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
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(width: 1, color: Colors.redAccent),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(width: 1, color: Colors.redAccent),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            )
                            //border: OutlineInputBorder(),
                            ))),
                Container(
                    width: 300,
                    child: TextField(
                        controller: textFiledPassController,
                        style: TextStyle(fontSize: 20),
                        obscureText: true,
                        decoration: const InputDecoration(
                            labelText: 'PASS',
                            labelStyle: TextStyle(fontSize: 20),
                            suffixStyle: TextStyle(fontSize: 20),
                            hintStyle: TextStyle(fontSize: 20),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(width: 1, color: Colors.redAccent),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(width: 1, color: Colors.redAccent),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            )
                            //border: OutlineInputBorder(),
                            ))),
                Container(
                    width: 300,
                    child: TextField(
                        controller: textFiledNameController,
                        onSubmitted: (v) {
                          _signUpOperation(context);
                        },
                        style: TextStyle(fontSize: 20),
                        decoration: const InputDecoration(
                            labelText: 'Name',
                            labelStyle: TextStyle(fontSize: 20),
                            suffixStyle: TextStyle(fontSize: 20),
                            hintStyle: TextStyle(fontSize: 20),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(width: 1, color: Colors.redAccent),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(width: 1, color: Colors.redAccent),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            )
                            //border: OutlineInputBorder(),
                            ))),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: InkWell(
                      onTap: () {
                        //아이디 패스워드 가져오기

                        _signUpOperation(context);
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
                          child: signUpCircle
                              ? Text(
                                  '회원가입',
                                  textScaleFactor: 2,
                                  style: TextStyle(color: Colors.white),
                                )
                              : CircularProgressIndicator(
                                  backgroundColor: Colors.white,
                                ))),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 120,
                      height: 60,
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          '로그인',
                          style: TextStyle(fontSize: 17, color: Colors.black),
                        ),
                      ),
                    ),
                    Container(
                      width: 120,
                      height: 60,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          '아이디찾기',
                          style: TextStyle(fontSize: 17, color: Colors.black),
                        ),
                      ),
                    ),
                    Container(
                      width: 120,
                      height: 60,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          '비밀번호 찾기',
                          style: TextStyle(fontSize: 17, color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      color: Colors.black,
                      width: 120,
                      height: 1,
                    ),
                    Text(
                      '간편회원가입',
                      style: TextStyle(color: Colors.black, fontSize: 15),
                    ),
                    Container(
                      color: Colors.black,
                      width: 120,
                      height: 1,
                    ),
                  ],
                )),
                Container(
                  color: Colors.green,
                  height: 50,
                  width: 300,
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Spacer(
                          flex: 1,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset('./images/naver.ico'),
                        ),
                        Spacer(
                          flex: 5,
                        ),
                        Text(
                          '네이버로 회원가입',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        Spacer(
                          flex: 5,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.yellow,
                  height: 50,
                  width: 300,
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Spacer(
                          flex: 1,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset('./images/kakao.png'),
                        ),
                        Spacer(
                          flex: 5,
                        ),
                        Text(
                          '카카오로 회원가입',
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                        Spacer(
                          flex: 5,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  color: Colors.blue,
                  height: 50,
                  width: 300,
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Spacer(
                          flex: 1,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset('./images/google.png'),
                        ),
                        Spacer(
                          flex: 5,
                        ),
                        Text(
                          'google로 회원가입',
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                        Spacer(
                          flex: 5,
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    'Test Corporate',
                    textScaleFactor: 1,
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
      },
    );
  }

  bool overClick = true;
  String userid = '';
  void _signUpOperation(BuildContext context) async {
    if (overClick) {
      setState(() {
        signUpCircle = !signUpCircle;
      });
      overClick = false;
      userid = textFiledIdController.text;
      await SignUpController.checkIdAndPassAndName(pass: textFiledPassController.text, name: textFiledNameController.text, id: textFiledIdController.text).then((map) {
        print(' map ??????? $map');
        if (map.isNotEmpty) {
          if (map.values.first == 'pass') {
            //넘기기
            print('회원가입 ok');
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => MainDash(userId: userid)));

            textFiledIdController.clear();
            textFiledPassController.clear();
            textFiledNameController.clear();
            setState(() {
              signUpCircle = !signUpCircle;
            });
          } else {
            _showDialog(map.values.first, map.values.last);
            setState(() {
              signUpCircle = !signUpCircle;
            });
            //textFiledPassController.clear();
            //textFiledNameController.clear();
          }
        }

        overClick = true;
      });
    }
  }
}
