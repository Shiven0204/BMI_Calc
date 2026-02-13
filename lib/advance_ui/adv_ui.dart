import 'package:flutter/material.dart';
// import 'package:bmi_cal/basic_ui/logic.dart';
// import 'package:bmi_cal/basic_ui/result.dart';
import 'package:simple_ruler_picker/simple_ruler_picker.dart';





enum Gender { male, female }

class AdvanceUI extends StatefulWidget {
  const AdvanceUI({super.key});

  @override
  State<AdvanceUI> createState() => _AdvanceUIState();
}

class _AdvanceUIState extends State<AdvanceUI> {
  int height = 160;
  int weight = 60;
  int age = 20;
  Gender? selectedGender;


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
                Row(
                  children: [
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
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Card(
                              color: const Color(0xFF2E303C),
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    Text('Age', style: TextStyle(fontSize: 20, color: Colors.white),),
                                    Text('$age', style: TextStyle(fontSize: 43, fontWeight: FontWeight.bold, color: Colors.white),),
                                    SimpleRulerPicker(
                                      minValue: 50,
                                      maxValue: 210,
                                      initialValue: 50,
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
                                    // SizedBox(height: 20)
                                  ],
                                ),
                              ),
                            ),
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
                                            maxValue: 210,
                                            initialValue: 50,
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
                                    // SizedBox(height: 20)
                                  ],
                                ),
                              ),
                            ),
                            // SizedBox(height: 50)
                          ],
                        ),
                      ),
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
                                    // Text(" cm", style: TextStyle(color: Colors.grey)),

                                    Expanded(
                                      child: SimpleRulerPicker(
                                        minValue: 50,
                                        maxValue: 210,
                                        initialValue: 50,
                                        onValueChanged: (value) {
                                          setState(() {
                                            height = value.toInt();
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
                                        axis: Axis.vertical,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}