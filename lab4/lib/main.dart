import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:share_plus/share_plus.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Общежития КубГАУ',
      theme: ThemeData(
        primarySwatch: Colors.green,
        appBarTheme: const AppBarTheme(
          color: Colors.green,
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
      home: const DormitoryScreen(),
    );
  }
}

class DormitoryScreen extends StatefulWidget {
  const DormitoryScreen({super.key});

  @override
  State<DormitoryScreen> createState() => _DormitoryScreenState();
}

class _DormitoryScreenState extends State<DormitoryScreen> {
  bool _isFavorite = false;
  int _likeCount = 1;

  Future<void> _makePhoneCall() async {
    const phoneNumber = 'tel:+78612602260';
    if (await canLaunchUrl(Uri.parse(phoneNumber))) {
      await launchUrl(Uri.parse(phoneNumber));
    }
  }

  Future<void> _openMaps() async {
    const url = 'https://yandex.ru/maps/35/krasnodar/?ll=38.920741%2C45.050329&mode=routes&rtext=~45.050282%2C38.920690&rtt=auto&ruri=~ymapsbm1%3A%2F%2Forg%3Foid%3D87985623421&z=17';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    }
  }

  Future<void> _shareInfo() async {
    await Share.share('Общежитие №20 КубГАУ: Краснодар, ул. Калинина, 13');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Общежития КубГАУ'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/images/campus.jpg',
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                color: Colors.grey[200],
                height: 200,
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.error, color: Colors.red, size: 40),
                      SizedBox(height: 8),
                      Text('Изображение не найдено'),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Общежитие №20',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Краснодар, ул. Калинина, 13',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),

                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        _isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: _isFavorite ? Colors.red : Colors.grey,
                        size: 30,
                      ),
                      onPressed: () {
                        setState(() {
                          _isFavorite = !_isFavorite;
                          _isFavorite ? _likeCount++ : _likeCount--;
                        });
                      },
                    ),
                    Text(
                      '$_likeCount',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildActionButton(
                  icon: Icons.call,
                  label: 'Позвонить',
                  onPressed: _makePhoneCall,
                ),
                _buildActionButton(
                  icon: Icons.directions,
                  label: 'Маршрут',
                  onPressed: _openMaps,
                ),
                _buildActionButton(
                  icon: Icons.share,
                  label: 'Поделиться',
                  onPressed: _shareInfo,
                ),
              ],
            ),
            const SizedBox(height: 24),

            const Text(
              'Студенческий городок или так называемый кампус Кубанского ГАУ состоит '
                  'из двадцати общежитий, в которых проживает более 8000 студентов, что составляет '
                  '96% от всех нуждающихся. Студенты первого курса обеспечены местами в общежитии полностью. '
                  'В соответствии с Положением о студенческих общежитиях университета, при поселении между '
                  'администрацией и студентами заключается договор найма жилого помещения. Воспитательная работа '
                  'в общежитиях направлена на улучшение быта, соблюдение правил внутреннего распорядка, отсутствия '
                  'асоциальных явлений в молодежной среде. Условия проживания в общежитиях университетского кампуса '
                  'полностью отвечают санитарным нормам и требованиям: наличие оборудованных кухонь, душевых комнат, '
                  'прачечных, читальных залов, комнат самоподготовки, помещений для заседаний студенческих советов и '
                  'наглядной агитации. С целью улучшения условий быта студентов активно работает система студенческого '
                  'самоуправления - студенческие советы организуют всю работу по самообслуживанию.',
              textAlign: TextAlign.justify,
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onPressed,
  }) {
    return Column(
      children: [
        IconButton(
          icon: Icon(icon, size: 32),
          color: Colors.green,
          onPressed: onPressed,
        ),
        Text(label),
      ],
    );
  }
}