import 'package:flutter/material.dart';
import 'package:unda/views/widgets/order_history_listtile.dart';

class NotificationsDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
        children: <Widget>[
            OrderHistoryListTile(
              imageUrl: 'images/avatar.png',
              name: 'New Order',
              // Content
              carModel: 'You have a new order from Chris Kyusya',
            ),
            SizedBox(height: 5,),

            OrderHistoryListTile(
              imageUrl: 'images/avatar.png',
              name: 'New Order',
              // Content
              carModel: 'You have a new order from Chris Kyusya',
            ),
            SizedBox(height: 5,),
            OrderHistoryListTile(
              imageUrl: 'images/avatar.png',
              name: 'New Order',
              // Content
              carModel: 'You have a new order from Chris Kyusya',
            ),
            SizedBox(height: 5,),
            OrderHistoryListTile(
              imageUrl: 'images/avatar.png',
              name: 'New Order',
              // Content
              carModel: 'You have a new order from Chris Kyusya',
            ),
            SizedBox(height: 5,),
            OrderHistoryListTile(
              imageUrl: 'images/avatar.png',
              name: 'New Order',
              // Content
              carModel: 'You have a new order from Chris Kyusya',
            ),
            SizedBox(height: 5,),
            OrderHistoryListTile(
              imageUrl: 'images/avatar.png',
              name: 'New Order',
              // Content
              carModel: 'You have a new order from Chris Kyusya',
            ),
        ],
      ),
          ),
    );
  }
}
