import 'package:flutter/material.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  static String routeName = '/Login';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool aaa = false;
  Color btnColor = Colors.blueAccent;
  bool isChecked = false;
  String textFiledId = '';
  String textFiledPass = '';

  @override
  Widget build(BuildContext context) {
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
                        style: TextStyle(fontSize: 20),
                        decoration: const InputDecoration(
                            labelText: 'ID',
                            labelStyle: TextStyle(fontSize: 20),
                            suffixStyle: TextStyle(fontSize: 20),
                            hintStyle: TextStyle(fontSize: 20),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide:
                                  BorderSide(width: 1, color: Colors.redAccent),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide:
                                  BorderSide(width: 1, color: Colors.redAccent),
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            )
                            //border: OutlineInputBorder(),
                            ))),
                Container(
                    width: 300,
                    child: TextField(
                        style: TextStyle(fontSize: 20),
                        obscureText: true,
                        decoration: const InputDecoration(
                            labelText: 'PASS',
                            labelStyle: TextStyle(fontSize: 20),
                            suffixStyle: TextStyle(fontSize: 20),
                            hintStyle: TextStyle(fontSize: 20),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide:
                                  BorderSide(width: 1, color: Colors.redAccent),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide:
                                  BorderSide(width: 1, color: Colors.redAccent),
                            ),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                            )
                            //border: OutlineInputBorder(),
                            ))),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: InkWell(
                      onTap: () {
                        print('login pass');
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
                          decoration: BoxDecoration(
                              color: btnColor,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                          child: Text(
                            'LogIn',
                            textScaleFactor: 2,
                            style: TextStyle(color: Colors.white),
                          ))),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        width: 170,
                        child: CheckboxListTile(
                          value: isChecked,
                          onChanged: (v) {
                            setState(() {
                              isChecked = v!;
                            });
                          },
                          title: Text('로그인유지',style: TextStyle(fontSize: 17,color: Colors.black),),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Colors.red,
                        )),
                    Container(
                        width: 170,
                        child: CheckboxListTile(
                          value: isChecked,
                          onChanged: (v) {
                            setState(() {
                              isChecked = v!;
                              print('????');
                            });
                          },
                          title: new Text('아이디저장',style: TextStyle(fontSize: 17,color: Colors.black),),
                          controlAffinity: ListTileControlAffinity.leading,
                          activeColor: Colors.red,
                        )),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 120,
                      height: 60,
                      child: TextButton(
                        onPressed: () {},
                        child: Text('회원가입',style: TextStyle(fontSize: 17,color: Colors.black),),
                      ),
                    ),
                    Container(
                      width: 120,
                      height: 60,
                      child: TextButton(
                        onPressed: () {},
                        child: Text('아이디찾기',style: TextStyle(fontSize: 17,color: Colors.black),),
                      ),
                    ),Container(
                      width: 120,
                      height: 60,
                      child: TextButton(
                        onPressed: () {},
                        child: Text('비밀번호 찾기',style: TextStyle(fontSize: 17,color: Colors.black),),
                      ),
                    ),
                  ],
                ),
                Divider(),
                Container(
                  color: Colors.green,
                  height: 50,
                  width: 300,
                  alignment: Alignment.center,
                  child: InkWell(
                    onTap: (){},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Spacer(flex: 1,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset('./images/naver.ico'),
                        ),
                        Spacer(flex: 5,),
                        Text('네이버로 로그인',style: TextStyle(color: Colors.white,fontSize: 15),),
                        Spacer(flex: 5,),
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
                    onTap: (){},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Spacer(flex: 1,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset('./images/kakao.png'),
                        ),
                        Spacer(flex: 5,),
                        Text('카카오로 로그인',style: TextStyle(color: Colors.black,fontSize: 15),),
                        Spacer(flex: 5,),
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
                    onTap: (){},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Spacer(flex: 1,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset('./images/google.png'),
                        ),
                        Spacer(flex: 5,),
                        Text('google로 로그인',style: TextStyle(color: Colors.white,fontSize: 15),),
                        Spacer(flex: 5,),
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
}
