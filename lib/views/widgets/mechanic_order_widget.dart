import 'package:flutter/material.dart';
import 'package:unda/views/widgets/order_history_listtile.dart';

class MechanicOrderWidget extends StatelessWidget {

  var carModel, date, imageUrl, name, status;
  MechanicOrderWidget({this.carModel, this.status, this.date, this.imageUrl, this.name});
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
               status: status,
             ),
             SizedBox(height: 10),
          Row(
            //Actions.
            //mechanic - accept. reject. cancel. request supplemental
            children: <Widget>[
              RaisedButton(
                onPressed: () {},
                child: Text('Accept'),
                color: Colors.green,
              ),
                RaisedButton(
                onPressed: () {},
                child: Text('Reject'),
                color: Colors.red,
              ),
                RaisedButton(
                onPressed: () {},
                child: Text('Cancel'),
                color: Colors.redAccent,
              ),

                RaisedButton(
                onPressed: () {},
                child: Text('Request supplemental'),
                color: Colors.blue,
              ),
            ],
          ),
          SizedBox(height: 10,)
        ],
      ),
    );
  }
}
