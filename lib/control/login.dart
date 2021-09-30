import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:web/control/nodeServer.dart';
import 'package:web/model/login.dart';


class LoginController {

  static bool checkIdAndPass (String id, String pass) {
    bool result = false;
    var parsed;
    List<Login>? loginlist ;
    String rere = '';


    if(id == '' || pass == ''){

    }else if(id.isEmpty || pass.isEmpty){

    }else{
      //패쓰!!아이디와 비밀번호가 회원가입한 번호와 맞는지 확인

      Future signResult = NodeServer.signIn(id,pass);

      print('=============================');
      print(loginlist!.toString());
      result = true;
    }



    return result;
  }

  List<Login> parsePhotos(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Login>((json) => Login.fromJson(json)).toList();
  }




}