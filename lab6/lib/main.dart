import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Калькулятор площади',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AreaCalculator(),
    );
  }
}

class AreaCalculator extends StatefulWidget {
  const AreaCalculator({super.key});

  @override
  State<AreaCalculator> createState() => _AreaCalculatorState();
}

class _AreaCalculatorState extends State<AreaCalculator> {
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
        _result = 'S = $width * $height = ${area.toStringAsFixed(0)} (мм²)';
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Форма успешно заполнена'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Калькулятор площади'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Ширина (мм):',
                style: TextStyle(fontSize: 20.0),
              ),
              TextFormField(
                controller: _widthController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста, введите ширину';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Введите корректное число';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              const Text(
                'Высота (мм):',
                style: TextStyle(fontSize: 20.0),
              ),
              TextFormField(
                controller: _heightController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Пожалуйста, введите высоту';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Введите корректное число';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              Center(
                child: ElevatedButton(
                  onPressed: _calculateArea,
                  child: const Text('Вычислить'),
                ),
              ),
              const SizedBox(height: 20.0),
              if (_result.isNotEmpty)
                Center(
                  child: Text(
                    _result,
                    style: const TextStyle(fontSize: 20.0),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}