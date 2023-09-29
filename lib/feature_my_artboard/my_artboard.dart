import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';

class MyArtboard extends StatefulWidget {
  const MyArtboard({Key? key}) : super(key: key);

  @override
  State<MyArtboard> createState() => _MyArtboardState();
}

class _MyArtboardState extends State<MyArtboard> {
  ScreenshotController screenshotController = ScreenshotController();

  // TODO: Buat 5 gambar yang bisa diimport.
  // TODO: Pindah layer dengan onLongPress.
  // TODO: scaling gambar dengan gesture detection.
  File? _selectedImage1;
  File? _selectedImage2;
  File? _selectedImage3;
  File? _selectedImage4;
  File? _selectedImage5;

  // for onPanUpdate function to 5 image
  double _top1 = 0;
  double _left1 = 0;
  double _top2 = 0;
  double _left2 = 0;
  double _top3 = 0;
  double _left3 = 0;
  double _top4 = 0;
  double _left4 = 0;
  double _top5 = 0;
  double _left5 = 0;

  bool isFilePicked = false;
  // A = layer1
  bool isImage1AVisible = true;
  bool isImage2AVisible = true;
  bool isImage3AVisible = true;
  bool isImage4AVisible = true;
  bool isImage5AVisible = true;
  // B = layer2
  bool isImage1BVisible = true;
  bool isImage2BVisible = true;
  bool isImage3BVisible = true;
  bool isImage4BVisible = true;
  bool isImage5BVisible = true;
  // C = layer3
  bool isImage1CVisible = true;
  bool isImage2CVisible = true;
  bool isImage3CVisible = true;
  bool isImage4CVisible = true;
  bool isImage5CVisible = true;
  // D = layer4
  bool isImage1DVisible = true;
  bool isImage2DVisible = true;
  bool isImage3DVisible = true;
  bool isImage4DVisible = true;
  bool isImage5DVisible = true;
  // E = layer5
  bool isImage1EVisible = true;
  bool isImage2EVisible = true;
  bool isImage3EVisible = true;
  bool isImage4EVisible = true;
  bool isImage5EVisible = true;
  // bool for visible button
  bool isImage2Existed = true;
  bool isImage3Existed = true;
  bool isImage4Existed = true;
  bool isImage5Existed = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("MyArtboard"),
        centerTitle: true,
      ),
      body: isFilePicked == true
          ? Center(
              child: Screenshot(
                controller: screenshotController,
                child: Container(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  height: 620,
                  width: 375,
                  margin: const EdgeInsets.only(bottom: 65),
                  child: Stack(
                    children: [
                      // gambar 1,2,3,4, dan 5 A.
                      Visibility(
                        visible: isImage1AVisible,
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
                          visible: isImage2AVisible,
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
                      if (_selectedImage3 != null)
                        Visibility(
                          visible: isImage3AVisible,
                          replacement: const SizedBox(
                            height: double.infinity,
                            width: double.infinity,
                          ),
                          child: Positioned(
                            top: _top3,
                            left: _left3,
                            child: GestureDetector(
                              onPanUpdate: (details) {
                                _top3 = max(0, _top3 + details.delta.dy);
                                _left3 = max(0, _left3 + details.delta.dx);
                                setState(() {});
                              },
                              child: Image.file(_selectedImage3!),
                            ),
                          ),
                        ),
                      if (_selectedImage4 != null)
                        Visibility(
                          visible: isImage4AVisible,
                          replacement: const SizedBox(
                            height: double.infinity,
                            width: double.infinity,
                          ),
                          child: Positioned(
                            top: _top4,
                            left: _left4,
                            child: GestureDetector(
                              onPanUpdate: (details) {
                                _top4 = max(0, _top4 + details.delta.dy);
                                _left4 = max(0, _left4 + details.delta.dx);
                                setState(() {});
                              },
                              child: Image.file(_selectedImage4!),
                            ),
                          ),
                        ),
                      if (_selectedImage5 != null)
                        Visibility(
                          visible: isImage5AVisible,
                          replacement: const SizedBox(
                            height: double.infinity,
                            width: double.infinity,
                          ),
                          child: Positioned(
                            top: _top5,
                            left: _left5,
                            child: GestureDetector(
                              onPanUpdate: (details) {
                                _top5 = max(0, _top5 + details.delta.dy);
                                _left5 = max(0, _left5 + details.delta.dx);
                                setState(() {});
                              },
                              child: Image.file(_selectedImage5!),
                            ),
                          ),
                        ),
                      // gambar 1,2,3,4, dan 5 B.
                      if (_selectedImage2 != null)
                        Visibility(
                          visible: isImage1BVisible,
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
                          visible: isImage2BVisible,
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
                      if (_selectedImage3 != null)
                        Visibility(
                          visible: isImage3BVisible,
                          replacement: const SizedBox(
                            height: double.infinity,
                            width: double.infinity,
                          ),
                          child: Positioned(
                            top: _top3,
                            left: _left3,
                            child: GestureDetector(
                              onPanUpdate: (details) {
                                _top3 = max(0, _top3 + details.delta.dy);
                                _left3 = max(0, _left3 + details.delta.dx);
                                setState(() {});
                              },
                              child: Image.file(_selectedImage3!),
                            ),
                          ),
                        ),
                      if (_selectedImage4 != null)
                        Visibility(
                          visible: isImage4BVisible,
                          replacement: const SizedBox(
                            height: double.infinity,
                            width: double.infinity,
                          ),
                          child: Positioned(
                            top: _top4,
                            left: _left4,
                            child: GestureDetector(
                              onPanUpdate: (details) {
                                _top4 = max(0, _top4 + details.delta.dy);
                                _left4 = max(0, _left4 + details.delta.dx);
                                setState(() {});
                              },
                              child: Image.file(_selectedImage4!),
                            ),
                          ),
                        ),
                      if (_selectedImage5 != null)
                        Visibility(
                          visible: isImage5BVisible,
                          replacement: const SizedBox(
                            height: double.infinity,
                            width: double.infinity,
                          ),
                          child: Positioned(
                            top: _top5,
                            left: _left5,
                            child: GestureDetector(
                              onPanUpdate: (details) {
                                _top5 = max(0, _top5 + details.delta.dy);
                                _left5 = max(0, _left5 + details.delta.dx);
                                setState(() {});
                              },
                              child: Image.file(_selectedImage5!),
                            ),
                          ),
                        ),
                      // gambar 1,2,3,4, dan 5 C.
                      if (_selectedImage3 != null)
                        Visibility(
                          visible: isImage1CVisible,
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
                      if (_selectedImage3 != null)
                        Visibility(
                          visible: isImage2CVisible,
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
                      if (_selectedImage3 != null)
                        Visibility(
                          visible: isImage3CVisible,
                          replacement: const SizedBox(
                            height: double.infinity,
                            width: double.infinity,
                          ),
                          child: Positioned(
                            top: _top3,
                            left: _left3,
                            child: GestureDetector(
                              onPanUpdate: (details) {
                                _top3 = max(0, _top3 + details.delta.dy);
                                _left3 = max(0, _left3 + details.delta.dx);
                                setState(() {});
                              },
                              child: Image.file(_selectedImage3!),
                            ),
                          ),
                        ),
                      if (_selectedImage4 != null)
                        Visibility(
                          visible: isImage4CVisible,
                          replacement: const SizedBox(
                            height: double.infinity,
                            width: double.infinity,
                          ),
                          child: Positioned(
                            top: _top4,
                            left: _left4,
                            child: GestureDetector(
                              onPanUpdate: (details) {
                                _top4 = max(0, _top4 + details.delta.dy);
                                _left4 = max(0, _left4 + details.delta.dx);
                                setState(() {});
                              },
                              child: Image.file(_selectedImage4!),
                            ),
                          ),
                        ),
                      if (_selectedImage5 != null)
                        Visibility(
                          visible: isImage5CVisible,
                          replacement: const SizedBox(
                            height: double.infinity,
                            width: double.infinity,
                          ),
                          child: Positioned(
                            top: _top5,
                            left: _left5,
                            child: GestureDetector(
                              onPanUpdate: (details) {
                                _top5 = max(0, _top5 + details.delta.dy);
                                _left5 = max(0, _left5 + details.delta.dx);
                                setState(() {});
                              },
                              child: Image.file(_selectedImage5!),
                            ),
                          ),
                        ),
                      // gambar 1,2,3,4, dan 5 D.
                      if (_selectedImage4 != null)
                        Visibility(
                          visible: isImage1DVisible,
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
                      if (_selectedImage4 != null)
                        Visibility(
                          visible: isImage2DVisible,
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
                      if (_selectedImage4 != null)
                        Visibility(
                          visible: isImage3DVisible,
                          replacement: const SizedBox(
                            height: double.infinity,
                            width: double.infinity,
                          ),
                          child: Positioned(
                            top: _top3,
                            left: _left3,
                            child: GestureDetector(
                              onPanUpdate: (details) {
                                _top3 = max(0, _top3 + details.delta.dy);
                                _left3 = max(0, _left3 + details.delta.dx);
                                setState(() {});
                              },
                              child: Image.file(_selectedImage3!),
                            ),
                          ),
                        ),
                      if (_selectedImage4 != null)
                        Visibility(
                          visible: isImage4DVisible,
                          replacement: const SizedBox(
                            height: double.infinity,
                            width: double.infinity,
                          ),
                          child: Positioned(
                            top: _top4,
                            left: _left4,
                            child: GestureDetector(
                              onPanUpdate: (details) {
                                _top4 = max(0, _top4 + details.delta.dy);
                                _left4 = max(0, _left4 + details.delta.dx);
                                setState(() {});
                              },
                              child: Image.file(_selectedImage4!),
                            ),
                          ),
                        ),
                      if (_selectedImage5 != null)
                        Visibility(
                          visible: isImage5DVisible,
                          replacement: const SizedBox(
                            height: double.infinity,
                            width: double.infinity,
                          ),
                          child: Positioned(
                            top: _top5,
                            left: _left5,
                            child: GestureDetector(
                              onPanUpdate: (details) {
                                _top5 = max(0, _top5 + details.delta.dy);
                                _left5 = max(0, _left5 + details.delta.dx);
                                setState(() {});
                              },
                              child: Image.file(_selectedImage5!),
                            ),
                          ),
                        ),
                      // gambar 1,2,3,4, dan 5 E.
                      if (_selectedImage5 != null)
                        Visibility(
                          visible: isImage1EVisible,
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
                      if (_selectedImage5 != null)
                        Visibility(
                          visible: isImage2EVisible,
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
                      if (_selectedImage5 != null)
                        Visibility(
                          visible: isImage3EVisible,
                          replacement: const SizedBox(
                            height: double.infinity,
                            width: double.infinity,
                          ),
                          child: Positioned(
                            top: _top3,
                            left: _left3,
                            child: GestureDetector(
                              onPanUpdate: (details) {
                                _top3 = max(0, _top3 + details.delta.dy);
                                _left3 = max(0, _left3 + details.delta.dx);
                                setState(() {});
                              },
                              child: Image.file(_selectedImage3!),
                            ),
                          ),
                        ),
                      if (_selectedImage5 != null)
                        Visibility(
                          visible: isImage4EVisible,
                          replacement: const SizedBox(
                            height: double.infinity,
                            width: double.infinity,
                          ),
                          child: Positioned(
                            top: _top4,
                            left: _left4,
                            child: GestureDetector(
                              onPanUpdate: (details) {
                                _top4 = max(0, _top4 + details.delta.dy);
                                _left4 = max(0, _left4 + details.delta.dx);
                                setState(() {});
                              },
                              child: Image.file(_selectedImage4!),
                            ),
                          ),
                        ),
                      if (_selectedImage5 != null)
                        Visibility(
                          visible: isImage5EVisible,
                          replacement: const SizedBox(
                            height: double.infinity,
                            width: double.infinity,
                          ),
                          child: Positioned(
                            top: _top5,
                            left: _left5,
                            child: GestureDetector(
                              onPanUpdate: (details) {
                                _top5 = max(0, _top5 + details.delta.dy);
                                _left5 = max(0, _left5 + details.delta.dx);
                                setState(() {});
                              },
                              child: Image.file(_selectedImage5!),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            )
          : const Center(
              child: Text(
              "Tidak ada gambar, silakan impor sebuah gambar",
              style: TextStyle(color: Colors.black54),
            )),
      floatingActionButton: Stack(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (_selectedImage1 == null)
              ElevatedButton(
                onPressed: () {
                  _pickImageFromGallery1();
                },
                child: const Text("Impor gambar 1"),
              ),
            if (_selectedImage1 != null)
              ElevatedButton(
                onPressed: () => saveToGallery(context),
                child: const Text("Simpan"),
              ),
            if (_selectedImage1 != null)
              Container(
                margin: const EdgeInsets.all(5),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isFilePicked = false;

                      _selectedImage1 = null;
                      _selectedImage2 = null;
                      _selectedImage3 = null;
                      _selectedImage4 = null;
                      _selectedImage5 = null;

                      _top1 = 0;
                      _left1 = 0;
                      _top2 = 0;
                      _left2 = 0;
                      _top3 = 0;
                      _left3 = 0;
                      _top4 = 0;
                      _left4 = 0;
                      _top5 = 0;
                      _left5 = 0;

                      isImage2Existed = !isImage2Existed;
                      isImage3Existed = !isImage3Existed;
                      isImage4Existed = !isImage4Existed;
                      isImage5Existed = !isImage5Existed;
                      // isImage1OnTheTop = !isImage1OnTheTop;
                    });
                  },
                  child: const Text("Hapus"),
                ),
              ),
            if (_selectedImage1 != null)
              Visibility(
                visible: isImage2Existed,
                child: ElevatedButton(
                  onPressed: () {
                    _pickImageFromGallery2();
                    setState(() {
                      isImage2Existed = false;
                    });
                  },
                  child: const Text("Impor gambar 2"),
                ),
              ),
            if (_selectedImage2 != null)
              Visibility(
                visible: isImage3Existed,
                child: ElevatedButton(
                  onPressed: () {
                    _pickImageFromGallery3();
                    setState(() {
                      isImage3Existed = false;
                    });
                  },
                  child: const Text("Impor gambar 3"),
                ),
              ),
            if (_selectedImage3 != null)
              Visibility(
                visible: isImage4Existed,
                child: ElevatedButton(
                  onPressed: () {
                    _pickImageFromGallery4();
                    setState(() {
                      isImage4Existed = false;
                    });
                  },
                  child: const Text("Impor gambar 4"),
                ),
              ),
            if (_selectedImage4 != null)
              Visibility(
                visible: isImage5Existed,
                child: ElevatedButton(
                  onPressed: () {
                    _pickImageFromGallery5();
                    setState(() {
                      isImage5Existed = false;
                    });
                  },
                  child: const Text("Impor gambar 5"),
                ),
              ),
          ],
        ),
      ]),
      backgroundColor: const Color.fromARGB(218, 255, 255, 255),
    );
  }

  saveToGallery(BuildContext context) {
    screenshotController.capture().then((Uint8List? image) {
      saveImage(image!);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Berhasil disimpan!"),
        ),
      );
      // ignore: invalid_return_type_for_catch_error, avoid_print
    }).catchError((err) => print(err));
  }

  saveImage(Uint8List bytes) async {
    final time = DateTime.now()
        .toIso8601String()
        .replaceAll('.', '-')
        .replaceAll(';', '-');
    final name = "screenshot_$time";
    await requestPermission(Permission.storage);
    await ImageGallerySaver.saveImage(bytes, name: name);
  }

  Future<bool> requestPermission(Permission permission) async {
    if (await permission.isGranted) {
      return true;
    } else {
      var result = await permission.request();
      if (result == PermissionStatus.granted) {
        return true;
      }
    }
    return false;
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

  Future _pickImageFromGallery3() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage == null) return;
    setState(() {
      _selectedImage3 = File(returnedImage.path);
    });
  }

  Future _pickImageFromGallery4() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage == null) return;
    setState(() {
      _selectedImage4 = File(returnedImage.path);
    });
  }

  Future _pickImageFromGallery5() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage == null) return;
    setState(() {
      _selectedImage5 = File(returnedImage.path);
    });
  }
}
