import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:teste_api_sqllite/src/repository/weather_repository.dart';

class Demo extends StatefulWidget {
  @override
  State<Demo> createState() => _DemoState();
}
class _DemoState extends State<Demo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,
        title:  const Text('Cuiaba Mil Grau'),
      ),
      //DESIGN UI DA APLICAÇÃO
      body: Center(
        child: Column(
          children: [
              _buildText('City Name',60,Colors.black,true),
              _buildText('Today',40,Colors.grey,false),
              _buildText('data',20 ,Colors.black,false),
              SizedBox(
                height: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildDisplayCard(
                      Icons.thermostat, 
                      '29 ºC', 
                      Colors.red),
                     _buildDisplayCard(
                      Icons.air, 
                      '1 KM/H', 
                      Colors.blue),
                  ],
                ),
              ),
              //OUTRO CONTAINER
              SizedBox(
                height: 30,),
              Container(
                child: Card(
                  color: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      children: [
                        FittedBox(
                          child:_buildText('Forecast for Tomorrow',20,Colors.black,true),
                        ),
                        SizedBox(height: 20,)
                      ],
                    ),
                  )
                ),
              ),
            ],
          ),
        )
      );
    }
  // CONSTRUÇÃO DE UMA NOVO MÉTODO PARA A EXIBIÇÃO WEATHER
  Container _buildDisplayCard(IconData icon, String? result, Color iconColor){
    return Container(
      width: 200,
      padding: EdgeInsets.all(10),
      child: Card(
        color: Colors.blue[200],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 40,
              color:iconColor,
            ),
            SizedBox(
              height: 10),
            FittedBox(
              child: Text(
              result!,
              style: TextStyle(
                fontSize: 30
              ),              
              )
            )
          ],
        ),
      ),
    );
  }
  //ESSE METODO SERVER PARA CRIAR VARIOS TITULOS/TEXT
  Padding _buildText(String? text, double size, Color color, bool bold ) {
    return Padding(
              padding: EdgeInsets.all(10),
              child: Text(text!,
              style: TextStyle(
                fontSize: size,
                fontWeight: bold ? FontWeight.bold: null,
                color: color
              ),
            ),
          );
        }
      }

