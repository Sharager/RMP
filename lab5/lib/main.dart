import 'package:flutter/material.dart';
import 'simple_list.dart';
import 'infinity_list.dart';
import 'infinity_math_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Списки в Flutter',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Лабораторная работа 5')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SimpleList()),
                );
              },
              child: const Text('Простой список'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const InfinityList()),
                );
              },
              child: const Text('Бесконечный список'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const InfinityMathList()),
                );
              },
              child: const Text('Степени двойки'),
            ),
          ],
        ),
      ),
    );
  }
}