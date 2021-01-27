import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:unda/BLoC/RepairRequestBloc.dart';
import 'package:unda/Data%20Layer/Repositories/RepairRepo.dart';
import 'package:unda/views/Vehicle/AddVehicle.dart';

import 'widgets/service.dart';

class MechanicDetailsPage extends StatefulWidget {
  @override
  _MechanicDetailsPageState createState() => _MechanicDetailsPageState();
}

class _MechanicDetailsPageState extends State<MechanicDetailsPage> {
  int _selectedIndex = 0;
  Map<String, dynamic> _repairData;
  RepairRequestBloc _bloc = RepairRequestBloc(RepairRepo());
  Map<String, dynamic> mechanicData = {};

  @override
  Widget build(BuildContext context) {
    mechanicData = mechanicData.isEmpty
        ? ModalRoute.of(context).settings.arguments
        : mechanicData;
    return Scaffold(
      backgroundColor: Color(0xff1E1E1E),
      appBar: AppBar(
        title: Text(mechanicData["name"]),
        centerTitle: true,
        leading: Icon(Icons.menu),
        actions: <Widget>[Icon(Icons.search)],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //Image
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .35,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('images/brake.jpg'), fit: BoxFit.fill)),
            ),

            //The rest
            Container(
              padding: EdgeInsets.only(right: 10, left: 10),
              // height: MediaQuery.of(context).size.height* .65,
              decoration: BoxDecoration(color: Color(0xff1E1E1E)),
              child: StreamBuilder<Object>(
                  stream: _bloc.response,
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text("Unable to send request. Please try again");
                    }

                    if (snapshot.hasData) {
                      return Text(
                          "Request sent. The mechanic will be notified");
                    }

                    

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ListTile(
                          title: Text(mechanicData["name"],
                              style: TextStyle(color: Colors.white)),
                          subtitle: Text(
                            'Madaraka, Nairobi',
                            style: TextStyle(color: Colors.grey),
                          ),
                          trailing: Text(
                            mechanicData["startingPrice"] + ' ' + 'KES',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),

                        Padding(
                          padding: EdgeInsets.only(left: 15, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                '${mechanicData["rating"]} Star Rated',
                                style: TextStyle(color: Colors.white),
                              ),
                              Text(
                                'Open',
                                style: TextStyle(color: Colors.green),
                              )
                            ],
                          ),
                        ),

                        SizedBox(
                          height: 10,
                        ),

                        //Services
                        Padding(
                          padding: const EdgeInsets.only(left: 15.0, right: 15),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Services',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 19),
                              ),
                              Container(
                                height: 3,
                                width: 200,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ),
                        ),

                        SizedBox(height: 7),
                        //Bottom buttons
                        Padding(
                          padding: const EdgeInsets.only(right: 13, left: 13),
                          child: Column(
                            children: <Widget>[
                              Service(
                                iconData: Icons.battery_std,
                                text: 'Battery repair',
                              ),
                              SizedBox(height: 3),
                              Service(
                                iconData: Icons.block,
                                text: 'Broke motor',
                              ),
                              SizedBox(height: 3),
                              Service(
                                iconData: Icons.watch_later,
                                text: 'Tires',
                              ),
                              SizedBox(height: 3),
                              Service(
                                iconData: Icons.fiber_dvr,
                                text: 'Engine repair',
                              ),
                              SizedBox(height: 3),
                              Service(
                                iconData: Icons.filter_2,
                                text: 'Lights & Wiring',
                              ),
                            ],
                          ),
                        ),

                        SizedBox(height: 10),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xff2222a),
                          ),
                          height: 45,
                          padding: EdgeInsets.only(
                              left: 15, right: 15, top: 7, bottom: 7),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              SizedBox(
                                width: 100,
                                height: 45,
                                child: RaisedButton(
                                  color: Colors.green,
                                  textColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  onPressed: () {
                                    //populate repairs collection
                                    //TODO: Populate repairs collection
                                    Map<String, dynamic> requestData =
                                        mechanicData['requestData'];
                                    Map<String, dynamic> problemData =
                                        requestData['problemData'];

                                          String location =
                                        requestData['location']['location'];

                                    String vOwnerUid =
                                        FirebaseAuth.instance.currentUser.uid;
                                    _repairData = {
                                      
                                      "vehicleId": mechanicData["vehicleId"],
                                      "vOwnerUid": vOwnerUid,
                                      "mechnaicUid":
                                          mechanicData["mechanicUid"],
                                      "addressDecsription": problemData["locationDescription"],
                                      "problemDescription": problemData["problemDescription"],
                                      "repairType": ["Engine", "Tyre", "Body"],
                                      "completionStatus": "on",
                                      "location": location,
                                      "acceptanceStatus": "pending",
                                      "supplementaryRepairRequest": "",
                                      "supRepairRequestStatus": "",
                                      "paymentStatus": "unpaid",
                                      "dateCreated": DateTime.now()
                                    };
                                    _bloc.behaviorSubject.sink.add(_repairData);
                                  },
                                  child: Text('Request'),
                                ),
                              ),
                              SizedBox(
                                width: 200,
                                height: 45,
                                child: RaisedButton.icon(
                                  color: Colors.green,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  textColor: Colors.white,
                                  icon: Icon(Icons.phone),
                                  onPressed: () {},
                                  label: Text('Call on phone'),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(height: 10)
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          selectedItemColor: Colors.yellow,
          unselectedItemColor: Colors.white,
          backgroundColor: Color(0xff2222a),
          type: BottomNavigationBarType.fixed,
          onTap: _onItemSelect(_selectedIndex),
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                title: Text('Profile')),
            BottomNavigationBarItem(
                icon: Icon(Icons.airline_seat_legroom_normal),
                title: Text('Orders')),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_balance), title: Text('Account')),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                  color: Colors.grey,
                ),
                title: Text('Settings')),
          ]),
    );
  }

  _onItemSelect(itemSelected) {
    setState(() {
      itemSelected = _selectedIndex;
    });

    switch (itemSelected) {
      case 0:
        //open profile page
        Navigator.pushNamed(context, '/profile');

        break;

      case 1:
        //open respective page
        break;

      case 1:
        //open respective page
        break;
      case 2:
        //open respective page
        break;
      default:
    }
  }
}
