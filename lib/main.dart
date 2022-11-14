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
              pinned: true,
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                List.generate(
                  100,
                  (index) => Semantics(
                    key: ValueKey(index),
                    label: '$index',
                    excludeSemantics: true,
                    child: SizedBox(
                      height: 100.0,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          'Sliver Item $index',
                          style: const TextStyle(fontSize: 22.0),
                        ),
                      ),
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
