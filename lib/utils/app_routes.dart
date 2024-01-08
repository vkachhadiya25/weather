import 'package:flutter/material.dart';
import 'package:weather/screen/home/view/home_screen.dart';

Map<String,WidgetBuilder> appRoutes =
{
  '/' : (context) => const HomeScreen(),
};