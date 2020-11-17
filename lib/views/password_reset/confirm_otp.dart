import 'package:flutter/material.dart';
import 'package:unda/views/widgets/sidemenu_item.dart';

import '../widgets/service.dart';

class PasswordReset extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1F1F1F),
      appBar: AppBar(
        title: Text('Confirm OTP'),
        centerTitle: true,
        leading: Icon(Icons.menu),
        actions: <Widget>[Icon(Icons.search)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Icon(Icons.phone_android, size: 20, color: Colors.yellow,),
            SizedBox(
              height: 7,
            ),
            Text(
              'A 4 digit number has been sent to 072000000. Please enter the 4 digit number and press "Done" to reset your account password.' ,
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
                  labelText: 'enter 4 digit number',
                  hintText: '0 0 0 0',

                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(
              height: 2,
            ),

            Row(
              children: <Widget>[
                Text('Didn\'t get a code? Click resend'),
                SizedBox(width: 10),
                FlatButton(onPressed: (){}, color: Colors.transparent, child:  Text('Resend'))
              ],
            ),
            SizedBox(
              height: 7,
            ),
            RaisedButton(
              child: Text('Done'),
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
