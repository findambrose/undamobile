import 'package:flutter/material.dart';

class OrderHistoryListTile extends StatelessWidget {
  var date, imageUrl, name, carModel, status;


  OrderHistoryListTile({this.imageUrl, this.status, this.name, this.carModel, this.date});
  @override
  Widget build(BuildContext context) {
    return ListTile(
                leading: ClipRRect(
                  child: Image.asset(imageUrl),
                  borderRadius: BorderRadius.circular(10),
                ),
                title: Text(name),
                isThreeLine: true,
                subtitle: Text(carModel + ' ' + status),
                trailing: Text(date),
              );
  }
}