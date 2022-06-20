import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/network/api_service.dart';

import 'my_home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => ApiService.create(),
      child: MaterialApp(
    //title: 'Flutter Demo',
        theme: ThemeData(
        primarySwatch: Colors.blue,
        ),
        home: MyHome(),
      ),
    );
  }
}