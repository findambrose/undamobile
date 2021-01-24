import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:unda/BLoC/VehicleBloc.dart';
import 'package:unda/Data%20Layer/Repositories/VehicleRepo.dart';

class AddVehicle extends StatelessWidget {
  Map<String, dynamic> requestData = {};
  TextEditingController _nameController = TextEditingController();
  TextEditingController _yearController = TextEditingController();
  TextEditingController _modelController = TextEditingController();
  TextEditingController _capacityController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  VehicleBloc _vBloc = VehicleBloc(VehicleRepo());

  var _userUid = FirebaseAuth.instance.currentUser.uid;
  @override
  Widget build(BuildContext context) {
    requestData = requestData.isEmpty
        ? ModalRoute.of(context).settings.arguments
        : requestData;

    return Scaffold(
      appBar: AppBar(
        title: Text("Add Vehicle"),
      ),
      body: Container(
        color: Colors.grey,
        padding: EdgeInsets.all(10),
        child: StreamBuilder<Object>(
            stream: _vBloc.response,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print("Printing Response......");
                //print(snapshot.data);
                //Needs to include vehicle id
                Map<String, dynamic> snapshotData = snapshot.data; 
                DocumentSnapshot savedVehicle = snapshotData["savedVehicle"];
                String vehicleId = savedVehicle.id;

                Map<String, dynamic> addVehiclePageData = {"vehicleId": vehicleId,
                "ownerUid": _userUid,
                "requestData": requestData} ;

                return Column(
                  children: [
                    Text(snapshot.data),
                    SizedBox(height: 15),
                    RaisedButton(
                      onPressed: () {
                        //move to all results with mechanics from that location
                        //AND DETAILS TO REPAIRS COLLECTION
                        //1. vehicle_id
                        //2. vehicle_owner_id
                        //3. location
                        //4. problem description details(problem + location desc)
                        Navigator.pushNamed(context, "/allResults", arguments: addVehiclePageData);

                      },
                      child: Text("Search Available Mechanics"),
                    )
                  ],
                );
              }
              if (snapshot.hasError) {
                return Text("Error adding vehicle. Please retry");
              }
              return Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    
                    Text(
                      'Enter your vehicle details and click add',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    TextFormField(
                      controller: _nameController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Field is required";
                        }
                      },
                      decoration: InputDecoration(
                          labelText: 'Vehicle Name',
                          hintText: 'e.g Toyota Axion',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(height: 5),
                    TextFormField(
                      controller: _modelController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Field is required";
                        }
                      },
                      decoration: InputDecoration(
                          labelText: 'Model',
                          hintText: 'e.g Model number',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(height: 5),
                    TextFormField(
                      controller: _capacityController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Field is required";
                        }
                      },
                      decoration: InputDecoration(
                          labelText: 'Engine Capacity',
                          hintText: 'e.g 1400cc',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(height: 5),
                    TextFormField(
                      controller: _yearController,
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Field is required";
                        }
                      },
                      decoration: InputDecoration(
                          labelText: 'Year',
                          hintText: 'e.g 2018',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10))),
                    ),
                    SizedBox(height: 5),

                    RaisedButton(
                      onPressed: () {
                        print('About to validate form');
                        FormState _formState = _formKey.currentState;

                        if (_formState.validate()) {
                          debugPrint('Form validated');
                          //save current state
                          _formState.save();
                          //process user data
                          var userData = {
                            'name': _nameController.text,
                            'year': _yearController.text,
                            'model': _modelController.text,
                            'capacity': _capacityController.text,
                            'ownerUid': _userUid
                          };
                          _vBloc.subjectBehavior.sink.add(userData);
                          debugPrint("Added to sink");
                        }
                      },
                      child: Text('Add'),
                      color: Colors.green,
                      textColor: Colors.white,
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
