import 'package:flutter/material.dart';
import 'package:unda/views/widgets/order_history_listtile.dart';

class VehicleOwnerOrderWidget extends StatelessWidget {
  var carModel, date, imageUrl, name, status;
  VehicleOwnerOrderWidget({this.carModel, this.status, this.date, this.imageUrl, this.name});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          OrderHistoryListTile(
            carModel: carModel,
            date: date,
            imageUrl: imageUrl,
            name: name,
            completionStatus: status,
          ),
          SizedBox(height: 10),
          Row(
            //Actions.

            //vehicle owner - cancel. reject supplemental
            children: <Widget>[
              RaisedButton(
                onPressed: () {},
                child: Text('Cancel'),
                color: Colors.red,
              ),
              RaisedButton(
                onPressed: () {},
                child: Text('Accept supplemental request'),
                color: Colors.blue,
              ),
              RaisedButton(
                onPressed: () {},
                child: Text('Reject supplemental request'),
                color: Colors.red,
              ),
               RaisedButton(
                onPressed: () {},
                child: Text('Complete'),
                color: Colors.red,
              ),
            ],
          ),
          SizedBox(height: 10,)
        ],
      ),
    );
  }
}
