import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

// class World extends StatefulWidget {
//   @override
//   _WorldState createState() => _WorldState();
// }

// class _WorldState extends State<World> {

//   final String url = "https://corona.lmao.ninja/countries";

//   Future<List> datas;

//   Future<List> getData() async {
//     var response = await Dio().get(url);
//     return response.data;
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     datas = getData();
//   }

//   Future showCard(String cases, tdeath, death, recover) async {
//     await showDialog(
//         context: context,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             backgroundColor: Colors.black,
//             shape: RoundedRectangleBorder(),
//             content: SingleChildScrollView(
//               child: ListBody(
//                 children: [
//                   Text(
//                     "Total Cases:$cases",
//                     style: TextStyle(fontSize: 25, color: Colors.yellow),
//                   ),
//                   Text(
//                     "Foreign Cases:$tdeath",
//                     style: TextStyle(fontSize: 25, color: Colors.red),
//                   ),
//                   Text(
//                     "Total Deaths:$death",
//                     style: TextStyle(fontSize: 25, color: Colors.red),
//                   ),
//                   Text(
//                     "Total Recovered:$recover",
//                     style: TextStyle(fontSize: 25, color: Colors.green),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("StateWise Staticstic"),
//         backgroundColor: Colors.black,
//       ),
//       backgroundColor: Colors.white,
//       body: Container(
//         padding: EdgeInsets.all(10),
//         child: FutureBuilder(
//           future: datas,
//           builder: (BuildContext context, SnapShot) {
//             if (SnapShot.hasData) {
//               return GridView.builder(
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 2,
//                       crossAxisSpacing: 10,
//                       mainAxisSpacing: 10,
//                       childAspectRatio: 1.0),
//                       itemCount: 30,
//                   itemBuilder: (BuildContext context, index) => SizedBox(
//                         height: 50,
//                         width: 50,
//                         child: GestureDetector(
//                           onTap: ()=>showCard(
//                             SnapShot.data[index]['cases'].toString(),
//                             SnapShot.data[index]['tCases'].toString(),
//                             SnapShot.data[index]['deaths'].toString(),
//                             SnapShot.data[index]['recovered'].toString(),

//                           )
//                           ,
//                           child: Card(
//                               child: Container(
//                             color: Colors.black,
//                             child: Center(
//                               child: Column(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 children: [

//                                   Padding(padding: EdgeInsets.only(top: 5)),
//                                   Image(
//                                     image: AssetImage("images/world.jpeg"),
//                                     height: 80,
//                                     width: 80,
//                                   ),
//                                   Padding(padding: EdgeInsets.only(top: 5)),
//                                   Text(
//                                     SnapShot.data[index]['country'],
//                                     style: TextStyle(
//                                         fontSize: 18.0, color: Colors.white38),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           )),
//                         ),
//                       ));
//             }
//             return Center(
//               child: CircularProgressIndicator(),
//         );
//           },
//         ),
//       ),
//     );
//   }
// }

class World extends StatefulWidget {
  @override
  _WorldState createState() => _WorldState();
}

class _WorldState extends State<World> {
  final String url = "https://corona.lmao.ninja/v2/countries";
  Future<List> datas;

  Future<List> getData() async {
    var response = await Dio().get(url);
    return response.data;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    datas = getData();
  }

  Future showCard(String cases, tdeath, death, recover) async {
    await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Text(
                    "Total Cases:$cases",
                    style: TextStyle(fontSize: 25, color: Colors.yellow),
                  ),
                  Text(
                    "Foreign Cases:$tdeath",
                    style: TextStyle(fontSize: 25, color: Colors.red),
                  ),
                  Text(
                    "Total Deaths:$death",
                    style: TextStyle(fontSize: 25, color: Colors.red),
                  ),
                  Text(
                    "Total Recovered:$recover",
                    style: TextStyle(fontSize: 25, color: Colors.green),
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WorldWide Statistic"),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(10),
        child: FutureBuilder( 
            future: datas,
            builder: (BuildContext context, SnapShot) {
              if (SnapShot.hasData) {
                return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1.0),
                    itemCount: 30,
                    itemBuilder: (BuildContext context, index) => SizedBox(
                          height: 50,
                          width: 50,
                          child: GestureDetector(
                            onTap: ()=>showCard(
                              SnapShot.data[index]['cases'].toString(),
                               SnapShot.data[index]['cases'].toString(),
                               SnapShot.data[index]['deaths'].toString(),
                               SnapShot.data[index]['recovered'].toString(),

                            ),
                            
                            child: Card(
                              child: Container(
                                color: Colors.black,
                                child: Center(
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                            padding: EdgeInsets.only(top: 5)),
                                        Image(
                                          image: AssetImage("images/world.png"),
                                          height: 80,
                                          width: 80,
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(top: 5)),
                                        Text(
                                          SnapShot.data[index]['country'],
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              color: Colors.white38),
                                        )
                                      ]),
                                ),
                              ),
                            ),
                          ),
                        ));
              }
              return Center(
                child: CircularProgressIndicator(),
              );
            }),
      ),
    );
  }
}
