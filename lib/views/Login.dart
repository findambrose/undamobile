import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(title: Text('Login'), centerTitle: true,),
    backgroundColor: Colors.blue[100],
     body: Container(
       padding: EdgeInsets.only(left: 20, top: 170, right: 20),
       child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
           children: <Widget>[
             TextFormField(
               controller: _emailController,
               decoration: InputDecoration(
                 labelText: 'Phone number',
                 hintText: 'e.g 072300000',
               ),
             ),
             SizedBox(
               height: 25,
             ),
              TextFormField(
               controller:_passwordController,
               decoration: InputDecoration(
                 labelText: 'Password',
                 hintText: 'enter your password',
               ),
             ),
              SizedBox(
               height: 25,
             ),
             RaisedButton(onPressed: (){},
             child: Text('Login'),),
             SizedBox(height:10),
             Row(
               children: <Widget>[
                 Expanded(child: Text('Not a member yet?')),
                 SizedBox(width: 10,),
                 Expanded(child: FlatButton(onPressed: (){
                   Navigator.pushNamed(context, '/register');
                 }, child: Text('Register'), hoverColor: Colors.green,
                 color: Colors.transparent,))
               ],
             )

           ],
         ),
       ),
     )

    );
  }
}