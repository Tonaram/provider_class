//lib\Screens\multiplica.dart
import 'package:flutter/material.dart';
import 'package:provider_class/Bloc/counter_bloc.dart';

class Multiplica extends StatelessWidget {
  final CounterBloc bloc;

  Multiplica({required this.bloc, Key? key}) : super(key: key);

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
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  bloc.eventSink.add(CounterAction.Multiply2);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Multiplicado por 2')),
                  );
                },
                child: const Text('X2'),
              ),
              ElevatedButton(
                onPressed: () {
                  bloc.eventSink.add(CounterAction.Multiply3);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Multiplicado por 3')),
                  );
                },
                child: const Text('X3'),
              ),
              ElevatedButton(
                onPressed: () {
                  bloc.eventSink.add(CounterAction.Multiply5);
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Multiplicado por 5')),
                  );
                },
                child: const Text('X5'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
