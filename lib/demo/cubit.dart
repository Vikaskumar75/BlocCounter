import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);

  void decrement() => emit(state - 1);
}

Future<void> main() async {
  final cubit = CounterCubit();

  final streamSubscription = cubit.listen((data) {
    print(data);
  });

  cubit.increment();
  cubit.increment();
  cubit.increment();
  cubit.increment();

  await Future.delayed(Duration.zero);
  await streamSubscription.cancel();

  cubit.close();
}

// void main() {
//   final cubit = CounterCubit();
//
//   print(cubit.state); //should print 0
//   cubit.increment();
//
//   print(cubit.state);//should print 1
//   cubit.increment();
//
//   print(cubit.state);//should print 2
//   cubit.decrement();
//
//   print(cubit.state);//should print 1
//   cubit.decrement();
//
//   print(cubit.state);//should print 0
//
//   cubit.close();
// }
