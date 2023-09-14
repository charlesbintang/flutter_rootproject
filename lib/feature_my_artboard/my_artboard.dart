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
      body: const ArtboardWidget(),
    );
  }
}

class ArtboardWidget extends StatelessWidget {
  const ArtboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomPaint(
        painter: MyCustomPainter(),
        child: Container(
          // Isi dengan widget lain yang ingin Anda letakkan di atas artboard
          height: 700,
          width: 350,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'lib/assets/images/Screenshot_2023-09-10_23-57-11.png'),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}

class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Gunakan objek canvas untuk menggambar elemen-elemen Anda di sini
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 2;

    // Contoh menggambar garis dari sudut kiri atas ke sudut kanan bawah
    canvas.drawLine(const Offset(0, 0), Offset(size.width, size.height), paint);
    // canvas.drawLine(const Offset(0, 0), Offset(size.width, size.height), paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // Return true jika Anda ingin menggambar ulang ketika ada perubahan
    return false;
  }
}
