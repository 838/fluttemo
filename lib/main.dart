import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

enum MyEnum {
  one,
  two,
}

extension MyEnumExtension on MyEnum {
  bool get isOne => this == MyEnum.one;
  bool get isTwo => this == MyEnum.two;
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
  MyEnum _myEnum = MyEnum.one;

  void setMyEnum(MyEnum myEnum) {
    setState(() {
      _myEnum = myEnum;
    });
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
            Text(
              '$_myEnum',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        children: [
          if (_myEnum.isTwo)
            FloatingActionButton(
              onPressed: () => setMyEnum(MyEnum.one),
              tooltip: 'One',
              child: const Icon(Icons.numbers),
            ),
          const Spacer(),
          if (_myEnum.isOne)
            FloatingActionButton(
              onPressed: () => setMyEnum(MyEnum.two),
              tooltip: 'Two',
              child: const Icon(Icons.numbers),
            ),
        ],
      ),
    );
  }
}
