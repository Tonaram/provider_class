//lib\Screens\suma_resta.dart
import 'package:flutter/material.dart';
import 'package:provider_class/Bloc/counter_bloc.dart';

class SumaResta extends StatelessWidget {
  final CounterBloc bloc;

  SumaResta({required this.bloc, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          StreamBuilder<int>(
            stream: bloc.counter,
            builder: (context, snapshot) {
              int currentValue = snapshot.data ?? 0;
              return Text(
                currentValue.toString(),
                style: const TextStyle(fontSize: 40),
              );
            },
          ),
          ElevatedButton(
            onPressed: () => bloc.eventSink.add(CounterAction.Increment),
            child: const Icon(Icons.add),
          ),
          ElevatedButton(
            onPressed: () => bloc.eventSink.add(CounterAction.Decrement),
            child: const Icon(Icons.remove),
          ),
          ElevatedButton(
            onPressed: () => bloc.eventSink.add(CounterAction.Reset),
            child: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
