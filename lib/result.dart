import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  double bmi;
  Result({required this.bmi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI計算アプリ(計算結果)'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            ('BMIは'),
            style: TextStyle(fontSize: 20),
          ),
          Text(
            bmi.toStringAsFixed(1),
            style: const TextStyle(fontSize: 30),
          ),
          const Text(
            'です',
            style: TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }
}
