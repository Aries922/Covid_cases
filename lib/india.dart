// import 'dart:html';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class India extends StatefulWidget {
  @override
  _IndiaState createState() => _IndiaState();
}

class _IndiaState extends State<India> {

  final String url = "https://api.rootnet.in/covid19-in/stats/latest";
  
  Future<List> datas;
  
  Future<List> getData() async {
    var response = await Dio().get(url);
    return response.data['data']['regional'];
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
        title: Text("StateWise Staticstic"),
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
                            SnapShot.data[index]['confirmedCasesIndian'].toString(),
                            SnapShot.data[index]['confirmedCasesForeign'].toString(),
                            SnapShot.data[index]['deaths'].toString(),
                            SnapShot.data[index]['discharged'].toString(),

                          ),
                          child: Card(
                              child: Container(
                            color: Colors.black,
                            child: Center(
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(padding: EdgeInsets.only(top: 5)),
                                  Text(
                                    "Indian Cases: ${SnapShot.data[index]['confirmedCasesIndian'].toString()}",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 5)),
                                  Image(
                                    image: AssetImage("images/india.jpeg"),
                                    height: 80,
                                    width: 80,
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 5)),
                                  Text(
                                    "${SnapShot.data[index]['loc']}",
                                    style: TextStyle(
                                        fontSize: 18.0, color: Colors.white38),
                                  )
                                ],
                              ),
                            ),
                          )),
                        ),
                      ));
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
