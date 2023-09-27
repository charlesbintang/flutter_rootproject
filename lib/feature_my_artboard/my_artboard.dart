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
  File? _selectedImage1;
  File? _selectedImage2;

  double _top1 = 0;
  double _left1 = 0;
  double _top2 = 0;
  double _left2 = 0;

  bool isFilePicked = false;
  bool isImage1Layer1Visible = true;
  bool isImage2Layer1Visible = true;
  bool isImage1Layer2Visible = true;
  bool isImage2Layer2Visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("MyArtboard"),
        centerTitle: true,
      ),
      body: isFilePicked == true
          ? Stack(
              clipBehavior: Clip.none,
              children: [
                Visibility(
                  visible: isImage1Layer1Visible,
                  replacement: const SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                  ),
                  child: Positioned(
                    top: _top1,
                    left: _left1,
                    child: GestureDetector(
                      onPanUpdate: (details) {
                        _top1 = max(0, _top1 + details.delta.dy);
                        _left1 = max(0, _left1 + details.delta.dx);
                        setState(() {});
                      },
                      child: Image.file(_selectedImage1!),
                    ),
                  ),
                ),
                if (_selectedImage2 != null)
                  Visibility(
                    visible: isImage2Layer1Visible,
                    replacement: const SizedBox(
                      height: double.infinity,
                      width: double.infinity,
                    ),
                    child: Positioned(
                      top: _top2,
                      left: _left2,
                      child: GestureDetector(
                        onPanUpdate: (details) {
                          _top2 = max(0, _top2 + details.delta.dy);
                          _left2 = max(0, _left2 + details.delta.dx);
                          setState(() {});
                        },
                        child: Image.file(_selectedImage2!),
                      ),
                    ),
                  ),
                if (_selectedImage2 != null)
                  Visibility(
                    visible: isImage1Layer2Visible,
                    replacement: const SizedBox(
                      height: double.infinity,
                      width: double.infinity,
                    ),
                    child: Positioned(
                      top: _top1,
                      left: _left1,
                      child: GestureDetector(
                        onPanUpdate: (details) {
                          _top1 = max(0, _top1 + details.delta.dy);
                          _left1 = max(0, _left1 + details.delta.dx);
                          setState(() {});
                        },
                        child: Image.file(_selectedImage1!),
                      ),
                    ),
                  ),
                if (_selectedImage2 != null)
                  Visibility(
                    visible: isImage2Layer2Visible,
                    replacement: const SizedBox(
                      height: double.infinity,
                      width: double.infinity,
                    ),
                    child: Positioned(
                      top: _top2,
                      left: _left2,
                      child: GestureDetector(
                        onPanUpdate: (details) {
                          _top2 = max(0, _top2 + details.delta.dy);
                          _left2 = max(0, _left2 + details.delta.dx);
                          setState(() {});
                        },
                        child: Image.file(_selectedImage2!),
                      ),
                    ),
                  )
              ],
            )
          : const SizedBox(),
      floatingActionButton: Stack(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(
              onPressed: () {
                _pickImageFromGallery1();
              },
              child: const Text("Impor gambar 1"),
            ),
          ],
        ),
        if (_selectedImage1 != null)
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isFilePicked = false;
                    _selectedImage1 = null;
                    _top1 = 0;
                    _left1 = 0;
                    // isImage1OnTheTop = !isImage1OnTheTop;
                  });
                },
                child: const Text("Hapus"),
              ),
              ElevatedButton(
                onPressed: () {
                  _pickImageFromGallery2();
                },
                child: const Text("Impor gambar 2"),
              ),
            ],
          ),
      ]),
    );
  }

  Future _pickImageFromGallery1() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage == null) return;
    setState(() {
      _selectedImage1 = File(returnedImage.path);
      isFilePicked = true;
    });
  }

  Future _pickImageFromGallery2() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage == null) return;
    setState(() {
      _selectedImage2 = File(returnedImage.path);
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