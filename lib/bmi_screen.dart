import 'dart:math';

import 'package:bmi_calculator/bmi_result_screeen.dart';
import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  bool isMale = false, isFemale = false;

  double heightValue = 180.0;

  int weightValue = 40, ageValue = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        children: [
          genderSelection(),
          heightSelection(),
          weightAndAgeSelection(),
          calculationButton(),
        ],
      ),
    );
  }

  Widget genderSelection() {
    return Expanded(
        flex: 4,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isFemale = false;
                      isMale = true;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: (isMale) ? Colors.blue : Colors.grey[400],
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    width: double.infinity,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image(image: AssetImage('assets/images/male.png')),
                        Text(
                          'MALE',
                          style: TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 25.0,
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isMale = false;
                      isFemale = true;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: (isFemale) ? Colors.blue : Colors.grey[400],
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    width: double.infinity,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image(
                          image: AssetImage('assets/images/female.png'),
                        ),
                        Text(
                          'FEMALE',
                          style: TextStyle(
                              fontSize: 30.0, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget heightSelection() {
    return Expanded(
      flex: 4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.grey[400],
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'HEIGHT',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
              ),
              const SizedBox(
                height: 10.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                textBaseline: TextBaseline.alphabetic,
                children: [
                  Text(
                    '${heightValue.round()}',
                    style:
                        const TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  const Text(
                    'CM',
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 15.0),
                  )
                ],
              ),
              Slider(
                  value: heightValue,
                  min: 80.0,
                  max: 220.0,
                  onChanged: (currentValue) {
                    setState(() {
                      heightValue = currentValue;
                    });
                  }),
            ],
          ),
        ),
      ),
    );
  }

  Widget weightAndAgeSelection() {
    return Expanded(
        flex: 4,
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        'WEIGHT',
                        style: TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${weightValue}',
                        style: TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                weightValue--;
                              });
                            },
                            child: Icon(Icons.remove),
                            mini: true,
                            heroTag: 'weight-',
                          ),
                          FloatingActionButton(
                            mini: true,
                            onPressed: () {
                              setState(() {
                                weightValue++;
                              });
                            },
                            child: Icon(Icons.add),
                            heroTag: 'weight+',
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                width: 25.0,
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[400],
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        'AGE',
                        style: TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '$ageValue',
                        style: const TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            onPressed: () {
                              setState(() {
                                ageValue--;
                              });
                            },
                            mini: true,
                            heroTag: 'age-',
                            child: const Icon(Icons.remove),
                          ),
                          FloatingActionButton(
                            mini: true,
                            onPressed: () {
                              setState(() {
                                ageValue++;
                              });
                            },
                            heroTag: 'age+',
                            child: const Icon(Icons.add),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget calculationButton() {
    return Expanded(
      child: MaterialButton(
        color: Colors.blue,
        minWidth: double.infinity,
        onPressed: () {
          double bmiResult = weightValue / pow(heightValue / 100, 2);

          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BMIResultScreen(
                        isMale: isMale,
                        ageValue: ageValue,
                        bmiResult: bmiResult,
                      )));
        },
        child: const Text(
          'Calculate',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
      ),
    );
  }
}
