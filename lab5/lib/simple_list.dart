import 'package:flutter/material.dart';

class SimpleList extends StatelessWidget {
  const SimpleList({super.key});

  static const routeName = '/simple';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Простой список'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        children: const [
          ListTile(title: Text('Элемент списка 1')),
          ListTile(title: Text('Элемент списка 2')),
          ListTile(title: Text('Элемент списка 3')),
          Divider(),
          ListTile(title: Text('Элемент списка 4')),
        ],
      ),
    );
  }
}