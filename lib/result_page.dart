import 'package:flutter/material.dart';
import 'package:flutter_application_bmi_calculator/input_page.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {required this.interpretation,
      required this.bmiResult,
      required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 51, 51, 51),
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
                // style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              margin: EdgeInsets.only(left: 15.0, right: 15, bottom: 20),
              color: Colors.white12,
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Text(
                    "STATUS",
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                    // style: kResultTextStyle,
                  ),
                  Text(
                    resultText.toUpperCase(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                    // style: kResultTextStyle,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    bmiResult,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 80,
                        fontWeight: FontWeight.bold),
                    // style: kBMITextStyle,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.red,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                    // style: kBodyTextStyle,
                  ),
                ],
              ),
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
                    builder: (context) => InputPage(),
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
                  'Re-Calculate',
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
