class HomeModel {
  String? base, name;
  int? cod, id, timezone,visibility,dt;
  CoordModel? coordModel;
  MainModel? mainModel;
  WindModel? windModel;
  CloudsModel? cloudsModel;
  SysModel? sysModel;
  List<WeatherModel>? weatherList = [];

  HomeModel(
      {this.base,
      this.visibility,
      this.dt,
      this.name,
      this.cod,
      this.id,
      this.timezone,
      this.coordModel,
      this.mainModel,
      this.windModel,
      this.cloudsModel,
      this.sysModel,
      this.weatherList});

  factory HomeModel.mapToModel(Map m1)
  {
    List l1 = m1['weather'];
    return HomeModel(
      base: m1['base'],
      visibility: m1['visibility'],
      dt: m1['dt'],
      name: m1['name'],
      cod: m1['cod'],
      id: m1['id'],
      timezone: m1['timezone'],
      coordModel: CoordModel.mapToModel(m1['coord']),
      cloudsModel: CloudsModel.mapToModel(m1['clouds']),
      mainModel: MainModel.mapToModel(m1['main']),
      sysModel: SysModel.mapToModel(m1['sys']),
      windModel: WindModel.mapToModel(m1['wind']),
      weatherList: l1.map((e) => WeatherModel.mapToModel(e)).toList(),
    );
  }
}

class CoordModel {
  double? lon, lat;

  CoordModel({this.lon, this.lat});

  factory CoordModel.mapToModel(Map m1) {
    return CoordModel(
      lat: m1['lat'],
      lon: m1['lon'],
    );
  }
}

class WeatherModel {
  int? id;
  String? main, description, icon;

  WeatherModel({this.id, this.main, this.description, this.icon});

  factory WeatherModel.mapToModel(Map m1) {
    return WeatherModel(
      id: m1['id'],
      description: m1['description'],
      icon: m1['icon'],
      main: m1['main'],
    );
  }
}

class MainModel {
  double? temp, feels_like, temp_min, temp_max;
  int? pressure,humidity;

  MainModel(
      {this.temp,
      this.feels_like,
      this.temp_min,
      this.temp_max,
      this.pressure,
      this.humidity});

  factory MainModel.mapToModel(Map m1) {
    return MainModel(
      feels_like: m1['feels_like'],
      humidity: m1['humidity'],
      pressure: m1['pressure'],
      temp: m1['temp'],
      temp_max: m1['temp_max'],
      temp_min: m1['temp_min'],
    );
  }
}

class WindModel {
  double? speed;
  int? deg;

  WindModel({this.speed, this.deg});

  factory WindModel.mapToModel(Map m1) {
    return WindModel(
      deg: m1['deg'],
      speed: m1['speed'],
    );
  }
}

class CloudsModel {
  int? all;

  CloudsModel({this.all});

  factory CloudsModel.mapToModel(Map m1) {
    return CloudsModel(
      all: m1['all'],
    );
  }
}

class SysModel {
  int? type, id, sunrise, sunset;
  String? country;

  SysModel({this.type, this.id, this.sunrise, this.sunset, this.country});

  factory SysModel.mapToModel(Map m1 )
  {
    return SysModel(
      id: m1['id'],
      country: m1['country'],
      sunrise: m1['sunrise'],
      sunset: m1['sunset'],
      type: m1['type'],
    );
  }
}


