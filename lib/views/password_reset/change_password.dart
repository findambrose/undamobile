import 'package:flutter/material.dart';
import 'package:unda/views/widgets/sidemenu_item.dart';

import '../widgets/service.dart';

class PasswordReset extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1F1F1F),
      appBar: AppBar(
        title: Text('Change Password'),
        centerTitle: true,
        leading: Icon(Icons.menu),
        actions: <Widget>[Icon(Icons.search)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
          
            
            TextFormField(
              decoration: InputDecoration(
                  icon: Icon(Icons.phone),
                  labelText: 'enter password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: 5,
            ),
            TextFormField(
              decoration: InputDecoration(
                  //icon: Icon(Icons.phone),
                  labelText: 'confirm password',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: 7,
            ),
            RaisedButton(
              child: Text('Submit'),
              onPressed: () {},
              color: Colors.green,
            ),
          ],
        ),
      ),
      
    );
  }
}
