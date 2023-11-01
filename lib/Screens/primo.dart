//lib\Screens\primo.dart
import 'package:flutter/material.dart';
import 'package:provider_class/Bloc/counter_bloc.dart';

class Primo extends StatelessWidget {
  final CounterBloc bloc;

  Primo({required this.bloc, Key? key}) : super(key: key);

  bool isPrime(int num) {
    if (num <= 1) return false;
    for (var i = 2; i <= num / 2; i++) {
      if (num % i == 0) return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder<int>(
        stream: bloc.counter,
        builder: (context, snapshot) {
          int data = snapshot.data ?? 0;
          bool prime = isPrime(data);
          return Text(
            prime ? 'Primo' : 'No Primo',
            style: TextStyle(fontSize: 40, color: prime ? Colors.green : Colors.blue),
          );
        },
      ),
    );
  }
}
