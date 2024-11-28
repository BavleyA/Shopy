import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
              image: AssetImage('assets/images/On_Boarding.png')
          ),
          SizedBox(height: 30,),
          Text(
            'Screen Title',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24.0,
            ),
          ),
          SizedBox(height: 15,),
          Text(
            'Screen Body',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14.0,
            ),
          ),
          //PageView.builder(itemBuilder: (context,index) => )
        ],
      ),
    );
  }
}
