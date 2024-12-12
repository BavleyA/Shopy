import 'package:flutter/material.dart';
import 'package:shop_app/modules/login/loging_screen.dart';
import 'package:shop_app/shared/network/local/cache_helper.dart';
import 'package:shop_app/shared/styles/colors/colors.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: TextButton(
          onPressed: (){
            CacheHelper.removeData(key: 'token').then((value){
              Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (context)=> LogingScreen()),
                  (Route<dynamic> route) => false);
            });
          },
          child: Text(
              'Sign out'.toUpperCase(),
            style: TextStyle(
              color: defaultColor,
              fontWeight: FontWeight.bold,
            ),
          ),

      ),
    );
  }
}
