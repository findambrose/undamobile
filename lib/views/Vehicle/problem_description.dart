import 'package:flutter/material.dart';

class ProblemDescription extends StatefulWidget {
  @override
  _ProblemDescriptionState createState() => _ProblemDescriptionState();
}

class _ProblemDescriptionState extends State<ProblemDescription> {
  TextEditingController _problemController = TextEditingController();

  TextEditingController _locationDescController = TextEditingController();

  Map<String, String> location = {};

  @override
  Widget build(BuildContext context) {
    location =
        location.isEmpty ? ModalRoute.of(context).settings.arguments : location;
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      backgroundColor: Color(0xfff1f1f1),
      appBar: AppBar(
        title: Text('Describe the problem'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              controller: _problemController,
              validator: (value) {
                if (value.isEmpty) {
                  return "Field is required";
                }
              },
              decoration: InputDecoration(
                  labelText: 'Problem description',
                  hintText:
                      'i.e describe the problem you are facing in details'),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _locationDescController,
              validator: (value) {
                if (value.isEmpty) {
                  return "Field is required";
                }
              },
              decoration: InputDecoration(
                  labelText: 'Location description',
                  hintText: 'i.e describe your location precisely'),
            ),
            SizedBox(height: 10),
            RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  _formKey.currentState.save();
                  Map<String, String> problemData = {
                    "problemDescription": _problemController.text,
                    "locationDescription": _locationDescController.text,
                  };
                  Navigator.pushNamed(context, "/addVehicle", arguments: {
                    'location': location,
                    "problemData": problemData
                  });
                }
              },
              color: Colors.green,
              child: Text('Next'),
            )
          ],
        ),
      ),
    );
  }
}
