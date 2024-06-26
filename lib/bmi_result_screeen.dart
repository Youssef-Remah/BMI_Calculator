import 'package:flutter/material.dart';

class BMIResultScreen extends StatelessWidget {
  const BMIResultScreen(
      {super.key,
      required this.isMale,
      required this.ageValue,
      required this.bmiResult});

  final bool isMale;

  final int ageValue;

  final double bmiResult;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Gender: ${(isMale) ? 'Male' : 'Female'}',
              style: const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Text(
              'Age: $ageValue',
              style: const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Text(
              'BMI Result: ${bmiResult.round()}',
              style: const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
