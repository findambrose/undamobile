import 'package:flutter/material.dart';
import 'package:unda/BLoC/SearchBloc.dart';
import 'package:unda/Data%20Layer/Repositories/MechanicRepo.dart';
import 'package:unda/Data%20Layer/models/POJOs/user.dart';
import 'package:unda/Data%20Layer/models/mechanic.dart';

class AllResults extends StatelessWidget {
  Map<String, dynamic> dataFromAddVehiclePage = {};
  SearchBloc _bloc = SearchBloc(MechanicRepo());
  final List<User> users = [
    User(
      location: 'Mombasa',
      fname: 'Ambrose',
      lname: 'Kyusya',
      startingPrice: 500,
      availability: 'Open',
    ),
    User(
      location: 'Mombasa',
      fname: 'Ambrose',
      lname: 'Kyusya',
      startingPrice: 500,
      availability: 'Open',
    ),
    User(
      location: 'Mombasa',
      fname: 'Ambrose',
      lname: 'Kyusya',
      startingPrice: 500,
      availability: 'Closed',
    ),
    User(
      location: 'Mombasa',
      fname: 'Ambrose',
      lname: 'Kyusya',
      startingPrice: 500,
      availability: 'Open',
    ),
    User(
      location: 'Mombasa',
      fname: 'Ambrose',
      lname: 'Kyusya',
      startingPrice: 500,
      availability: 'Closed',
    ),
    User(
      location: 'Mombasa',
      fname: 'Ambrose',
      lname: 'Kyusya',
      startingPrice: 500,
      availability: 'Closed',
    ),
    User(
      location: 'Mombasa',
      fname: 'Ambrose',
      lname: 'Kyusya',
      startingPrice: 500,
      availability: 'Closed',
    ),
    User(
      location: 'Mombasa',
      fname: 'Ambrose',
      lname: 'Kyusya',
      startingPrice: 500,
      availability: 'Open',
    ),
    User(
      location: 'Mombasa',
      fname: 'Ambrose',
      lname: 'Kyusya',
      startingPrice: 500,
      availability: 'Closed',
    ),
    User(
      location: 'Mombasa',
      fname: 'Ambrose',
      lname: 'Kyusya',
      startingPrice: 500,
      availability: 'Closed',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    dataFromAddVehiclePage = dataFromAddVehiclePage.isEmpty
        ? ModalRoute.of(context).settings.arguments
        : dataFromAddVehiclePage;
    return Scaffold(
      backgroundColor: Color(0xff1E1E1E),
      appBar: AppBar(
        title: Text('All Results'),
        centerTitle: true,
        leading: Icon(Icons.menu),
        actions: <Widget>[Icon(Icons.search)],
      ),
      body: StreamBuilder<Object>(
          stream: _bloc.mechanicsList,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("An error occured. Please reload");
            }

            if (snapshot.hasData) {
              List<Mechanic> mechanics = snapshot.data;
              return Padding(
                padding: const EdgeInsets.only(top: 15),
                child: ListView.builder(
                    itemCount: mechanics.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: Row(
                          children: <Widget>[
                            Container(
                              height: 110,
                              width: 110,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(15),
                                    bottomRight: Radius.circular(15)),
                                image: DecorationImage(
                                  image: AssetImage(
                                    users[index].imageURL,
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Column(
                              // Listtile + star ratings
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xff22222A),
                                    borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(15),
                                      topRight: Radius.circular(15),
                                    ),
                                  ),
                                  height: 90,
                                  width:
                                      MediaQuery.of(context).size.width * .67,
                                  child: Column(
                                    children: <Widget>[
                                      ListTile(
                                        //  contentPadding: EdgeInsets.only(),
                                        //Listtile
                                        title: Text(mechanics[index].name,
                                            style:
                                                TextStyle(color: Colors.white)),
                                        subtitle: Text(users[index].location,
                                            style:
                                                TextStyle(color: Colors.grey)),
                                        trailing: Text(
                                            mechanics[index]
                                                    .startingPrice
                                                    .toString() +
                                                ' ' +
                                                'KES',
                                            style:
                                                TextStyle(color: Colors.white)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15.0, right: 15.0, bottom: 0),
                                        child: Row(
                                          //Ratings
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              mechanics[index].startingPrice +
                                                  ' Star Rated',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12),
                                            ),
                                            //SizedBox(width: 30,),
                                            Text(
                                              users[index].availability,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: mechanics[index]
                                                              .availability ==
                                                          'Closed'
                                                      ? Colors.red
                                                      : Colors.green),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
              );
            }

            return Container(
              child: Text("Loading search results"),
            );
          }),
    );
  }
}
