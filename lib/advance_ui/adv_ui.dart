import 'package:bmi_cal/advance_ui/advui_result.dart';
import 'package:flutter/material.dart';
import 'package:bmi_cal/logic.dart';
import 'package:simple_ruler_picker/simple_ruler_picker.dart';
import 'package:intl/intl.dart';






enum Gender { male, female }

class AdvanceUI extends StatefulWidget {
  const AdvanceUI({super.key});

  @override
  State<AdvanceUI> createState() => _AdvanceUIState();
}

class _AdvanceUIState extends State<AdvanceUI> {
  int height = 110;
  int weight = 60;
  int age = 32;
  Gender? selectedGender;
  String currentTime = DateFormat("MMM d, yyyy | h:mm a").format(DateTime.now());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000812),
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        backgroundColor: const Color(0xFF2E303C),
        elevation: 0,
      ),
      body: SafeArea(
          child: Padding(
              padding: EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Body mass index BMI is a measure of body fat based on height and weight that applies to adult men and women.",
                  style: TextStyle(
                    fontSize: 20,
                    color: Color(0xFFF5CE0A),
                  ),
                ),
                Row(
                  children: [
                    // Male card
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        },
                        child: Card(
                          color: selectedGender == Gender.male
                              ? Color(0xFFDFBD44) : Color(0xFF2E303C),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.male, size: 60, color: Colors.white),
                                Text('Male',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 20,)
                              ]
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Female card
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        },
                        child: Card(
                          color: selectedGender == Gender.female
                              ? Color(0xFFDFBD44) : Color(0xFF2E303C),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.female, size: 60, color: Colors.white),
                                  Text('Female',
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 20,)
                                ]
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                // Age selection
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //Age card
                            Card(
                              color: const Color(0xFF2E303C),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                            children: [
                                              Text('Age', style: TextStyle(fontSize: 20, color: Colors.white)),
                                              Text('$age', style: TextStyle(fontSize: 43, fontWeight: FontWeight.bold, color: Colors.white)),
                                            ]
                                        ),
                                        Expanded(
                                          child: SimpleRulerPicker(
                                            minValue: 0,
                                            maxValue: 90,
                                            initialValue: 32,
                                            onValueChanged: (value) {
                                              setState(() {
                                                age = value.toInt();
                                              });
                                            },
                                            scaleLabelSize: 0,
                                            scaleBottomPadding: 0,
                                            scaleItemWidth: 12,
                                            longLineHeight: 25,
                                            shortLineHeight: 15,
                                            lineColor: Color(0xFFF5CE0A),
                                            selectedColor: Colors.blue,
                                            labelColor: Colors.black,
                                            lineStroke: 3,
                                            height: 130,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // Weight card
                            Card(
                              color: const Color(0xFF2E303C),
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          children: [
                                          Text('Weight', style: TextStyle(fontSize: 20, color: Colors.white)),
                                          Text('$weight', style: TextStyle(fontSize: 43, fontWeight: FontWeight.bold, color: Colors.white)),
                                          ]
                                        ),
                                        Expanded(
                                          child: SimpleRulerPicker(
                                            minValue: 50,
                                            maxValue: 110,
                                            initialValue: 60,
                                            onValueChanged: (value) {
                                              setState(() {
                                                weight = value.toInt();
                                              });
                                            },
                                            scaleLabelSize: 0,
                                            scaleBottomPadding: 0,
                                            scaleItemWidth: 12,
                                            longLineHeight: 25,
                                            shortLineHeight: 15,
                                            lineColor: Color(0xFFF5CE0A),
                                            selectedColor: Colors.blue,
                                            labelColor: Colors.black,
                                            lineStroke: 3,
                                            height: 130,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Height selection
                      Expanded(
                        child: Card(
                          color: Color(0xFF2E303C),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Height (cm)", style: TextStyle(color: Colors.grey, fontSize: 20),),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  textBaseline: TextBaseline.alphabetic,
                                  children: [
                                    Text(
                                      height.toString(),
                                      style: TextStyle(
                                        fontSize: 50,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                Expanded(
                                  child: SimpleRulerPicker(
                                    minValue: 60,
                                    maxValue: 210,
                                    initialValue: 110,
                                    onValueChanged: (value) {
                                      setState(() {
                                        height = value.toInt();
                                      });
                                    },
                                    scaleLabelSize: 0,
                                    scaleBottomPadding: -30,
                                    scaleItemWidth: 12,
                                    longLineHeight: 35,
                                    shortLineHeight: 20,
                                    lineColor: Color(0xFFF5CE0A),
                                    selectedColor: Colors.blue,
                                    labelColor: Colors.black,
                                    lineStroke: 3,
                                    height: 130,
                                    axis: Axis.vertical,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Calculate button
                GestureDetector(
                  onTap: () {
                    BmiCalculator bmi = BmiCalculator(
                      height: height,
                      weight: weight,
                    );

                    double result = bmi.calculateBMI();
                    String category = bmi.getResult(result);
                    String message = bmi.getMessage(category);

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AdvUiResult(
                          bmiValue: result,
                          bmiCategory: category,
                          message: message,
                          age: age,
                          height: height,
                          weight: weight,
                          currentTime: currentTime,
                          gender: selectedGender == Gender.male ? "Male" : "Female",
                        ),
                      ),
                    );
                  },
                  //Button
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xFFDFBD44),
                    ),
                    width: double.infinity,
                    height: 60,
                    child: Center(
                      child: Text(
                        "Calculate",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}