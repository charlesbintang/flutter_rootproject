// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:flutter_rootproject/feature_image_picker/my_home_page.dart';

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
      // home: MyHomePage(title: 'Image Picker Example'),
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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(10),
              child: ElevatedButton(
                // To styling button
                // style: ButtonStyle(
                //     foregroundColor: MaterialStateProperty.resolveWith(
                //         (states) => Colors.white),
                //     backgroundColor: MaterialStateProperty.resolveWith(
                //         (states) => Colors.amber)),
                child: const Text("Coba Fitur Image Picker!"),
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) =>
                          const MyHomePage(title: "Image Picker"),
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
