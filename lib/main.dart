import 'dart:async';
import 'package:api_flutter/store_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'detail_screen.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  int count = 0;
  static var data;
  String listdata;
  List<String> items = [];
  List<String> body = [];


  Future<String> getData() async {
    http.Response response = await http.get(
        Uri.encodeFull("http://jsonplaceholder.typicode.com/posts"),
        headers: {"Accept": "application/json"});
    data = json.decode(response.body);

    setState(() {
      listdata = data[count++]["title"];
      items.add(listdata);
      body.add(data[count-1]["body"]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Data List'),
        ),
        floatingActionButton:
            FloatingActionButton(child: Icon(Icons.add), onPressed: getData),
        body: getListView());
  }

  ListView getListView() {
    return ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int position) {
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              title: Text('${items[position]}'),
              trailing: Icon(Icons.arrow_right),
              onTap: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => new
                      screentwo(title: items[position],body: body[position],)),
                );
              },
            ),
          );
        });
  }
}
