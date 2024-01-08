import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather/screen/home/model/home_model.dart';

class JsonHelper {
  Future<HomeModel?> weatherAPI({var lat, var lon}) async {
    var jsonString =
        "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&appid=66ba36015e62474b0a35aef339321004";
    var response = await http.get(Uri.parse(jsonString));

    if(response.statusCode == 200)
      {
          var weatherData = jsonDecode(response.body);
          HomeModel weather = HomeModel.mapToModel(weatherData);
          return weather;
      }
    return null;
  }
}
