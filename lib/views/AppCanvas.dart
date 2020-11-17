import 'package:flutter/material.dart';

class AppCanvas extends StatefulWidget {
  @override
  _AppCanvasState createState() => _AppCanvasState();
}

class _AppCanvasState extends State<AppCanvas> {
  
         int _selectedIndex = 0;
         Widget body;
         String text;
_AppCanvasState({this.body, this.text});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1E1E1E),
      appBar: AppBar(
        title: Text(text),
        centerTitle: true,
        leading: Icon(Icons.menu),
        actions: <Widget>[Icon(Icons.search)],
      ),

      //to be set/passed thru constructor
            body: body,

      //same in whole app
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
