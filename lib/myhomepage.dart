import 'dart:convert';
import 'package:corona/india.dart';
import 'package:corona/models/utils/button.dart';
import 'package:corona/world.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:corona/models/Tcases.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final String url = "https://corona.lmao.ninja/v2/all";

  Future<Tcases> getJsonData() async {
    var response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200) {
      final convertDataJSON = jsonDecode(response.body);
      return Tcases.fromJson(convertDataJSON);
    } else {
      throw Exception('try to reload ');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getJsonData();
  }

  navigateToWorld() async {
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => World()));
  }

  navigateToIndia() async {
    await Navigator.push(
        context, MaterialPageRoute(builder: (context) => India()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Covid-19 Tracker",
          style: TextStyle(
              color: Colors.white, fontSize: 25.0, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: Container(
          child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "World wide Statistics",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                ),
                Button(press: () {}, name: "India Staticstic"),
              ],
            ),
            FutureBuilder<Tcases> (
                future: getJsonData(),
                builder: (BuildContext context, Snapshot) {
                  if (Snapshot.hasData) {
                    final covid = Snapshot.data;
                    return Column(
                      children: [
                        Card(
                          color: Colors.blue[50],
                          child: ListTile(
                            title: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "${covid.cases}",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${covid.deaths}",
                                  style: TextStyle(
                                      color: Colors.yellow,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "${covid.recovered}",
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  } else if (Snapshot.error) {
                    return Text(Snapshot.error.toString());
                  } else
                    return Container(child: CircularProgressIndicator());
                }),
            Padding(padding: EdgeInsets.only(top: 5)),
            Container(
              child: Card(
                color: Colors.blue[50],
                child: ListTile(
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Total Cases",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "deaths",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "recovered",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card(
                    child: Container(
                      color: Colors.black,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(
                                image: AssetImage("images/india.jpeg"),
                                height: 90,
                                width: 90),
                            Padding(padding: EdgeInsets.only()),
                            Button(
                                press: () => navigateToIndia(),
                                name: "Indian \n Statewise Statistics")
                          ],
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: Container(
                      color: Colors.black,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image(
                                image: AssetImage("images/world.png"),
                                height: 90,
                                width: 90),
                            Padding(padding: EdgeInsets.only()),
                            Button(
                                press: () {
                                  navigateToWorld();
                                },
                                name: "WorldWide Statistics")
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]))),
    );
  }
}
