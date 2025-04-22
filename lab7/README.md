import 'package:flutter/material.dart';

void main() {
runApp(const MyApp());
}

class MyApp extends StatelessWidget {
const MyApp({super.key});

@override
Widget build(BuildContext context) {
return MaterialApp(
title: 'Навигация и передача данных',
initialRoute: '/first',
routes: {
'/first': (context) => const FirstScreen(),
'/second': (context) => const SecondScreen(),
},
theme: ThemeData(
primarySwatch: Colors.blue,
),
);
}
}

class FirstScreen extends StatelessWidget {
const FirstScreen({super.key});

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: const Text('Первый экран'),
),
body: Center(
child: ElevatedButton(
onPressed: () async {
final result = await Navigator.pushNamed(context, '/second');
if (result != null) {
ScaffoldMessenger.of(context).showSnackBar(
SnackBar(
content: Text('Выбрано: $result'),
backgroundColor: Colors.green,
duration: const Duration(seconds: 2),
),
);
}
},
child: const Text('Перейти к выбору'),
),
),
);
}
}

class SecondScreen extends StatelessWidget {
const SecondScreen({super.key});

@override
Widget build(BuildContext context) {
return Scaffold(
appBar: AppBar(
title: const Text('Второй экран'),
),
body: Center(
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [
const Text(
'Выберите вариант:',
style: TextStyle(fontSize: 20),
),
const SizedBox(height: 20),
ElevatedButton(
onPressed: () => Navigator.pop(context, 'Да'),
style: ElevatedButton.styleFrom(
backgroundColor: Colors.green,
padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
),
child: const Text('Да', style: TextStyle(fontSize: 18)),
),
const SizedBox(height: 15),
ElevatedButton(
onPressed: () => Navigator.pop(context, 'Нет'),
style: ElevatedButton.styleFrom(
backgroundColor: Colors.red,
padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
),
child: const Text('Нет', style: TextStyle(fontSize: 18)),
),
],
),
),
);
}
}