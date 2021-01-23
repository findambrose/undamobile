import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:unda/BLoC/LoginBloc.dart';
import 'package:unda/Helpers/AuthHelpers/FirebaseLogin.dart';
import 'package:unda/Data%20Layer/models/POJOs/user.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = new TextEditingController();

  final TextEditingController _passwordController = new TextEditingController();

  final _key = GlobalKey<FormState>();

  LoginBloc _bloc;

  @override
  Widget build(BuildContext context) {
    _bloc = LoginBloc(FirebaseLogin(context: context));
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
          centerTitle: true,
        ),
        backgroundColor: Colors.blue[100],
        body: Container(
          padding: EdgeInsets.only(left: 20, top: 170, right: 20),
          child: SingleChildScrollView(
              child: Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: _emailController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Email address required';
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    hintText: 'e.g ambrose@gmail.com',
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: _passwordController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Email address required';
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'enter your password',
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                RaisedButton(
                  onPressed: () {
                    //check if all fields valid
                    print('About to validate form');
                    FormState _formState = _key.currentState;

                    if (_formState.validate()) {
                      debugPrint('Form validated');
                      //save current state
                      _formState.save();
                      //process user data
                      var userData = {
                        'email': _emailController.text,
                        'password': _passwordController.text
                      };
                      _bloc.mySubject.sink.add(userData);
                      debugPrint("Added to sink");
                    }
                  },
                  child: Text('Login'),
                ),
                SizedBox(height: 10),
                StreamBuilder(
                    stream: _bloc.snapshot,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text(
                          "An error ocurred",
                          style: TextStyle(color: Colors.red),
                        );
                      }
                      if (snapshot.hasData) {
                        //User
                        print("Printing snapshot.......");
                        print(snapshot.data);

                        Map<String, dynamic> mySnapshot = snapshot.data;
                        if (mySnapshot["error"] == "No error") {
                          String role;
                          String id;
                          QuerySnapshot userData = mySnapshot["userData"];
                          userData.docs.forEach((element) {
                            role = element["role"];
                            id = mySnapshot["id"];
                            print(role);
                          });
                          print("User : $userData");
                          _navigateUser(role, context, id);
                          return Text("Success. Redirecting...");
                        } else {
                          return AlertDialog(
                              content: Text(mySnapshot["error"]),
                              actions: [
                                RaisedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("Close"))
                              ]);
                        }
                      }

                      return Container();
                    }),
                Row(
                  children: <Widget>[
                    Expanded(child: Text('Not a member yet?')),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: FlatButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/register');
                      },
                      child: Text('Register'),
                      hoverColor: Colors.green,
                      color: Colors.transparent,
                    ))
                  ],
                )
              ],
            ),
          )),
        ));
  }

  _navigateUser(String role, BuildContext context, String uid) async {
    //wait for 5 secs
    await Future.delayed(Duration(seconds: 5));

    if (role == 'Mechanic') {
      //Move to mechanic homepage with profile info
      Navigator.pushNamed(context, '/profile', arguments: {"uid": uid});
    } else {
      //move to vehicle owner homepage
      Navigator.pushNamed(context, '/home');
    }
  }
}
