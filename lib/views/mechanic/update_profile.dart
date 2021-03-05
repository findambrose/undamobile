import 'package:flutter/material.dart';
import 'package:unda/BLoC/UpdateProfileBloc.dart';
import 'package:unda/Data%20Layer/Repositories/MechanicRepo.dart';

class UpdateProfile extends StatefulWidget {
  @override
  _UpdateProfileState createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile> {
  TextEditingController _phoneController = TextEditingController();
UpdateProfileBloc _bloc = UpdateProfileBloc(MechanicRepo());
  bool engine = false;
  bool body = false;
  bool tires =false;
   bool lights = false;

  final _formKey = GlobalKey<FormState>();
  List<String> _selectedItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Profile'),
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: StreamBuilder<Object>(
          stream: _bloc.response,
          builder: (context, snapshot) {

if(snapshot.hasData){
  return Text(snapshot.data.toString());
}
if(snapshot.hasError){
  return Text("An error occured");
}




            return Column(
              children: [
                SingleChildScrollView(),
                Text(
                  'Complete setting up your profile to get started',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Choose your specialization',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                CheckboxListTile(
                    title: Text("Engine"),
                    activeColor: Colors.orange,
                    checkColor: Colors.blue,
                    value: engine,
                    onChanged: (value) {
                      setState(() {
                        if (engine) {
                          _selectedItems.add("Engine");
                        }

                        engine = value;
                      });
                    }),
                SizedBox(height: 5),
                CheckboxListTile(
                    title: Text("Body"),
                    activeColor: Colors.orange,
                    checkColor: Colors.blue,
                    value: body,
                    onChanged: (value) {
                      setState(() {
                        if (body) {
                          _selectedItems.add("Body");
                        }

                        body = value;
                      });
                    }),
                SizedBox(height: 5),
                CheckboxListTile(
                    title: Text("Tires"),
                    activeColor: Colors.orange,
                    checkColor: Colors.blue,
                    value: tires,
                    onChanged: (value) {
                      setState(() {
                        if (tires) {
                          _selectedItems.add("Tires");
                        }

                        tires = value;
                      });
                    }),
                SizedBox(height: 5),
                CheckboxListTile(
                    title: Text("Lights & Wiring"),
                    activeColor: Colors.orange,
                    checkColor: Colors.blue,
                    value: lights,
                    onChanged: (value) {
                      setState(() {
                        if (lights) {
                          _selectedItems.add("Lights & Wiring");
                        }

                        lights = value;
                      });
                    }),
                SizedBox(height: 10),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _phoneController,
                        validator: (value) {
                          if (value.isEmpty) {
                            return "Field is required";
                          }
                        },
                        decoration: InputDecoration(
                          labelText: "Phone Number",
                        ),
                      ),
                      SizedBox(height: 10),
                      RaisedButton(
                        child: Text('Update', style: TextStyle(
                          color: Colors.green
                        ),),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            Map<String, dynamic> profileInfo = {
                              "phone": _phoneController.text,
                              "specialization": _selectedItems
                            };

                            _bloc.behaviorSubject.sink.add(profileInfo);
                          }

                          
                        },
                      )
                    ],
                  ),
                )
              ],
            );
          }
        ),
      ),
    );
  }
}
