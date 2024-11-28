import 'package:flutter/material.dart';
import 'package:shop_app/modules/login/loging_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../shared/styles/colors/colors.dart';

class BoardingModel{

  final String img;
  final String title;
  final String body;

  BoardingModel({
    required this.img,
    required this.title,
    required this.body,
});
}

class OnBoardingScreen extends StatefulWidget {

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var boardController = PageController();

  List<BoardingModel> Boarding =[
    BoardingModel(
        img: 'assets/images/On_Boarding.png',
        title: 'On Board 1 title',
        body: 'On Board 1 body'
    ),
    BoardingModel(
        img: 'assets/images/onboard2.png',
        title: 'On Board 2 title',
        body: 'On Board 2 body'
    ),
    BoardingModel(
        img: 'assets/images/onboard3.png',
        title: 'On Board 3 title',
        body: 'On Board 3 body'
    ),
  ];

  bool isLast = false ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [

        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: boardController,
                  onPageChanged: (int index){
                  if(index == Boarding.length-1 ){
                    setState(() {
                      isLast= true;
                    });
                  }
                  else{
                    setState(() {
                      isLast = false;
                    });
                  }
                  },
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context,index) => BuildOnBoardingItem(Boarding[index]),
                itemCount: Boarding.length,
              ),
            ),
            SizedBox(height: 40.0,),
            Row(
              children: [
                SmoothPageIndicator(
                    controller: boardController,
                    count: Boarding.length,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    dotHeight: 10,
                    dotWidth: 10,
                    spacing: 5,
                    expansionFactor: 4,
                    activeDotColor: defaultColor,
                  ),
                ),
                Spacer(),
                FloatingActionButton(
                    onPressed: (){
                      if(isLast){
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context)=> LogingScreen()),
                            (Route<dynamic> route)=> false,
                        );
                      }
                      else{
                        boardController.nextPage(
                          duration: Duration(
                            milliseconds: 750,
                          ),
                          curve: Curves.fastLinearToSlowEaseIn,
                        );
                      }
                    },
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                ),

              ],
            )
          ],
        ),
      ),

    );
  }

  Widget BuildOnBoardingItem(BoardingModel model) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child: Image(
            image: AssetImage('${model.img}')
        ),
      ),
      SizedBox(height: 30,),
      Text(
        '${model.title}',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24.0,
        ),
      ),
      SizedBox(height: 15,),
      Text(
        '${model.body}',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14.0,
        ),
      ),
      SizedBox(height: 40,),
    ],
  );
}
