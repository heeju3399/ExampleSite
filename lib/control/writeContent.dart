import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:web/model/login.dart';
import 'package:web/server/nodeServer.dart';

class WriteContentControl {
  static Future<Map> addContent({required String content, required String userId}) async {
    Map resultMap = Map();
    Map valueMap = Map();
    bool result = false;
    if (content == '' || content.isEmpty) {
      resultMap = {'title':'빈칸을 채워주세요', 'message':'하고싶은 말을 적어주세요'};
    } else {
      await NodeServer.setContents(content: content, userId: userId).then((value) => {
        result = value        
      });
      print('============================?? $result =');
      if(result){
        resultMap = {'title':'pass','message':''};
      }else{
        resultMap = {'title':'에러','message':'알수없는 에러'};
      }
    }
    print('return map : $resultMap');
    return resultMap;
  }

  // static void setLikeAndBad({required int flag, required int index}) async {
  //   if(flag == 0){
  //     await NodeServer.setLikeAndBad().then((value) => {
  //
  //     });
  //   }else{
  //
  //   }
  //
  //
  //   Map resultMap = Map();
  //   Map valueMap = Map();
  //   bool result = false;
  //   if (content == '' || content.isEmpty) {
  //     resultMap = {'title':'빈칸을 채워주세요', 'message':'하고싶은 말을 적어주세요'};
  //   } else {
  //
  //     print('============================?? $result =');
  //     if(result){
  //       resultMap = {'title':'pass','message':''};
  //     }else{
  //       resultMap = {'title':'에러','message':'알수없는 에러'};
  //     }
  //   }
  //   print('return map : $resultMap');
  //   return resultMap;
  // }


  static Future<Map> getLikeAndBad({required String content, required String userId}) async {
    Map resultMap = Map();
    Map valueMap = Map();
    bool result = false;
    if (content == '' || content.isEmpty) {
      resultMap = {'title':'빈칸을 채워주세요', 'message':'하고싶은 말을 적어주세요'};
    } else {
      await NodeServer.setContents(content: content, userId: userId).then((value) => {
        result = value
      });
      print('============================?? $result =');
      if(result){
        resultMap = {'title':'pass','message':''};
      }else{
        resultMap = {'title':'에러','message':'알수없는 에러'};
      }
    }
    print('return map : $resultMap');
    return resultMap;
  }



}
