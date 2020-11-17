import 'package:flutter/material.dart';

class ProblemDescription extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff1f1f1),
      appBar: AppBar(
        title: Text('Describe the problem'),
        centerTitle: true,
      ),

      body: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              
              labelText: 'Problem description',

              hintText: 'i.e describe the problem you are facing in details'),
          ),

          SizedBox(height: 10),

          TextFormField(
            decoration: InputDecoration(
              
              labelText: 'Location description',

              hintText: 'i.e describe your location precisely'),
          ),
          SizedBox(height: 10),

          RaisedButton(onPressed: 
          (){},
          color: Colors.green,
          child: Text('Send request'),)

        ],
      ),
      
    );
  }
}