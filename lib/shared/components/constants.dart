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