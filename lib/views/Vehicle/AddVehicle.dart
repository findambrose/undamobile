import 'package:flutter/material.dart';

class AddVehicle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      padding: EdgeInsets.all(10),
          child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          //redirect to problem description page
          Text(
            'Enter your vehicle details and click add',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),

          TextFormField(
            
            decoration: InputDecoration(
             labelText: 'Vehicle Name',
             hintText: 'e.g Toyota Axion',
             
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
            )
            ),
          ),
          SizedBox(height: 5),
          TextFormField(
            
            decoration: InputDecoration(
             labelText: 'Model',
             hintText: 'e.g Model number',
             
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
            )
            ),
          ),
          SizedBox(height: 5),
          TextFormField(
            
            decoration: InputDecoration(
             labelText: 'Engine Capacity',
             hintText: 'e.g 1400cc',
             
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
            )
            ),
          ),
          SizedBox(height: 5),
           TextFormField(
            
            decoration: InputDecoration(
             labelText: 'Year',
             hintText: 'e.g 2018',
             
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10)
            )
            ),
          ),
          SizedBox(height: 5),

          RaisedButton(onPressed: (){}, child: Text('Add'),
          color: Colors.green,
          textColor: Colors.white,
          )


          
        ],
      ),
    );
  }
}
