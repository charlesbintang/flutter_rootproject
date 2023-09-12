import 'package:flutter/material.dart';

class MyArtboard extends StatefulWidget {
  const MyArtboard({super.key});

  @override
  State<MyArtboard> createState() => _MyArtboardState();
}

class _MyArtboardState extends State<MyArtboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("MyArtboard"),
        centerTitle: true,
      ),
    );
  }
}
