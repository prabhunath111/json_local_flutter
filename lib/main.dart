import 'package:flutter/material.dart';
import 'dart:convert';

void main() => runApp(MaterialApp(
  home: HomePage(),
  theme: ThemeData(
    primarySwatch: Colors.cyan
  ),
  debugShowCheckedModeBanner: false,
));
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Local Json"),
      ),
      body: Container(
        child: Center(
          child: FutureBuilder(
            future: DefaultAssetBundle.of(context).loadString('loadJson/localJson.json'),
            builder: (context, snapshot) {
              //Decode json
              var myData = jsonDecode(snapshot.data.toString());
              return new ListView.builder(
                itemCount: myData == null ? 0 : myData.length,
                  itemBuilder: (BuildContext context, int index){
                    return  Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text("Name: "+myData[index]['name']),
                          Text("Age: "+myData[index]['age']),
                          Text("Height: "+myData[index]['height']),
                          Text("Gender: "+myData[index]['gender']),
                          Text("Addr: "+myData[index]['address']),
                          Text("Role: "+myData[index]['role']),
                          Text("Company: "+myData[index]['company']),
                        ],
                      ),
                    );
                  }
              );
            },
          ),
        ),
      ),
    );
  }
}
