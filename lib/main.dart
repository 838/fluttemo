import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            const SliverAppBar(
              title: Text("SliverList Example"),
              expandedHeight: 100.0,
              floating: true,
              pinned: true,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                List.generate(
                  100,
                  (index) => Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      'Sliver Item ${index.toString()}',
                      style: const TextStyle(fontSize: 22.0),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
