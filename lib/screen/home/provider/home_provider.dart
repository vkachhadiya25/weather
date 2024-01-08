import 'package:flutter/material.dart';
import 'package:weather/screen/home/model/home_model.dart';
import 'package:weather/utils/api_helper.dart';

class HomeProvider with ChangeNotifier {
  HomeModel? homeModel;

  Future<void> getWeather() async {
    JsonHelper jsonHelper = JsonHelper();
    HomeModel? m1 = await jsonHelper.weatherAPI(lat: lat, lon: lon);
    homeModel = m1;
    notifyListeners();
  }

  var lat = 21.1702;
  var lon = 72.8311;

  void changeLatLan(var lat1,lon1)
  {
    lat = lat1;
    lon = lon1;
    notifyListeners();
  }
}
