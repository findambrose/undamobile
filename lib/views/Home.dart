import 'package:flutter/material.dart';

import 'MyPainter.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
         child: Container(
          child: Center(child: 
          Column(
            children: [
              Text('Vehicle Owner Home Page'),
              SizedBox(height: 15,),
              RaisedButton(onPressed: (){
                Navigator.pushNamed(context, '/requestInit');
              },
              child: Text("Request Mechanic"),)

            ],
          ),),
        ),

            
      ),
    );
  }
}
