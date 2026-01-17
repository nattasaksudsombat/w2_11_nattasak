import 'package:flutter/material.dart';
import 'rectangle_pege.dart';
import 'parallelogram_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Math Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const MyHomePage(),
        '/rectangle': (context) => const RectanglePege(),
        '/parallelogram': (context) => const ParallelogramPage(),
      },
    );
  }
}
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Math Formula'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.calculate,
                size: 80,
                color: Colors.deepPurple,
              ),
              const SizedBox(height: 30),

              // ปุ่มคำนวณพื้นที่สี่เหลี่ยม
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () =>
                      Navigator.pushNamed(context, '/rectangle_pege'),
                  icon: const Icon(Icons.crop_square),
                  label: const Text('คำนวณพื้นที่สี่เหลี่ยม'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // ปุ่มคำนวณเส้นรอบรูปสี่เหลี่ยมด้านขนาน
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () =>
                      Navigator.pushNamed(context, '/parallelogram'),
                  icon: const Icon(Icons.change_history),
                  label: const Text('Perimeter of a Parallelogram'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
