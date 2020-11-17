

import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
        body: IntroductionScreen(
          done: Text('Finish', style: TextStyle(fontWeight: FontWeight.w600)),
          skip: Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
          
          onDone: (){
            //move to login
            Navigator.pushNamed(context, '/login');
          },
          showNextButton: true,
          showSkipButton: true,
          pages: [
            PageViewModel(
              image: Image.asset('images/illust.jpg', height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width,),
              title: 'Unda' ,
              body: 'Connect to mechanics around you',


            
              decoration: PageDecoration(
                boxDecoration: BoxDecoration(
                 // color: Color(0xfffdfdfd),
                 // image: DecorationImage(image: AssetImage('images/truck.jpg', ))
                )
              )
            ),
           
           PageViewModel(
             image: Image.asset('images/brake.jpg', height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width,),
              title: 'We care' ,
              body: 'Track the repair from within the app',
            
              decoration: PageDecoration(
                boxDecoration: BoxDecoration(
                 // image: DecorationImage(image: AssetImage('images/brake.jpg', ))
                )
              )
            ),
            PageViewModel(
              
              image: Image.asset('images/illust.jpg', height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width,),
              title: 'Ratings' ,
              body: 'Choose from rated mechanics',
            
              decoration: PageDecoration(
                boxDecoration: BoxDecoration(
                 // color: Colors.blueAccent,
              //   image: DecorationImage(image: AssetImage('images/illust.jpg', ))
                )
              )
            ),
           
           
          ],
        ),
        
      ),
    );
  }
}