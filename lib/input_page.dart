import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_bmi_calculator/result_page.dart';

class InputPage extends StatefulWidget {
  InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

enum Gender {
  male,
  female,
}

class IconContent extends StatelessWidget {
  IconContent({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        SizedBox(
          height: 5.0,
        ),
        Icon(
          icon,
          size: 40.0,
          color: Colors.white,
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          label,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        SizedBox(
          height: 5.0,
        ),
      ],
    );
  }
}

class _InputPageState extends State<InputPage> {
  // Gender? selectedGender;
  Gender? selectedGender = Gender.male;
  int height = 180;
  int weight = 60;
  int age = 20;

  double _bmi = 0.0;

  String calculateBMI() {
    _bmi = weight / pow(height / 100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if (_bmi >= 25) {
      return 'Overweight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else {
      return 'Underweight';
    }
  }

  String getInterpretation() {
    if (_bmi >= 25) {
      return 'You have a higher than normal body weight. Try to exercise more.';
    } else if (_bmi >= 18.5) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 51, 51, 51),
      appBar: AppBar(
        leading: Icon(Icons.line_weight),
        title: Text(
          'Abdul BMI Calculator',
          textAlign: TextAlign.center,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Container(
                    // color: Colors.grey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    // Toggle light when tapped.
                                    selectedGender = Gender.male;
                                  });
                                },
                                child: Container(
                                  child: IconContent(
                                    icon: Icons.male,
                                    label: 'MALE',
                                  ),
                                  margin: EdgeInsets.all(15.0),
                                  decoration: BoxDecoration(
                                    color: selectedGender == Gender.male
                                        ? Colors.white12
                                        : Colors.black12,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    // Toggle light when tapped.
                                    selectedGender = Gender.female;
                                  });
                                },
                                child: Container(
                                  child: IconContent(
                                    icon: Icons.female,
                                    label: 'FEMALE',
                                  ),
                                  margin: EdgeInsets.all(15.0),
                                  decoration: BoxDecoration(
                                    color: selectedGender == Gender.female
                                        ? Colors.white12
                                        : Colors.black12,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Container(
                    // color: Colors.green,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 250,
                          width: double.infinity,
                          child: Image.network(
                            selectedGender == Gender.male
                                ? "https://cdn130.picsart.com/339409155001211.png"
                                : "https://www.pngall.com/wp-content/uploads/4/Deep-Thinking-Woman-PNG-Free-Download.png",
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              // color: Colors.blue,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                      child: GestureDetector(
                    onTap: () {
                      setState(() {
                        // Toggle light when tapped.
                        selectedGender == Gender.female;
                      });
                    },
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'HEIGHT',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 15.0,
                                fontWeight: FontWeight.normal),
                            // style: kLabelTextStyle,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                height.toString(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "/cm",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              inactiveTrackColor: Color(0xFF8D8E98),
                              activeTrackColor: Colors.white,
                              thumbColor: Colors.red,
                              overlayColor: Color(0x29EB1555),
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 15.0),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 30.0),
                            ),
                            child: Slider(
                              value: height.toDouble(),
                              min: 100.0,
                              max: 220.0,
                              onChanged: (double newValue) {
                                setState(() {
                                  height = newValue.round();
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        color: Colors.white12,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  )),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  child: Container(
                    // color: Colors.yellow,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Expanded(
                            child: GestureDetector(
                          onTap: () {
                            setState(() {
                              // Toggle light when tapped.
                              selectedGender == Gender.female;
                            });
                          },
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'WEIGHT',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.normal),
                                  // style: kLabelTextStyle,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      weight.toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      " /Kg",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    RawMaterialButton(
                                      elevation: 0.0,
                                      child: Icon(
                                        Icons.exposure_minus_1,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          weight--;
                                        });
                                      },
                                      constraints: BoxConstraints.tightFor(
                                        width: 40.0,
                                        height: 40.0,
                                      ),
                                      shape: CircleBorder(),
                                      fillColor: Colors.red,
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    RawMaterialButton(
                                      elevation: 0.0,
                                      child: Icon(
                                        Icons.plus_one,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          weight++;
                                        });
                                      },
                                      constraints: BoxConstraints.tightFor(
                                        width: 40.0,
                                        height: 40.0,
                                      ),
                                      shape: CircleBorder(),
                                      fillColor: Colors.red,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            margin: EdgeInsets.all(15.0),
                            decoration: BoxDecoration(
                              color: Colors.white12,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        )),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    // color: Colors.grey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                            child: GestureDetector(
                          onTap: () {
                            setState(() {
                              // Toggle light when tapped.
                              selectedGender == Gender.female;
                            });
                          },
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'AGE',
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.normal),

                                  // style: kLabelTextStyle,
                                ),
                                SizedBox(
                                  height: 10,
                                ),

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      age.toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "/years",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                // Text(
                                //   age.toString() + "/years",
                                //   style: TextStyle(
                                //       fontSize: 30.0,
                                //       fontWeight: FontWeight.bold),
                                // ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    RawMaterialButton(
                                      elevation: 0.0,
                                      child: Icon(
                                        Icons.exposure_minus_1,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          age--;
                                        });
                                      },
                                      constraints: BoxConstraints.tightFor(
                                        width: 40.0,
                                        height: 40.0,
                                      ),
                                      shape: CircleBorder(),
                                      fillColor: Colors.red,
                                    ),
                                    SizedBox(
                                      width: 10.0,
                                    ),
                                    RawMaterialButton(
                                      elevation: 0.0,
                                      child: Icon(
                                        Icons.plus_one,
                                        color: Colors.white,
                                      ),
                                      onPressed: () {
                                        setState(() {
                                          age++;
                                        });
                                      },
                                      constraints: BoxConstraints.tightFor(
                                        width: 40.0,
                                        height: 40.0,
                                      ),
                                      shape: CircleBorder(),
                                      fillColor: Colors.red,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            margin: EdgeInsets.all(15.0),
                            decoration: BoxDecoration(
                              color: Colors.white12,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Material(
            color: Colors.red,
            borderRadius: BorderRadius.circular(15),
            child: InkWell(
              hoverColor: Colors.orange,
              splashColor: Colors.red,
              focusColor: Colors.yellow,
              highlightColor: Colors.red[900],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      bmiResult: calculateBMI(),
                      resultText: getResult(),
                      interpretation: getInterpretation(),
                    ),
                  ),
                );
              },
              borderRadius: BorderRadius.circular(15),
              child: Container(
                width: 200,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Calculate',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
