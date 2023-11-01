//lib\main.dart
import 'package:flutter/material.dart';
import 'package:provider_class/Bloc/counter_bloc.dart';
import 'package:provider_class/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final CounterBloc bloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contador 2.0',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(bloc: bloc),
    );
  }
}
