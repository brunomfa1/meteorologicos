import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:teste_api_sqllite/src/model/weather_model.dart';

//CONTRUIR O METODO PARA USAR O HTTP

class Repository{
   Future<List<Weather>>obterTodos({String uri = ''})async{
  var url = Uri.parse('https://626025c953a42eaa0700d7d5.mockapi.io/api/v1/${uri}');
  var request = await http.get(url, headers: {"Content-Type":"application/json"});

  var response = jsonDecode( request.body ) ;

        List<Weather> whathers = response
            .map<Weather>((resp) => Weather.fromMap(resp))
            .toList();

  // var _weather = json;
  return whathers;  
}

}

  //var url = Uri.parse('https://goweather.herokuapp.com/weather/cuiaba');
  //var response = await http.get(url);
  //var json = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
  //var _weather = json;
  //return _weather;  