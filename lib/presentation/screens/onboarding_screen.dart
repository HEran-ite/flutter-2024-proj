import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:hotel_booking/presentation/screens/intro_pages/intro_page_1.dart';
import 'package:hotel_booking/presentation/screens/intro_pages/intro_page_2.dart';
import 'package:hotel_booking/presentation/screens/intro_pages/intro_page_3.dart';


class onBoardingScreen extends StatefulWidget{
  const onBoardingScreen ({Key? key}): super(key:key);
  @override
  _OnBoardingScreenState createState()=> _OnBoardingScreenState();


}

class _OnBoardingScreenState extends State<onBoardingScreen>{
  //controller to keep track of which page we're on
  PageController _controller= PageController();

  // keep track of if we are on the last page or not
  bool onLastPage=false;

  @override
  Widget build(BuildContext){
    return Scaffold(
      body:Stack(
        children:[PageView( 
          controller: _controller,
          onPageChanged: (index){
             setState((){
                   onLastPage=(index==2);
             });
          },
          children: [
          IntroPage1(),
          IntroPage2(),
          IntroPage3()
          ]
          
        ),

        //dot indicator
        Container(
          alignment: Alignment(0,0.75),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            // skip
            GestureDetector(
             onTap: (){
              _controller.jumpToPage(2);
             },
              child: Text('Skip',style: TextStyle(color:Color.fromARGB(255, 95, 65, 65),fontWeight: FontWeight.bold ,fontSize:17))),

           // dot indicator
            



            // next or done
            onLastPage
                ?GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/signup_page');
                  },
                  child: Text('Done',style: TextStyle(color:Color.fromARGB(255, 95, 65, 65),fontWeight: FontWeight.bold ,fontSize:17)))
                  :GestureDetector(
                    onTap:(){
                      _controller.nextPage(duration: Duration(milliseconds: 500), curve: Curves.easeIn);
      
                    },
                    child:Text('Next',style: TextStyle(color:Color.fromARGB(255, 95, 65, 65),fontWeight: FontWeight.bold ,fontSize:17),)
                  )
                ]),

            
            
            )
        ],
      ));
   
  }
}
