import 'package:flutter/material.dart';

class RectanglePege extends StatefulWidget {
  const RectanglePege({super.key});

  @override
  State<RectanglePege> createState() => RectanglePegeState();
}

class RectanglePegeState extends State<RectanglePege> {
  int _width = 0, _length = 0;
  int _area = 0;

  final TextEditingController _widthCtrl = TextEditingController();
  final TextEditingController _lengthCtrl = TextEditingController();

  final InputDecoration _textFieldStyle = InputDecoration(
    filled: true,
    fillColor: Color(0xffE8F9FF),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
    ),
  );

  void _calRectangle() {
    _width = int.tryParse(_widthCtrl.text) ?? 0;
    _length = int.tryParse(_lengthCtrl.text) ?? 0;

    setState(() {
      _area = _width * _length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("คำนวณพื้นที่สี่เหลี่ยม"),
        centerTitle: true,
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
                        "กว้าง $_width ม. × ยาว $_length ม.",
                        style: const TextStyle(fontSize: 20),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "พื้นที่ = $_area ตร.ม.",
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
                controller: _widthCtrl,
                keyboardType: TextInputType.number,
                decoration: _textFieldStyle.copyWith(
                  labelText: "ความกว้าง (เมตร)",
                  prefixIcon: const Icon(Icons.straighten),
                ),
              ),

              const SizedBox(height: 20),

              /// ความยาว
              TextField(
                controller: _lengthCtrl,
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
                  onPressed: _calRectangle,
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
