import 'package:flutter/material.dart';


class ChooseServiceButton extends StatelessWidget {

  final String text;
  final IconData iconData;
  ChooseServiceButton({this.text, this.iconData});
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
              
              child: Row(
                children: [
                  Text(text),
                  SizedBox(width: 10),
                  Icon(iconData),
                ]
              ),
              onPressed: () {},
              color: Colors.green,
            );
  }
}