import 'dart:convert';
import 'package:http/http.dart' as http;

//CONTRUIR O METODO PARA USAR O HTTP
Future<Map>fetch()async{
  var url = Uri.parse('https://goweather.herokuapp.com/weather/cuiaba');
  var response = await http.get(url);
  var json = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
  var _weather = json;
  return _weather;
}