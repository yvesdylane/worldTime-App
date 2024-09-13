import 'package:flutter/material.dart';
import 'package:world_time/pages/choice_location.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading.dart';

void main()  => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => const Laoding(),
    '/home': (context) => const Home(),
    '/location': (context) => const ChooseLocation()
  }
));

