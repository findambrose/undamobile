import 'package:firebase_auth/firebase_auth.dart';
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

class MechanicOrdersList extends StatefulWidget {
  @override
  _MechanicOrdersListState createState() => _MechanicOrdersListState();
}

class _MechanicOrdersListState extends State<MechanicOrdersList> {
  MechanicOrdersBloc _bloc;
   Stream<List<Repair>> _repairList;

   @override
  void didChangeDependencies() {
    setUpProfile();
    super.didChangeDependencies();
  }
  setUpProfile() {
    MechanicOrdersBloc _bloc = MechanicOrdersBloc(RepairRepo());
    _bloc.behaviorSubject.sink.add(FirebaseAuth.instance.currentUser.uid);
    _repairList = _bloc.repairsList;
  }

  @override
  Widget build(BuildContext context) {
    _bloc = MechanicOrdersBloc(RepairRepo());
    return Scaffold(
     // backgroundColor: ,
      appBar: AppBar(
        title: Text('Orders'),
        centerTitle: true,
        leading: Icon(Icons.menu),
        actions: <Widget>[Icon(Icons.search)],
      ),
      body: StreamBuilder(
          stream: _repairList,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Repair> repairsList = snapshot.data;
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: SingleChildScrollView(
                  child: Column(
                      children: repairsList.asMap().entries.map((e) {
                    return MechanicOrderWidget(
                        name: e.value.vehicleId,
                        imageUrl: 'images/avatar.png',
                        date: '1/28/2021',
                        carModel: "",
                        acceptanceStatus: "Pending",
                        completionStatus: e.value.completionStatus);
                  }).toList()),
                ),
              );
            }
            if (snapshot.hasError) {
              return AlertDialog(
                content: Text("An error occured. Pls try again"),
              );
            }
              return Center(
            child: CircularProgressIndicator(),
            );
          }),
    );
  }
}
