import 'package:flutter/material.dart';

import '../../modules/login/loging_screen.dart';
import '../network/local/cache_helper.dart';

void signOut(context){

  CacheHelper.removeData(key: 'token').then((value){
    Navigator.pushAndRemoveUntil(context,
        MaterialPageRoute(builder: (context)=> LogingScreen()),
            (Route<dynamic> route) => false);
  });


}

void printFullText(String text){
  final pattern =  RegExp('.{1,800}');
  pattern.allMatches(text).forEach((match) => print(match.group(0)));
}