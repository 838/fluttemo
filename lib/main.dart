import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';

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
  final state = BehaviorSubject.seeded(true);

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
            _buildSwitch('✅'),
            _buildSwitch('❌'),
            _buildCheckbox('✅'),
            _buildCheckbox('❌'),
          ],
        ),
      ),
    );
  }

  Row _buildSwitch(
    String text,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ExcludeSemantics(child: Text(text)),
        StreamBuilder(
          stream: state,
          initialData: state.value,
          builder: (
            BuildContext context,
            AsyncSnapshot snapshot,
          ) {
            return Switch(
              value: snapshot.data,
              onChanged: (val) async {
                if (text == '❌') {
                  await Future.delayed(const Duration(milliseconds: 200));
                }
                state.value = val;
              },
            );
          },
        ),
      ],
    );
  }

  Row _buildCheckbox(
    String text,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ExcludeSemantics(child: Text(text)),
        StreamBuilder(
          stream: state,
          initialData: state.value,
          builder: (
            BuildContext context,
            AsyncSnapshot snapshot,
          ) {
            return Checkbox(
              value: snapshot.data,
              onChanged: (val) async {
                if (text == '❌') {
                  await Future.delayed(const Duration(milliseconds: 200));
                }

                state.value = val ?? true;
              },
            );
          },
        ),
      ],
    );
  }
}
