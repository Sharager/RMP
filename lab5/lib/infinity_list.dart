import 'package:flutter/material.dart';

class InfinityList extends StatelessWidget {
  const InfinityList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Список элементов')),
      body: ListView.builder(
        itemCount: null, // Бесконечная прокрутка
        itemBuilder: (context, index) {
          return ListTile(title: Text('строка $index'));
        },
      ),
    );
  }
}