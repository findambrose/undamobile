import 'package:flutter/material.dart';
import 'package:unda/views/widgets/sidemenu_item.dart';
import 'package:unda/views/widgets/choose_service_button.dart';
import 'package:unda/views/widgets/mechanic_order_widget.dart';
import 'package:unda/views/widgets/order_history_listtile.dart';
import 'package:unda/views/widgets/vehicle_owner_order_widget.dart';

//import 'widgets/service.dart';

class MechanicOrdersList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1F1F1F),
      appBar: AppBar(
        title: Text('Orders'),
        centerTitle: true,
        leading: Icon(Icons.menu),
        actions: <Widget>[Icon(Icons.search)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              MechanicOrderWidget(
                name: 'Ezekiel Mbiti',
                imageUrl: 'images/avatar.png',
                date: '12/10/2020',
                carModel: 'Toyota Axion',
                status: 'Active',
              ),
              MechanicOrderWidget(
                name: 'Ezekiel Mbiti',
                imageUrl: 'images/avatar.png',
                date: '12/10/2020',
                carModel: 'Toyota Axion',
                status: 'Pending',
              ),
              MechanicOrderWidget(
                name: 'Ezekiel Mbiti',
                imageUrl: 'images/avatar.png',
                date: '12/10/2020',
                carModel: 'Toyota Axion',
                status: 'Active',
              ),
              MechanicOrderWidget(
                name: 'Ezekiel Mbiti',
                imageUrl: 'images/avatar.png',
                date: '12/10/2020',
                carModel: 'Toyota Axion',
                status: 'Active',
              ),
              MechanicOrderWidget(
                name: 'Ezekiel Mbiti',
                imageUrl: 'images/avatar.png',
                date: '12/10/2020',
                carModel: 'Toyota Axion',
                status: 'Pending',
              ),
              MechanicOrderWidget(
                name: 'Ezekiel Mbiti',
                imageUrl: 'images/avatar.png',
                date: '12/10/2020',
                carModel: 'Toyota Axion',
                status: 'Pending',
              ),
              MechanicOrderWidget(
                name: 'Ezekiel Mbiti',
                imageUrl: 'images/avatar.png',
                date: '12/10/2020',
                carModel: 'Toyota Axion',
                status: 'Pending',
              )
            ],
          ),
        ),
      ),
    );
  }
}
