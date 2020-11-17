import 'package:flutter/material.dart';

import 'MyPainter.dart';

class Painter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
        body:  CustomPaint(
                    painter: MyPainter(),
                    
                  ),
      ),
    );
  }
}
