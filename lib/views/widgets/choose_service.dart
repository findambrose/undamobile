import 'package:flutter/material.dart';
import 'package:unda/views/widgets/sidemenu_item.dart';
import 'package:unda/views/widgets/choose_service_button.dart';

//import '../vehicle owner/widgets/service.dart';

class ChooseService extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1F1F1F),
      appBar: AppBar(
        title: Text('Choose Service'),
        centerTitle: true,
        leading: Icon(Icons.menu),
        actions: <Widget>[Icon(Icons.search)],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            ChooseServiceButton(
              iconData: Icons.battery_charging_full,
              text: 'Battery',
            ),

            ChooseServiceButton(
              iconData: Icons.card_travel,
              text: 'Engine',
            ),
            ChooseServiceButton(
              iconData: Icons.lightbulb_outline,
              text: 'Lights',
            ),
            ChooseServiceButton(
              iconData: Icons.wifi_tethering,
              text: 'Tires',
            ),
            ChooseServiceButton(
              iconData: Icons.play_arrow,
              text: 'Plating',
            ),
            // SizedBox(height: 5,)
          ],
        ),
      ),
    );
  }
}
