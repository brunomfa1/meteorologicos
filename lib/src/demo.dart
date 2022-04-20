import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:teste_api_sqllite/src/errorPage/error.dart';
import 'package:teste_api_sqllite/src/model/weather_model.dart';
import 'package:teste_api_sqllite/src/repository/weather_repository.dart';

class Demo extends StatefulWidget {
  Demo({Key? key,  required this.text}): super (key: key);
  //PASSA A ENTRADA DA CIDADE AQUI
  final String text;
  @override
  State<Demo> createState() => _DemoState(text: this.text);
}
class _DemoState extends State<Demo> {
_DemoState({Key? key,  required this.text});
   final String text;

   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,
        title:  const Text('Cuiaba Mil Grau'),
      ),
      //PEGA A APLICAÇÃO EM UM FutureBuilder
      body:FutureBuilder<List<Weather>>(
        future: Repository().obterTodos(uri: text),
        builder: (context, snapshot){
          
          //SE API RETORAR ALGUM DADO
          if(snapshot.hasData){
            return Center(
        child: ListView.builder(itemBuilder: (context, index){

          return Column(
          children: [
              _buildText(widget.text.toUpperCase(),60,Colors.black,true),
              _buildText('Today',40,Colors.grey,false),
              _buildText(snapshot.data![index].description,20 ,Colors.black,false),
              SizedBox(
                height: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildDisplayCard(
                      Icons.thermostat, 
                      snapshot.data![index].temperature, //MOSTRA A TEMPERATURA AQUI
                      Colors.red),
                     _buildDisplayCard(
                      Icons.air, 
                      snapshot.data![index].wind, 
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
                        SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(padding: const EdgeInsets.all(5),
                            child: Icon(Icons.thermostat,
                            size: 30,
                              ),
                            ),
                            // MOSTRA O DUA 1 DA TEMPERATURA NO Forecast
                            Padding(padding: const EdgeInsets.all(5),
                            child: _buildText(snapshot.data![index].forecast![index].temperature.toString(), 20, Colors.white, true ),
                            ),
                             Padding(padding: const EdgeInsets.all(5),
                            child: Icon(Icons.air,
                            size: 30,
                              ),
                            ),
                            // MOSTRA O DUA 1 DO VENTO NO Forecast
                            Padding(padding: const EdgeInsets.all(5),
                            child: _buildText(snapshot.data![index].forecast![index].wind.toString(), 20, Colors.white, true ),
                            ), 
                          ],
                        ),
                      ],
                    ),
                  )
                ),
              ),
            ],
          );
        }) 
        );
        } else if(snapshot.hasError){
          return ErrorPage();
        }else{
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    ),
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

