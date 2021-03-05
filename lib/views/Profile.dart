import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_admin/firebase_admin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:unda/BLoC/UserProfileBloc.dart';
import 'package:unda/Data%20Layer/models/POJOs/user.dart';
import 'package:unda/Helpers/UserProfile.dart';
import 'package:unda/views/widgets/sidemenu_item.dart';
import 'widgets/service.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int _selectedIndex = 0;
  Stream<QuerySnapshot> _profileInfoStream;
  QuerySnapshot userInfo;

  @override
  void didChangeDependencies() {
    setUpProfile();
    super.didChangeDependencies();
  }

  setUpProfile() {
    UserProfileBloc userProfileBloc = UserProfileBloc(UserProfile());
    userProfileBloc.getSink().add(FirebaseAuth.instance.currentUser.uid);
    _profileInfoStream = userProfileBloc.streamProfileInfo;
  }

  @override
  Widget build(BuildContext context) {
    //if not empty add data from loading page
    // profileInfo = {};
    return StreamBuilder(
      stream: _profileInfoStream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return AlertDialog(
            content: Text("An error occured while loading your profile"),
            actions: [
              RaisedButton(
                  child: Text("Close"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  })
            ],
          );
        }
        if (snapshot.hasData) {
          //show profile page
          userInfo = snapshot.data;
          String location;
          String role;
          userInfo.docs.forEach((element) {
            role = element.data()['role'];
            location = element.data()['county'];
          });
          return Scaffold(
            backgroundColor: Color(0xff1F1F1F),
            appBar: AppBar(
              title: Text('Profile'),
              centerTitle: true,
              leading: Icon(Icons.menu),
              actions: <Widget>[Icon(Icons.search)],
            ),
            body: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  //Right column
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Column(
                      children: <Widget>[
                        //Profile image
                        Column(
                          children: <Widget>[
                            CircleAvatar(
                              backgroundImage: AssetImage('images/avatar.png'),
                              radius: 35,
                            ),
                            SizedBox(height: 7),
                            Text(
                              '',
                              style:
                                  TextStyle(fontSize: 13, color: Colors.white),
                            ),
                            SizedBox(height: 5),
                            Text(
                              location,
                              style:
                                  TextStyle(fontSize: 13, color: Colors.grey),
                            ),
                          ],
                        ),

                        SizedBox(height: 30),

                        //Sidemenu
                        Container(
                          height: 3,
                          color: Color(0xff22222a),
                        ),
                        SideMenuItem(
                          color: Colors.white,
                          //  containerColor: Color(0xff22222a),
                          text: 'Home',
                          iconData: Icons.home,
                          onPressed: () {
                            //TODO: add role based redirects
                            // if(role == 'Mechanic'){

                            // }
                            Navigator.pushNamed(context, '/profile');
                          },
                        ),
                        // Container(height: 3, color: Color(0xff22222a),),

                      
                        // Container(height: 3, width: 100, color: Color(0xff22222a),),
                        SideMenuItem(
                          color: Colors.white,
                          // containerColor: Color(0xff22222a),
                          text: 'Orders',
                          iconData: Icons.shopping_cart,
                          onPressed: () {
                            Navigator.pushNamed(context, '/mechOrders');
                          },
                        ),
                        Container(
                          height: 3,
                          //  width: 100,
                          color: Color(0xff22222a),
                        ),

                       
                        Container(
                          height: 3,
                          // width: 100,
                          color: Color(0xff22222a),
                        ),

                        Container(
                          height: 3,
                          // width: 100,
                          color: Color(0xff22222a),
                        ),

                        SideMenuItem(
                            color: Colors.white,
                            //  containerColor: Color(0xff22222a),
                            text: 'Log Out',
                            iconData: Icons.all_out,
                            onPressed: () {
                              FirebaseAuth.instance.signOut();
                              Navigator.pushNamed(context, '/login');
                            }),
                        Container(
                          height: 3,
                          //width: 100,
                          color: Color(0xff22222a),
                        ),
                      ],
                    ),
                  ),
                ),
                //vertical line. Left line
                Container(
                  width: 3,
                  color: Colors.yellow,
                  height: MediaQuery.of(context).size.height,
                )
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
                currentIndex: _selectedIndex,
                showUnselectedLabels: false,
                showSelectedLabels: false,
                selectedItemColor: Colors.yellow,
                unselectedItemColor: Colors.white,
                backgroundColor: Color(0xff22222a),
                type: BottomNavigationBarType.fixed,
                onTap: _onItemSelect(_selectedIndex, snapshot.data),
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
                      icon: Icon(Icons.notifications),
                      title: Text('Notifications')),
                  BottomNavigationBarItem(
                      icon: Icon(
                        Icons.logout,
                        color: Colors.grey,
                      ),
                      title: Text('Settings')),
                ]),
          );
        }

        return Scaffold(
            body: Container(
          
            child: CircularProgressIndicator(),
           
        ));
      },
    );
  }

  _onItemSelect(int itemSelected, QuerySnapshot snapshot) {
    switch (itemSelected) {
      case 0:
        //    open profile page
       // Navigator.pushNamed(context, '/profile');

        break;

      case 1:
        //open orders based on role. if mechanic move to mechOrders,
        //if vowner, move to vowner orders
        snapshot.docs.forEach((element) {
          // if (element.data()["role"] == 'Mechanic') {
          //   Navigator.pushNamed(context, '/mechOrders');
          // }
          // Navigator.pushNamed(context, '/vOwnerOrders');
        });

        break;

      case 2:
        //open respective page
        //based on role. if mechanic, move mechanic dets
        snapshot.docs.forEach((element) {
          if (element.data()["role"] == 'Mechanic') {
            Navigator.pushNamed(context, '/mechDetails');
          }
          Navigator.pushNamed(context, '/vOwnerOrders');
        });

        break;
      case 3:
        FirebaseAuth.instance.signOut();
        Navigator.pushNamed(context, '/login');
        break;
      default:
    }
  }

  // Future<Widget> _setUpExtraMechanicInfo() async {
  //   await Future.delayed(Duration(seconds: 6));
  //   return AlertDialog(
  //     content: Column(
  //       children: [
  //         Text(
  //           "Complete profile setup to start getting orders",
  //           style: TextStyle(fontWeight: FontWeight.bold),
  //         ),
  //         SizedBox(height: 10),
  //         RaisedButton(
  //           child: Text("Complete"),
  //           onPressed: () {
  //             Navigator.pushNamed(context, '/updateProfile');
  //           },
  //         )
  //       ],
  //     ),
  //   );
  // }
}
