import 'package:flutter/material.dart';

class Service extends StatelessWidget {
  final IconData iconData;
  final String text;
  final Color color;

  Service({
    this.iconData, this.text, this.color
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(iconData,color: Colors.grey),
        SizedBox(width: 10),
        Text(text, style:  TextStyle(color: Colors.white),)
      ],
    );
  }
}