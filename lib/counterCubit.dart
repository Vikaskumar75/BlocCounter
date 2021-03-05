import 'package:bloc/bloc.dart';

import './counterState.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterState(counterValue: 0));

  void increment() => emit(CounterState(counterValue: state.counterValue + 1,wasIncremented: true));

  void decrement() => emit(CounterState(counterValue: state.counterValue - 1,wasIncremented: false));
}
