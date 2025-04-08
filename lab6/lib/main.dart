import 'package:flutter/material.dart';

void main() {
  runApp(const AreaCalculatorApp());
}

class AreaCalculatorApp extends StatelessWidget {
  const AreaCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Калькулятор площади',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const AreaCalculatorScreen(),
    );
  }
}

// Вынесенная функция валидации
String? _validateDimension(String? value) {
  if (value == null || value.isEmpty) {
    return 'Пожалуйста, введите значение';
  }

  final number = double.tryParse(value);
  if (number == null) {
    return 'Введите корректное число';
  }

  if (number <= 0) {
    return 'Число должно быть больше 0';
  }

  return null;
}

class AreaCalculatorScreen extends StatefulWidget {
  const AreaCalculatorScreen({super.key});

  @override
  State<AreaCalculatorScreen> createState() => _AreaCalculatorScreenState();
}

class _AreaCalculatorScreenState extends State<AreaCalculatorScreen> {
  final _formKey = GlobalKey<FormState>();
  final _widthController = TextEditingController();
  final _heightController = TextEditingController();
  String _result = '';

  @override
  void dispose() {
    _widthController.dispose();
    _heightController.dispose();
    super.dispose();
  }

  void _calculateArea() {
    if (_formKey.currentState!.validate()) {
      final width = double.parse(_widthController.text);
      final height = double.parse(_heightController.text);
      final area = width * height;

      setState(() {
        _result = 'S = $width * $height = ${area.toStringAsFixed(2)} (мм²)';
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Успешно вычислено!'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Калькулятор площади')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _widthController,
                decoration: const InputDecoration(labelText: 'Ширина (мм)'),
                keyboardType: TextInputType.number,
                validator: _validateDimension, // Используем вынесенную функцию
              ),
              TextFormField(
                controller: _heightController,
                decoration: const InputDecoration(labelText: 'Высота (мм)'),
                keyboardType: TextInputType.number,
                validator: _validateDimension, // Используем вынесенную функцию
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _calculateArea,
                child: const Text('Вычислить'),
              ),
              if (_result.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(_result, style: const TextStyle(fontSize: 18)),
                ),
            ],
          ),
        ),
      ),
    );
  }
}