import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Text('Metric'),
                Text('Imperial')
              ],
            ),
            title: const Text('BMI App'),
          ),
          body: const TabBarView(
            children: [BMICalculator(), BMICalculator1()],
          ),
        ),
      ),
    );
  }
}

class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  double bmi = 0.0;

  bool showBmi = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Metric BMI Calculator'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Height in cm',
              ),
              controller: heightController,
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Weight in kg',
              ),
              controller: weightController,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  double height = double.parse(heightController.text);
                  double weight = double.parse(weightController.text);
                  bmi = (weight / (height * height)) * 10000;
                  showBmi = true;
                });
              },
              style: ElevatedButton.styleFrom(
                elevation: 5, // Elevation
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24), // Button padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Button border radius
                ),
              ),
              child: Text(
                'Calculate',
                style: TextStyle(
                  fontSize: 24,
                ),
              ),
            ),

            const SizedBox(
              height: 20,
            ),
            showBmi
                ? Text(
                    "bmi: " + bmi.toStringAsFixed(2),
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}



class BMICalculator1 extends StatefulWidget {
  const BMICalculator1({super.key});

  @override
  State<BMICalculator1> createState() => _BMICalculatorState1();
}

class _BMICalculatorState1 extends State<BMICalculator1> {
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();

  double bmi = 0.0;

  bool showBmi = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Imperial BMI Calculator'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Height in inch',
              ),
              controller: heightController,
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter Weight in pounds',
              ),
              controller: weightController,
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  double height = double.parse(heightController.text);
                  double weight = double.parse(weightController.text);
                  bmi = (weight / (height * height)) * 703;
                  showBmi = true;
                });
              },
              style: ElevatedButton.styleFrom(
                elevation: 5, // Elevation
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24), // Button padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Button border radius
                ),
              ),
              child: const Text(
                'Calculate',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            showBmi
                ? Text(
                    "bmi: " + bmi.toStringAsFixed(2),
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  )
                : const SizedBox(),
          ],
        ),
      ),
    );
  }
}