import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';
import 'package:calc_bmi/result.dart';

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
              title: const Text('BMI計算アプリ'),
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
    double bmi;

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
              bmi = 0.0;
              double w = weight ?? 0;
              double h = height ?? 0;
              if (h != 0 && w != 0) {
                bmi = w / (pow(h, 2) / 10000);
                debugPrint('$height : $weight : $bmi');
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Result(bmi: bmi)));
              } else {
                bmi = 0;
              }
            },
            child: const Text('計算')),
      ]),
    );
  }
}
