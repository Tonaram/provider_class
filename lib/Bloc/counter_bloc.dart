//lib\Bloc\counter_bloc.dart
import 'package:rxdart/rxdart.dart';
import 'dart:async';

enum CounterAction { Increment, Decrement, Reset, Multiply2, Multiply3, Multiply5, CheckPrimo }

class CounterBloc {
  int _counter = 0;

  final _stateStreamController = BehaviorSubject<int>();
  StreamSink<int> get _inCounter => _stateStreamController.sink;
  Stream<int> get counter => _stateStreamController.stream;

  final _eventStreamController = StreamController<CounterAction>();
  StreamSink<CounterAction> get eventSink => _eventStreamController.sink;

  CounterBloc() {
    _eventStreamController.stream.listen(_mapEventToState);
  }

  void _mapEventToState(CounterAction event) {
    switch (event) {
      case CounterAction.Increment:
        _counter++;
        break;
      case CounterAction.Decrement:
        _counter--;
        break;
      case CounterAction.Reset:
        _counter = 0;
        break;
      case CounterAction.Multiply2:
        _counter *= 2;
        break;
      case CounterAction.Multiply3:
        _counter *= 3;
        break;
      case CounterAction.Multiply5:
        _counter *= 5;
        break;
      default:
        break;
    }

    _inCounter.add(_counter);
  }

  void dispose() {
    _stateStreamController.close();
    _eventStreamController.close();
  }
}
