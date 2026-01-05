import 'package:flutter/material.dart';

class ParallelogramPage extends StatefulWidget {
  const ParallelogramPage({super.key});

  @override
  State<ParallelogramPage> createState() => ParallelogramPageState();
}

class ParallelogramPageState extends State<ParallelogramPage> {
  double  _d1 = 0 , _d2=0, _z1=0;

  final TextEditingController _d11 = TextEditingController();
  final TextEditingController _d22 = TextEditingController();

  final InputDecoration _textFieldStyle = InputDecoration(
    filled: true,
    fillColor: Color(0xffE8F9FF),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
    ),
  );

void _Parallelogram(){
  _d1 = double.tryParse(_d11.text) ?? 0;
  _d2 = double.tryParse(_d22.text) ?? 0;

  setState(() {
    _z1 = 2*(_d1+_d2);

  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perimeter of a Parallelogram'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const Icon(
                Icons.crop_square,
                size: 80,
                color: Color(0xff003285),
              ),
              const SizedBox(height: 20),

              /// แสดงผลลัพธ์
              Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(
                        "กว้าง $_d2 ม. × ยาว $_d1 ม.",
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "พื้นที่ = $_z1 ตร.ม.",
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xff003285),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),

              /// ความกว้าง
              TextField(
                controller: _d11,
                keyboardType: TextInputType.number,
                decoration: _textFieldStyle.copyWith(
                  labelText: "ความกว้าง (เมตร)",
                  prefixIcon: const Icon(Icons.straighten),
                ),
              ),

              const SizedBox(height: 20),

              /// ความยาว
              TextField(
                controller: _d22,
                keyboardType: TextInputType.number,
                decoration: _textFieldStyle.copyWith(
                  labelText: "ความยาว (เมตร)",
                  prefixIcon: const Icon(Icons.straighten),
                ),
              ),

              const SizedBox(height: 30),

              /// ปุ่มคำนวณ
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _Parallelogram,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    backgroundColor: const Color(0xff003285),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: const Text(
                    "คำนวณพื้นที่",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
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
