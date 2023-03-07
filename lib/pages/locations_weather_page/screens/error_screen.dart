import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.grey,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.wifi_off),
            SizedBox(height: 20),
            Text(
              'Нет подключения к сети, прогноз недоступен',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
