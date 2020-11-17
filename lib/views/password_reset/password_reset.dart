import 'package:flutter/material.dart';
import 'package:unda/views/widgets/sidemenu_item.dart';

import '../widgets/service.dart';

class PasswordReset extends StatefulWidget {
  @override
  _PasswordResetState createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1F1F1F),
      appBar: AppBar(
        title: Text('Initiate Password Reset'),
        centerTitle: true,
        leading: Icon(Icons.menu),
        actions: <Widget>[Icon(Icons.search)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Icon(Icons.phone_android, size: 20),
            SizedBox(
              height: 7,
            ),
            Text(
              'To reset your password, enter your phone number and click the "Send OTP" below to get a reset code',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16, decorationStyle: TextDecorationStyle.wavy),
            ),
            SizedBox(
              height: 7,
            ),
            TextFormField(
              decoration: InputDecoration(
                  icon: Icon(Icons.phone),
                  labelText: 'enter phone number',
                  hintText: '0720000000',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: 7,
            ),
            RaisedButton(
              child: Text('Send OTP'),
              onPressed: () {},
              color: Colors.green,
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //     currentIndex: _selectedIndex,
      //     showUnselectedLabels: false,
      //     showSelectedLabels: false,
      //     selectedItemColor: Colors.yellow,
      //     unselectedItemColor: Colors.white,
      //     backgroundColor: Color(0xff22222a),
      //     type: BottomNavigationBarType.fixed,
      //     onTap: _onItemSelect(_selectedIndex),
      //     items: [
      //       BottomNavigationBarItem(
      //           icon: Icon(
      //             Icons.person,
      //           ),
      //           title: Text('Profile')),
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.airline_seat_legroom_normal),
      //           title: Text('Orders')),
      //       BottomNavigationBarItem(
      //           icon: Icon(Icons.account_balance), title: Text('Account')),
      //       BottomNavigationBarItem(
      //           icon: Icon(
      //             Icons.settings,
      //             color: Colors.grey,
      //           ),
      //           title: Text('Settings')),
      //     ]),
    );
  }
}
