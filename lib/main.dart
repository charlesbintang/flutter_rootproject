// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_rootproject/child_class/coba_image_picker.dart';
import 'package:flutter_rootproject/child_class/coba_save_to_gallery.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'SCRAPYBOOK',
      home: MyScrap(),
      // home: MyImagePicker(title: 'Image Picker Example'),
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
        title: const Text("MyScrap"),
        backgroundColor: const Color.fromARGB(255, 155, 77, 0),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CobaImagePicker(),
            CobaSaveToGallery(),
          ],
        ),
      ),
    );
  }
}
