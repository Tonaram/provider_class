//lib\Screens\extra.dart
import 'package:flutter/material.dart';
import 'package:provider_class/Bloc/counter_bloc.dart';

class Extra extends StatelessWidget {
  final CounterBloc bloc;

  Extra({required this.bloc, Key? key}) : super(key: key);

  Color getColorFromValue(int value) {
    if (value > 100) {
      return Colors.purple;
    }

    int hue = (value * 2.5).clamp(0, 360).toInt();
    return HSVColor.fromAHSV(1.0, hue.toDouble(), 1, 1).toColor();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: bloc.counter,
      builder: (context, snapshot) {
        int currentValue = snapshot.data ?? 0;
        return Container(
          color: getColorFromValue(currentValue),
          child: Center(
            child: Text(
              snapshot.data.toString(),
              style: const TextStyle(fontSize: 40, color: Colors.white),
            ),
          ),
        );
      },
    );
  }
}
