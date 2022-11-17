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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Semantics(
          label: 'Open `Track name` in full screen player',
          button: true,
          onTap: () {},
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Semantics(
                    label: 'Close',
                    button: true,
                    excludeSemantics: true,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.close),
                    ),
                  ),
                  const ExcludeSemantics(
                    child: Text('Track name'),
                  ),
                  Semantics(
                    label: 'Play',
                    button: true,
                    excludeSemantics: true,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.play_arrow),
                    ),
                  ),
                  Semantics(
                    label: 'Pause',
                    button: true,
                    excludeSemantics: true,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.pause),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
