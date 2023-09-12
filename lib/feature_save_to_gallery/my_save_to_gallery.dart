// ignore_for_file: unused_import, use_build_context_synchronously

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image/image.dart' as img;

class MySaveToGallery extends StatefulWidget {
  const MySaveToGallery({super.key});

  @override
  State<MySaveToGallery> createState() => _MySaveToGalleryState();
}

class _MySaveToGalleryState extends State<MySaveToGallery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: const Color.fromARGB(255, 184, 70, 28),
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text(
          "Save To Gallery",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Image.network(
              // 'https://picsum.photos/250?image=9',
              'https://picsum.photos/id/13/2500/1667',
              height: 350,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: TextButton(
                onPressed: () async {
                  // String url = 'https://picsum.photos/250?image=9';
                  String url = 'https://picsum.photos/id/13/2500/1667';

                  final tempDir = await getTemporaryDirectory();
                  final path = '${tempDir.path}/image.jpg';

                  await Dio().download(url, path);
                  await GallerySaver.saveImage(path);
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Download to Gallery!")));
                },
                style: const ButtonStyle(
                  overlayColor: MaterialStatePropertyAll(Colors.amber),
                  backgroundColor: MaterialStatePropertyAll(Colors.blue),
                  padding: MaterialStatePropertyAll(EdgeInsets.all(15)),
                ),
                child: const Text("DOWNLOAD THE IMAGE",
                    style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
