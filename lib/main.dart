// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_rootproject/child_class/coba_artboard.dart';
import 'package:flutter_rootproject/child_class/coba_image_picker.dart';
import 'package:flutter_rootproject/child_class/coba_save_to_gallery.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SCRAPYBOOK',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const MyScrap(),
    );
  }
}

class MyScrap extends StatefulWidget {
  const MyScrap({super.key});

  @override
  State<MyScrap> createState() => _MyScrapState();
}

class _MyScrapState extends State<MyScrap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("MyScrap"),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CobaImagePicker(),
            CobaSaveToGallery(),
            CobaArtboard(),
          ],
        ),
      ),
    );
  }
}
