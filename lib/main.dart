import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

enum CounterState {
  loading,
  odd,
  even,
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      showSemanticsDebugger: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _counter = 0;

  final _counterState = BehaviorSubject<CounterState>.seeded(CounterState.even);

  void _incrementCounter() async {
    _counterState.value = CounterState.loading;

    await Future.delayed(const Duration(seconds: 3));
    _counter++;

    _counterState.value =
        _counter.isEven ? CounterState.even : CounterState.odd;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            MergeSemantics(
              child: StreamBuilder<CounterState>(
                stream: _counterState.asBroadcastStream(),
                builder: (context, snapshot) {
                  return Semantics(
                    button: true,
                    label: "$_counter ${snapshot.data?.name}",
                    excludeSemantics: true,
                    child: TextButton(
                      onPressed: _incrementCounter,
                      child: Text(
                        '$_counter',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
