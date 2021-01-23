import 'package:flutter/material.dart';


class SomeErrorOcurred extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text(
            'An error occured loading firebase'
          ),
        )
      ),   
    );
  }
}