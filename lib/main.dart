import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const FunnyQuotesApp());
}

class FunnyQuotesApp extends StatelessWidget {
  const FunnyQuotesApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Funny Quotes',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.deepPurple, // ให้ secondary เป็นสี deepPurple
        ),
        useMaterial3: false,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const List<String> quoteList = [
    'ความรักก็เหมือนเล่นเกม ROV ต่อให้ 5 คนทำดี แต่ตำแหน่ง MVP ก็มีแค่คนเดียว',
    'แอลกอฮอล์ถ้าอยู่ในผ้าก๊อซ เอาไว้ล้างแผลกาย แต่ถ้าอยู่ในแก้ว เอาไว้ล้างแผลใจ',
    'ไข่เวลาทอดในกระทะร้อนๆ มันจะดัง "สู้สู้" นะ',
    'เมาคลีล่าสัตว์ แต่เราโสดนะล่าสุด',
    'กความสัมพันธ์ที่ต้องเป็นฝ่ายวิ่งตาม นั่นไม่ได้เรียกว่ารัก นั่นคือรถไอติม',
  ];
  var quote = quoteList[0]; // state variable
  Color randomColor = Colors.pink; // state variable for random color
  String lastQuote = quoteList[0]; // state variable for last displayed quote
  Color lastColor = Colors.pink; // state variable for last displayed color

  void handleClickGo() {
    setState(() {
      var rand = Random();
      var randomIndex = rand.nextInt(quoteList.length);

      // ตรวจสอบว่าข้อความที่สุ่มมาใหม่ไม่ซ้ำกับข้อความที่แสดงล่าสุด
      while (quoteList[randomIndex] == lastQuote) {
        randomIndex = rand.nextInt(quoteList.length);
      }

      quote = quoteList[randomIndex];
      lastQuote = quote; // อัปเดตข้อความที่แสดงล่าสุด

      // ตรวจสอบว่าสีที่สุ่มมาใหม่ไม่ซ้ำกับสีที่แสดงล่าสุด
      Color newColor = _getRandomColor();
      while (newColor == lastColor) {
        newColor = _getRandomColor();
      }

      randomColor = newColor;
      lastColor = randomColor; // อัปเดตสีที่แสดงล่าสุด
    });
  }

  // Function to get a random color
  Color _getRandomColor() {
    List<Color> colors = [
      Colors.pink,
      Colors.orange,
      Colors.yellow,
      Colors.green,
      Colors.blue,
      Colors.purple,
    ];

    var rand = Random();
    var randomIndex = rand.nextInt(colors.length);
    return colors[randomIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('kumkomsudfiao')),
      floatingActionButton: FloatingActionButton(
        onPressed: handleClickGo,
        child: const Center(
          child: Text(
            'คำคมต่อไป',
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Text(
            quote,
            style: TextStyle(
              color: randomColor,
              fontSize: 40,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}








