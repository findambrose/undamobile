import 'package:flutter/material.dart';

class SideMenuItem extends StatelessWidget {
  String text;
  IconData iconData;
  Color color, containerColor;
  Function onPressed;
  SideMenuItem({this.color, this.onPressed, this.iconData, this.text, this.containerColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      //  height: 20,
      color: containerColor,
      padding: EdgeInsets.only(left: 10),

      child: Row(
        children: <Widget>[
          FlatButton.icon(
            icon: Icon(
              iconData,
              color: color,
            ),
            label: Text(text),
            color: Colors.transparent,
            textColor: color,
            onPressed: onPressed
          ),
        ],
      ),
    );
  }
}
