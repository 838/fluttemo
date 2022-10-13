import 'dart:developer';

import 'package:flutter/material.dart';

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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SizedBox(
        width: screenSize.width,
        height: screenSize.height,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Positioned.fill(
              top: 0,
              left: 0,
              right: 0,
              bottom: 0,
              child: Semantics(
                label: 'Filled Widget',
                button: true,
                container: true,
                focusable: true,
                onTap: () => log('tapped'),
                excludeSemantics: true,
                child: const Text(
                  'Filled Text widget',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Positioned(
              top: screenSize.height / 2 - 50.0,
              left: 0,
              right: 0,
              child: const Center(
                child: Text(
                  'You have pushed the button this many times:',
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Positioned(
              top: screenSize.height / 2,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headline4,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
