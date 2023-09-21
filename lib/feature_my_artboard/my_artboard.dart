import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyArtboard extends StatefulWidget {
  const MyArtboard({Key? key}) : super(key: key);

  @override
  State<MyArtboard> createState() => _MyArtboardState();
}

class _MyArtboardState extends State<MyArtboard> {
  File? _selectedImage;

  double _top = 0;
  double _left = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("MyArtboard"),
        centerTitle: true,
      ),
      body: _selectedImage != null
          ? Stack(
              children: [
                Positioned(
                  top: _top,
                  left: _left,
                  child: GestureDetector(
                    onPanUpdate: (details) {
                      _top = max(0, _top + details.delta.dy);
                      _left = max(0, _left + details.delta.dx);
                      setState(() {});
                    },
                    child: Image.file(_selectedImage!),
                  ),
                ),
              ],
            )
          : const SizedBox(),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          _pickImageFromGallery();
        },
        child: const Text("Impor gambar"),
      ),
    );
  }

  Future _pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage == null) return;
    setState(() {
      _selectedImage = File(returnedImage.path);
    });
  }
}


      // body: Center(
      //   child: Stack(
      //     children: [
      //       if (moveForward == 0)
      //         Positioned(
      //           // key: const ValueKey(1),
      //           top: _topA,
      //           left: _leftA,
      //           child: GestureDetector(
      //               onLongPress: () {
      //                 _isMovingB = true;
      //                 _isMovingA =
      //                     false; // Pastikan foto pertama tidak sedang dipindahkan
      //                 // Geser widget kedua ke atas widget pertama dalam Stack
      //                 final tempTop = _topA;
      //                 final tempLeft = _leftA;
      //                 _topA = _top;
      //                 _leftA = _left;
      //                 _top = tempTop;
      //                 _left = tempLeft;
      //                 setState(() {});
      //               },
      //               onPanUpdate: (details) {
      //                 _topA = max(0, _topA + details.delta.dy);
      //                 _leftA = max(0, _leftA + details.delta.dx);
      //                 setState(() {});
      //               },
      //               child: Image.asset(
      //                 urlImage2,
      //                 scale: 5,
      //                 fit: BoxFit.cover,
      //               )),
      //         ),
      //       // Positioned(
      //       //   // key: const ValueKey(2),
      //       //   top: _top,
      //       //   left: _left,
      //       //   child: GestureDetector(
      //       //     onLongPress: () {
      //       //       _isMovingA = true;
      //       //       _isMovingB =
      //       //           false; // Pastikan foto kedua tidak sedang dipindahkan
      //       //       // Geser widget pertama ke atas widget kedua dalam Stack
      //       //       final tempTop = _top;
      //       //       final tempLeft = _left;
      //       //       _top = _topA;
      //       //       _left = _leftA;
      //       //       _topA = tempTop;
      //       //       _leftA = tempLeft;
      //       //       setState(() {});
      //       //     },
      //       //     onPanUpdate: (details) {
      //       //       _top = max(0, _top + details.delta.dy);
      //       //       _left = max(0, _left + details.delta.dx);
      //       //       setState(() {});
      //       //     },
      //       //     child: Image.asset(urlImage1, scale: 5, fit: BoxFit.cover),
      //       //   ),
      //       // ),
      //       if (moveForward == 1)
      //         Positioned(
      //           // key: const ValueKey(2),
      //           top: _top,
      //           left: _left,
      //           child: GestureDetector(
      //             onLongPress: () {
      //               _isMovingA = true;
      //               _isMovingB =
      //                   false; // Pastikan foto kedua tidak sedang dipindahkan
      //               // Geser widget pertama ke atas widget kedua dalam Stack
      //               final tempTop = _top;
      //               final tempLeft = _left;
      //               _top = _topA;
      //               _left = _leftA;
      //               _topA = tempTop;
      //               _leftA = tempLeft;
      //               setState(() {});
      //             },
      //             onPanUpdate: (details) {
      //               _top = max(0, _top + details.delta.dy);
      //               _left = max(0, _left + details.delta.dx);
      //               setState(() {});
      //             },
      //             child: Image.asset(urlImage1, scale: 5, fit: BoxFit.cover),
      //           ),
      //         ),
      //       // Positioned(
      //       //   // key: const ValueKey(1),
      //       //   top: _topA,
      //       //   left: _leftA,
      //       //   child: GestureDetector(
      //       //       onLongPress: () {
      //       //         _isMovingB = true;
      //       //         _isMovingA =
      //       //             false; // Pastikan foto pertama tidak sedang dipindahkan
      //       //         // Geser widget kedua ke atas widget pertama dalam Stack
      //       //         final tempTop = _topA;
      //       //         final tempLeft = _leftA;
      //       //         _topA = _top;
      //       //         _leftA = _left;
      //       //         _top = tempTop;
      //       //         _left = tempLeft;
      //       //         setState(() {});
      //       //       },
      //       //       onPanUpdate: (details) {
      //       //         _topA = max(0, _topA + details.delta.dy);
      //       //         _leftA = max(0, _leftA + details.delta.dx);
      //       //         setState(() {});
      //       //       },
      //       //       child: Image.asset(
      //       //         urlImage2,
      //       //         scale: 5,
      //       //         fit: BoxFit.cover,
      //       //       )),
      //       // ),
      //     ],
      //   ),
      // ),