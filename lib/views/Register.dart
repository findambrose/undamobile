import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _emailController = new TextEditingController();

  final TextEditingController _passwordController = new TextEditingController();

  var _activeItemValue = 0;

  var _activeRoleValue = 1;
  var _activeTownValue = 1;
  Map _towns = {
    'Mombasa' : ['Malindi', 'Mtwapa', 'Changamwe'],
    'Nairobi': ['Madaraka', 'Nairobi West', 'Embakasi'],
    'Kisumu': ['Nyakach', 'Bondo', 'Town Area']
  };

  //  _selectTown(selectedCounty){
    
  //     switch (selectedCounty) {
  //     case '1': 
  //      _towns['Mombasa'].asMap().entries.map((town){
  //       return DropdownMenuItem(child: Text(town), value: town.key+1,);
        
  //      });
  //       break;
  //     case '2': 
  //      _towns['Nairobi'].asMap().entries.map((town){
  //        return DropdownMenuItem(child: Text(town), value: town.key+1,);
  //      });
  //       break;
  //       case '3':

  //       _towns['Kisumu'].asMap().entries.map((town){
  //        return DropdownMenuItem(child: Text(town), value: town.key+1,);
  //      });
  //       break;
      
  //   }
  //   return;
    
  
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(title: Text('Register'), centerTitle: true,),
    backgroundColor: Colors.blue[100],
     body: Container(
       padding: EdgeInsets.only(left: 20, top: 20, right: 20),
       child: SingleChildScrollView(
                child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
           children: <Widget>[
               TextFormField(
                 key: null,
               controller: _emailController,
               decoration: InputDecoration(
                 labelText: 'First Name',
                 hintText: 'e.g Ambrose',
               ),
             ),
             SizedBox(
               height: 5,
             ),
               TextFormField(
               controller: _emailController,
               decoration: InputDecoration(
                 labelText: 'Last Name',
                 hintText: 'e.g Kyusya',
               ),
             ),

             SizedBox(
               height: 5,
             ),
             
            Row(
              children: <Widget>[
                DropdownButton(items: [
                  DropdownMenuItem(child: Text('Select County'), value: 0),
                  DropdownMenuItem(child: Text('Mombasa'), value: 1,),
                  DropdownMenuItem(child: Text('Nairobi'), value:2,),
                  DropdownMenuItem(child: Text('Kisumu'), value: 3,),
                ], onChanged:(selectedValue){
                  setState(() {
                    _activeItemValue = selectedValue; 
                  });
                },
                value: _activeItemValue, ),
                //display list of towns based on selected county
            //  _activeItemValue > 0 ? DropdownButton(items: 
            // _selectTown(_activeItemValue).toList()            
            // , onChanged:(selectedTownValue){
            //       setState(() {
            //         _activeTownValue = selectedTownValue; 
            //       });
            // },
            // value: _activeTownValue, ) : Text(''),
              ],
            ),
             
             SizedBox(
               height: 5,
             ),
             TextFormField(
               controller: _emailController,
               decoration: InputDecoration(
                 labelText: 'Phone number',
                 hintText: 'e.g 072300000', 
               ),
             ),
             SizedBox(
               height: 5,
             ),
              TextFormField(
               controller:_passwordController,
               decoration: InputDecoration(
                 labelText: 'Password',
                 hintText: 'enter your password',
               ),
             ),
              SizedBox(
               height: 5,
             ),
               TextFormField(
               controller:_passwordController,
               decoration: InputDecoration(
                 labelText: 'Confirm Password',
                 hintText: 'confirm your password',
               ),
             ),
              SizedBox(
               height: 5,
             ),
             DropdownButton(items: [
              DropdownMenuItem(child: Text('Mechanic'), value: 1,),
              DropdownMenuItem(child: Text('Vehicle Owner'), value: 2,),
              
            ], onChanged:(selectedRoleValue){
              setState(() {
                _activeRoleValue = selectedRoleValue; 
              });
            },
            value: _activeRoleValue, ),
             SizedBox(
               height: 5,
             ),
           
             RaisedButton(onPressed: (){},
             child: Text('Register'),),
              Row(
               children: <Widget>[
                 Expanded(child: Text('Already a member?')),
                 SizedBox(width: 10,),
                 Expanded(child: FlatButton(onPressed: (){
                   Navigator.pushNamed(context, '/login');
                 }, child: Text('Login'), hoverColor: Colors.green,
                 color: Colors.transparent,))
               ],
             )
           ],
         ),
       ),
     )

    );
  }
}