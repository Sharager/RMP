import 'package:flutter/material.dart';
import 'dart:math';

class InfinityMathList extends StatelessWidget {
  const InfinityMathList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Список элементов')),
      body: ListView.builder(
        itemCount: null, // Бесконечная прокрутка
        itemBuilder: (context, index) {
          return ListTile(title: Text('2^$index = ${pow(2, index)}'));
        },
      ),
    );
  }
}