import 'package:flutter/material.dart';
import 'package:unda/BLoC/MechanicOrdersBloc.dart';
import 'package:unda/Data%20Layer/Repositories/RepairRepo.dart';
import 'package:unda/Data%20Layer/models/POJOs/repair.dart';
import 'package:unda/views/widgets/sidemenu_item.dart';
import 'package:unda/views/widgets/choose_service_button.dart';
import 'package:unda/views/widgets/mechanic_order_widget.dart';
import 'package:unda/views/widgets/order_history_listtile.dart';
import 'package:unda/views/widgets/vehicle_owner_order_widget.dart';

//import 'widgets/service.dart';

class MechanicOrdersList extends StatelessWidget {

 MechanicOrdersBloc _bloc;
  @override
  Widget build(BuildContext context) {

    _bloc = MechanicOrdersBloc(RepairRepo());
    return Scaffold(
      backgroundColor: Color(0xff1F1F1F),
      appBar: AppBar(
        title: Text('Orders'),
        centerTitle: true,
        leading: Icon(Icons.menu),
        actions: <Widget>[Icon(Icons.search)],
      ),
      body: StreamBuilder<Object>(

        
        stream: _bloc.repairsList,
        builder: (context, snapshot) {

if (snapshot.hasData) {
  List<Repair> repairsList = snapshot.data;
   return Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                children:
                  repairsList.asMap().entries.map((e) {
                 
                   
                  return MechanicOrderWidget(
                    name: e.value.mechanicsName,
                    imageUrl: 'images/avatar.png',
                    date: '12/10/2020',
                    carModel: e.value.vehicleModel,
                    acceptanceStatus: e.value.acceptanceStatus,
                    completionStatus: e.value.completionStatus
                  );

                  }).toList() 

                 
              ),
            ),
          );
}
if (snapshot.error) {
  return AlertDialog(
    content: Text("An error occured. Pls try again"),
  );
}
return Center(child: CircularProgressIndicator(),);

         
        }
      ),
    );
  }
}
