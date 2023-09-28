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
          ? Screenshot(
              controller: screenshotController,
              child: Stack(
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
              ),
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
                onPressed: () => saveToGallery(context),
                child: const Text("Simpan"),
              ),
              Container(
                margin: const EdgeInsets.all(5),
                child: ElevatedButton(
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
}
