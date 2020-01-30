import 'package:api_flutter/store_data.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class screentwo extends StatefulWidget {
  String body;
  String title;
  screentwo({this.title,this.body});

  @override
  _screentwoState createState() => _screentwoState(title: title, body: body);
}

class _screentwoState extends State<screentwo> {
  String title;
  String body;
  _screentwoState({this.title,this.body});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Data Detail'),
      ),
      body: Column(
        children: <Widget>[
          Text('Title:   $title',textAlign: TextAlign.center,),
          Container(
            height: 30.0,
          ),
          Text(body),
        ],
      )
    );
  }
}
