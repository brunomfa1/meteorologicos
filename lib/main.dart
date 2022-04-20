import 'package:flutter/material.dart';
import 'package:teste_api_sqllite/src/demo.dart';
import 'package:teste_api_sqllite/src/weatherScreen/screen.dart';
void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter API Com SqlLite',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WeatherScreen(),
    );
  }
}
