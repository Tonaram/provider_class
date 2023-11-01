//lib\home_page.dart
import 'package:flutter/material.dart';
import 'package:provider_class/Screens/extra.dart';
import 'package:provider_class/Screens/multiplica.dart';
import 'package:provider_class/Screens/primo.dart';
import 'package:provider_class/Screens/suma_resta.dart';
import 'package:provider_class/Bloc/counter_bloc.dart';

class HomePage extends StatefulWidget {
  final CounterBloc bloc;
  const HomePage({required this.bloc, Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedPage = 0;
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _pages = [
      SumaResta(bloc: widget.bloc),
      Multiplica(bloc: widget.bloc),
      Primo(bloc: widget.bloc),
      Extra(bloc: widget.bloc)
    ];
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contador 2.0'),
      ),
      body: _pages[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedPage,
        onTap: (int index) {
          setState(() {
            _selectedPage = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.one_k, size: 24), label: 'Suma'),
          BottomNavigationBarItem(icon: Icon(Icons.two_k, size: 24), label: 'Multiplica'),
          BottomNavigationBarItem(icon: Icon(Icons.three_k, size: 24), label: 'Primo'),
          BottomNavigationBarItem(icon: Icon(Icons.four_k, size: 24), label: 'Extra')
          
        ],
      ),
    );
  }
}
