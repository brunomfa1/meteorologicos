import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:teste_api_sqllite/src/model/weather_Model.dart';


class WeatherScreen extends StatefulWidget {
  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  //USADO PARA COPIAR O TEXTO DO CAMPO TEXTO
  final _controller = TextEditingController();
  Weather? info;
  String text = '';//PASSA O TEXTO DE ENTRADA

  void dispose(){
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
     
    return Scaffold(
      //BARRA DO APP
      appBar: AppBar(
        title: Center(
          child: Text('Cuiaba Mil Grau'),
        ),
      ),
      //CORPO DO APP
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: const EdgeInsets.all(8),
            child: Text('Incert City Name :', 
            style: TextStyle(
              fontSize: 24,
              fontWeight:  FontWeight.bold,
                ),
              ), 
            ),
            Padding(padding: const EdgeInsets.all(8),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder()
              ),
              controller: _controller,
              )
            ),
          ],
        ),
      ),
      //BOTÃO
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.search),
        onPressed: (){
        },
      ),
    );
  }
}

