import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather/screen/home/provider/home_provider.dart';
import 'package:weather/utils/app_routes.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => HomeProvider(),),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      routes: appRoutes,
    ),
  ));
}

