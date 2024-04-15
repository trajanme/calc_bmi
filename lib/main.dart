import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Calc BMI',
        home: Scaffold(
            appBar: AppBar(
              title: const Text('BMIを計算するよ'),
            ),
            body: const Home()));
  }
}

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double? height;
    double? weight;
    double? bmi;

    return SingleChildScrollView(
      child: Column(children: [
        TextField(
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^\d+(.\d*)?$'))
          ],
          decoration: const InputDecoration(
              labelText: 'Height', hintText: '150.0', icon: Icon(Icons.person)),
          onChanged: (aHeight) {
            height = double.tryParse(aHeight) ?? 0.0;
          },
        ),
        TextField(
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^\d+(.\d*)?$'))
          ],
          decoration: const InputDecoration(
              labelText: 'Weight', hintText: '50.0', icon: Icon(Icons.speed)),
          onChanged: (aWeight) {
            weight = double.tryParse(aWeight) ?? 0.0;
          },
        ),
        ElevatedButton(
            onPressed: () {
              double w = weight ?? 0;
              double h = height ?? 0;
              if (h != 0) {
                bmi = w / (pow(h, 2) / 10000);
                print('$height : $weight : $bmi');
              } else {
                bmi = 0;
              }
            },
            child: const Text('計算')),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '私のBMIは',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '$bmi',
              style: const TextStyle(fontSize: 30),
            ),
            const Text(
              'です',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ]),
    );
  }
}
