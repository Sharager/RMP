import 'package:flutter/material.dart';

class InfinityList extends StatelessWidget {
  const InfinityList({super.key});

  static const routeName = '/infinity';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Список элементов')),
      body: ListView.builder(
        itemCount: null,
        itemBuilder: (context, index) {
          return ListTile(title: Text('строка $index'));
        },
      ),
    );
  }
}