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
      routes: {
        '/': (context) => const MainScreen(),
        '/simple': (context) => const SimpleList(),
        '/infinity': (context) => const InfinityList(),
        '/math': (context) => const InfinityMathList(),
      },
      initialRoute: '/',
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
              onPressed: () => Navigator.pushNamed(context, '/simple'),
              child: const Text('Простой список'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/infinity'),
              child: const Text('Бесконечный список'),
            ),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/math'),
              child: const Text('Степени двойки'),
            ),
          ],
        ),
      ),
    );
  }
}