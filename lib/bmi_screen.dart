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
        title: Text('BMI Calculator'),
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
                    child: Column(
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
              SizedBox(
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
                    child: Column(
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
              Text(
                'HEIGHT',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
              ),
              SizedBox(
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
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
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
                      Text(
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
              SizedBox(
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
                      Text(
                        'AGE',
                        style: TextStyle(
                            fontSize: 25.0, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${ageValue}',
                        style: TextStyle(
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
                            child: Icon(Icons.remove),
                            mini: true,
                            heroTag: 'age-',
                          ),
                          FloatingActionButton(
                            mini: true,
                            onPressed: () {
                              setState(() {
                                ageValue++;
                              });
                            },
                            child: Icon(Icons.add),
                            heroTag: 'age+',
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
        child: Text(
          'Calculate',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
      ),
    );
  }
}
