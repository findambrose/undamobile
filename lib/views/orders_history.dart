import 'package:flutter/material.dart';
import 'package:unda/views/widgets/sidemenu_item.dart';
import 'package:unda/views/widgets/choose_service_button.dart';
import 'package:unda/views/widgets/order_history_listtile.dart';

import 'widgets/service.dart';

class OrderHistory extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1F1F1F),
      appBar: AppBar(
        title: Text('Completed Orders'),
        centerTitle: true,
        leading: Icon(Icons.menu),
        actions: <Widget>[Icon(Icons.search)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              //List tile with order info
              OrderHistoryListTile(
                imageUrl: 'images/avatar.png',
                name: 'Chris Kyusya',
                carModel: 'Mercedes Benz, Model No',
                date: '21/8/2020',
              ),
               SizedBox(height: 7,),
              OrderHistoryListTile(
                imageUrl: 'images/avatar.png',
                name: 'Henry Kyusya',
                carModel: 'Toyota, Model No',
                date: '21/8/2020',
              ),
               SizedBox(height: 7,),
              OrderHistoryListTile(
                imageUrl: 'images/avatar.png',
                name: 'Dennis Kyusya',
                carModel: 'Toyota, Model No',
                date: '21/8/2020',
              ),
               SizedBox(height: 7,),
              OrderHistoryListTile(
                imageUrl: 'images/avatar.png',
                name: 'Ezekiel Kyusya',
                carModel: 'Toyota, Model No',
                date: '21/8/2020',
              ),
               SizedBox(height: 7,),
              OrderHistoryListTile(
                imageUrl: 'images/avatar.png',
                name: 'Chris Kyusya',
                carModel: 'Mercedes Benz, Model No',
                date: '21/8/2020',
              ),
               SizedBox(height: 7,),
              OrderHistoryListTile(
                imageUrl: 'images/avatar.png',
                name: 'Chris Kyusya',
                carModel: 'Mercedes Benz, Model No',
                date: '21/8/2020',
              ),
               SizedBox(height: 7,),
              OrderHistoryListTile(
                imageUrl: 'images/avatar.png',
                name: 'Chris Kyusya',
                carModel: 'Mercedes Benz, Model No',
                date: '21/8/2020',
              ),
               SizedBox(height: 7,),
              OrderHistoryListTile(
                imageUrl: 'images/avatar.png',
                name: 'Chris Kyusya',
                carModel: 'Mercedes Benz, Model No',
                date: '21/8/2020',
              ),
              SizedBox(height: 7,),
              OrderHistoryListTile(
                imageUrl: 'images/avatar.png',
                name: 'Chris Kyusya',
                carModel: 'Mercedes Benz, Model No',
                date: '21/8/2020',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
