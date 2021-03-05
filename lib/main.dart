import 'package:BlocNavigation/counterCubit.dart';
import 'package:BlocNavigation/counterState.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        home: Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Bloc'),
            Text(
              'Counter',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocConsumer<CounterCubit, CounterState>(
                listener: (context, state) {
                  if (state.wasIncremented==true) {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text('Incremented'),
                      backgroundColor: Colors.blue,
                      duration: Duration(milliseconds: 300),
                    ));
                  } if (state.wasIncremented==false) {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text('Decremented'),
                      backgroundColor: Colors.red,
                      duration: Duration(milliseconds: 300),
                    ));
                  }
                },
                builder: (context, state) {
              return Text(
                state.counterValue.toString(),
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 50,
                ),
              );
            }),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FlatButton(
                  shape: CircleBorder(),
                  color: Colors.blue,
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                FlatButton(
                  shape: CircleBorder(),
                  color: Colors.blue,
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
