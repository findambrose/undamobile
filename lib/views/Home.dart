import 'dart:async';

import 'package:flutter/material.dart';

import 'MyPainter.dart';

class Home extends StatelessWidget {
  int _defaultLocation = 0;
  List<String> counties = ["Nairobi", "Kisumu", "Mombasa"];
  StreamController<int> _locationStreamController = StreamController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              children: [
                Text('Vehicle Owner Home Page'),
                SizedBox(
                  height: 15,
                ),
                RaisedButton(
                  onPressed: () {
                    _onPressNext(context);

                    // Navigator.pushNamed(context, '/requestInit');
                  },
                  child: Text("Request Mechanic"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onPressNext(context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              content: StreamBuilder(
                stream: _locationStreamController.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    _defaultLocation = snapshot.data;
                  }

                  return Form(
                      key: _formKey,
                      child: DropdownButtonFormField(
                          hint: Text("Choose location"),
                          validator: (value) {
                            if (value == null) {
                              return "Please choose your location first";
                            }
                          },
                          value: _defaultLocation,
                          items: counties.asMap().entries.map((e) {
                            return DropdownMenuItem(
                                child: Text(e.value.toString()), value: e.key);
                          }).toList(),
                          onChanged: (value) {
                            _locationStreamController.sink.add(value);
                          }));
                },
              ),
              actions: [
                RaisedButton(
                  onPressed: () {
                    if(_formKey.currentState.validate()){
                          Navigator.pushNamed(context, "/problem",
                        arguments: {"location": counties[_defaultLocation]});
                    }
                    
                  },
                  child: Text("Next"),
                )
              ]);
        });
  }
}
