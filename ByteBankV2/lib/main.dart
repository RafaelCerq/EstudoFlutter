import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Dashboard'),
        ),
        body: Column(
          children: <Widget>[
            Image.network(
                'https://cdn.pixabay.com/photo/2019/10/15/06/03/pinwheel-4550711_960_720.jpg')
          ],
        ),
      ),
    );
  }
}