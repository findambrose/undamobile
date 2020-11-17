import 'package:flutter/material.dart';

import 'MyPainter.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            // Container(
            //   //Google Map
            //   decoration: BoxDecoration(
            //     color: Colors.green
            //     // image: DecorationImage(image: AssetImage('images/g-map.jpg'), fit: BoxFit.fill)
            //   ),
            // ),

            Stack(
              children: <Widget>[
                CustomPaint(
                  painter: MyPainter(),
                ),
                //   Container(
                //   //AppBar icons
                //   child: Row(
                //     children: <Widget>[
                //       Text('App bar content')
                //     ],
                //   ),
                // ),
              ],
            ),

            Column(
              //Contains search and listview
              children: <Widget>[],
            )
          ],
        ),
      ),
    );
  }
}
