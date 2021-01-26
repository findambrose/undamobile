import 'package:flutter/material.dart';
import 'package:unda/BLoC/SearchBloc.dart';
import 'package:unda/Data%20Layer/Repositories/MechanicRepo.dart';
import 'package:unda/Data%20Layer/models/POJOs/mechanic.dart';
import 'package:unda/Data%20Layer/models/POJOs/user.dart';

class AllResults extends StatefulWidget {
  @override
  _AllResultsState createState() => _AllResultsState();
}

class _AllResultsState extends State<AllResults> {
  Map<String, dynamic> dataFromAddVehiclePage = {};

  SearchBloc _bloc = SearchBloc(MechanicRepo());

  @override
  void didChangeDependencies() {
    _setUpResults();

    super.didChangeDependencies();
  }

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
    dataFromAddVehiclePage = ModalRoute.of(context).settings.arguments;
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
              //  if(snapshot.data == null)

              print("Printing all results");

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
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, "/mechDets",
                                              arguments: {
                                                "name": mechanics[index].name,
                                                "startingPrice":
                                                    mechanics[index]
                                                        .startingPrice,
                                                "location":
                                                    mechanics[index].location,
                                                "rating":
                                                    mechanics[index].rating,
                                                "mechanicUid": mechanics[index]
                                                    .mechanicUid,
                                                "vehicleId":
                                                    dataFromAddVehiclePage[
                                                        "vehicleId"],
                                                         "requestData":
                                                    dataFromAddVehiclePage[
                                                        "requestData"]
                                              });
                                        },
                                        title: Text(mechanics[index].name,
                                            style:
                                                TextStyle(color: Colors.white)),
                                        subtitle: Text(
                                            mechanics[index].location,
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
                                              mechanics[index].rating +
                                                  'Star Rated',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12),
                                            ),
                                            //SizedBox(width: 30,),
                                            Text(
                                              mechanics[index].availability,
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

  _setUpResults() {
    dataFromAddVehiclePage = dataFromAddVehiclePage.isEmpty
        ? ModalRoute.of(context).settings.arguments
        : dataFromAddVehiclePage;

    Map<String, dynamic> requestData = dataFromAddVehiclePage["requestData"];
    String userLocation = requestData["location"]["location"];

    _bloc.behaviorSubject.sink.add(userLocation);
  }
}
