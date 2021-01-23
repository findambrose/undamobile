import 'dart:async';

import 'package:flutter/material.dart';
import 'package:unda/BLoC/RegisterBloc.dart';
import 'package:unda/Helpers/AuthHelpers/FirebaseRegister.dart';
import 'package:unda/Data%20Layer/models/POJOs/user.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //create register bloc instance to feed to child widgets..to use providers later

  var roles = ['Vehicle Owner', 'Mechanic'];
  var counties = ['Nairobi', 'Mombasa', 'Kisumu'];
  RegisterBloc _bloc;

  TextEditingController _fnameController = TextEditingController();
  TextEditingController _lnameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  // final TextEditingController _passwordController = new TextEditingController();

  final _formkey = GlobalKey<FormState>();

  var _activeItemValue = 0;

  var _activeRoleValue = 1;

  StreamController<String> roleStreamController =
      new StreamController<String>.broadcast();

  StreamController<int> locationStreamController =
      new StreamController<int>.broadcast();

  //var _activeTownValue = 1;
  // Map _towns = {
  //   'Mombasa' : ['Malindi', 'Mtwapa', 'Changamwe'],
  //   'Nairobi': ['Madaraka', 'Nairobi West', 'Embakasi'],
  //   'Kisumu': ['Nyakach', 'Bondo', 'Town Area']
  // };

  @override
  Widget build(BuildContext context) {
    _bloc = RegisterBloc(firebaseRegister: FirebaseRegister(context: context));
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        centerTitle: true,
      ),
      backgroundColor: Colors.blue[100],
      body: Container(
        padding: EdgeInsets.only(left: 20, top: 20, right: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your first name';
                    }
                  },
                  controller: _fnameController,
                  decoration: InputDecoration(
                    labelText: 'First Name',
                    hintText: 'e.g Ambrose',
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your last name';
                    }
                  },
                  controller: _lnameController,
                  decoration: InputDecoration(
                    labelText: 'Last Name',
                    hintText: 'e.g Kyusya',
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  children: <Widget>[
                    StreamBuilder(
                        stream: locationStreamController.stream,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            _activeItemValue = snapshot.data;
                          }

                          return DropdownButton(
                            items: [
                              DropdownMenuItem(
                                  child: Text('Select County'), value: 0),
                              DropdownMenuItem(
                                child: Text('Mombasa'),
                                value: 1,
                              ),
                              DropdownMenuItem(
                                child: Text('Nairobi'),
                                value: 2,
                              ),
                              DropdownMenuItem(
                                child: Text('Kisumu'),
                                value: 3,
                              ),
                            ],
                            onChanged: (selectedValue) {
                              locationStreamController.sink.add(selectedValue);
                              // setState(() {
                              //   _activeItemValue = selectedValue;
                              // });
                            },
                            value: _activeItemValue,
                          );
                        }),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please your enter email address';
                    }
                  },
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    hintText: 'e.g ambrose@gmail.com',
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter a password';
                    }
                    if (value.length < 5) {
                      return 'Passwords must be more than \n 4 characters long';
                    }
                  },
                  controller: _passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'enter your password',
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                TextFormField(
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please confirm your password';
                    }
                    if (value != _passwordController.text) {
                      return 'Passwords don\'t match';
                    }
                  },
                  controller: _confirmPasswordController,
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    hintText: 'confirm your password',
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                StreamBuilder(
                  stream: roleStreamController.stream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      _activeRoleValue = snapshot.data;
                    }

                    return DropdownButtonFormField(
                        onSaved: (savedValue) {
                          _activeRoleValue = savedValue;
                        },
                        value: _activeRoleValue, //default value
                        hint: Text('Choose role'),
                        validator: (role) {
                          if (role == null) {
                            return 'Please choose a role';
                          }
                        },
                        onChanged: (selectedValue) {
                          roleStreamController.sink.add(selectedValue);
                        },
                        decoration: InputDecoration(labelText: 'Choose Role'),
                        items: roles.asMap().entries.map((entry) {
                          return DropdownMenuItem(
                              value: entry.key, child: Text(entry.value));
                        }).toList());
                  },
                ),
                SizedBox(
                  height: 5,
                ),
                RaisedButton(
                  onPressed: () {
                    _submitForm();
                  },
                  child: Text('Register'),
                ),
                StreamBuilder(
                    stream: _bloc.registeredUserStream,
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return AlertDialog(
                          actions: [
                            RaisedButton(
                                child: Text("Close"),
                                onPressed: () {
                                  Navigator.pop(context);
                                })
                          ],
                          content: Text("An error occured."),
                        );
                      }

                      if (snapshot.hasData) {
                        Map<String, dynamic> userData = snapshot.data;

                        if (userData["user"] == "Error") {
                          return AlertDialog(
                            content: Text(userData["error"]),
                          );
                        } else {
                          User user = userData["user"];
                          navigateUser(user.role, user.id);
                          return AlertDialog(
                            content: Text(
                                "Hello, ${user.email}, success. Redirecting..."),
                          );
                        }
                      }

                      return Container();
                    }),
                Row(
                  children: <Widget>[
                    Expanded(child: Text('Already a member?')),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                        child: FlatButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: Text('Login'),
                      hoverColor: Colors.green,
                      color: Colors.transparent,
                    ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formkey.currentState.validate()) {
      //1. save current form state
      _formkey.currentState.save();
      Map<String, dynamic> _formData = {
        'role': roles[_activeRoleValue],
        'county': counties[_activeItemValue],
        'firstName': _fnameController.text.toString(),
        'lastName': _lnameController.text.toString(),
        'email': _emailController.text.toString(),
        'password': _confirmPasswordController.text.toString(),
      };
      //2. process formdata
      debugPrint("Message: Form validated");

      _bloc.registerSink.add(_formData);
      //Added to sink
    }
  }

  navigateUser(String role, String id) async {
    //wait for 5 secs
    await Future.delayed(Duration(seconds: 5));

    if (role == 'Mechanic') {
      //Move to mechanic homepage with profile info
      Navigator.pushNamed(context, '/mech-home');
    } else {
      //move to vehicle owner homepage
      Navigator.pushNamed(context, '/home');
    }
  }
}
