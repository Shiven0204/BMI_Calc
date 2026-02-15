import 'package:flutter/material.dart';
import 'package:bmi_cal/logic.dart';
import 'package:bmi_cal/basic_ui/basicui_result.dart';

enum Gender { male, female }

class BasicUI extends StatefulWidget {
  const BasicUI({super.key});

  @override
  State<BasicUI> createState() => _BasicUIState();
}

class _BasicUIState extends State<BasicUI> {
  int height = 170;
  int weight = 60;
  int age = 20;
  Gender? selectedGender;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000812),
      appBar: AppBar(
        title: const Text("BMI Calculator", style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xFF2E303C),
        elevation: 0,
      ),
      body: Center(
        child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        //Male selection buton
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
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.male, size: 80, color: Colors.white),
                                  Text('Male',
                                    style: TextStyle(
                                      fontSize: 23,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 20)
                                ],
                              ),
                            ),
                          ),
                        ),
                        //Female selection buton
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedGender = Gender.female;
                              });
                            },
                            child: Card(
                              color: selectedGender == Gender.female
                                  ? const Color(0xFFDFBD44)
                                  : const Color(0xFF2E303C),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.female, size: 80, color: Colors.white),
                                  Text('Female',
                                    style: TextStyle(
                                      fontSize: 23,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 20)
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  //Height selection
                  Expanded(
                    child: Card(
                      color: Color(0xFF2E303C),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Height:", style: TextStyle(color: Colors.grey, fontSize: 20),),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
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
                              Text(" cm", style: TextStyle(color: Colors.grey)),
                            ],
                          ),
                          Slider(
                            min: 100,
                            max: 220,
                            value: height.toDouble(),
                            activeColor: Color(0xFFDFBD44),
                            inactiveColor: Colors.grey,
                            onChanged: (value) {
                              setState(() {
                                height = value.toInt();
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  //Weight selection
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          child: Card(
                            color: const Color(0xFF2E303C),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Weight', style: TextStyle(fontSize: 20, color: Colors.white)),
                                Text('$weight', style: TextStyle(fontSize: 43, fontWeight: FontWeight.bold, color: Colors.white)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RawMaterialButton(
                                      onPressed: () {
                                        setState(() {
                                          weight++;
                                        });
                                      },
                                      fillColor: Color(0xFF4C4F5E),
                                      shape: CircleBorder(),
                                      constraints: BoxConstraints.tightFor(width: 45, height: 45),
                                      child: Icon(Icons.add, color: Colors.white),
                                    ),
                                    RawMaterialButton(
                                      onPressed: () {
                                        setState(() {
                                          weight--;
                                        });
                                      },
                                      fillColor: Color(0xFF4C4F5E),
                                      shape: CircleBorder(),
                                      constraints: BoxConstraints.tightFor(width: 45, height: 45),
                                      child: Icon(Icons.remove, color: Colors.white),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20)
                              ],
                            ),
                          ),
                        ),
                        //Age selection
                        Expanded(
                          child: Card(
                            color: const Color(0xFF2E303C),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Age', style: TextStyle(fontSize: 20, color: Colors.white),),
                                Text('$age', style: TextStyle(fontSize: 43, fontWeight: FontWeight.bold, color: Colors.white),),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RawMaterialButton(
                                      onPressed: () {
                                        setState(() {
                                          age++;
                                        });
                                      },
                                      fillColor: Color(0xFF4C4F5E),
                                      shape: CircleBorder(),
                                      constraints: BoxConstraints.tightFor(width: 45, height: 45),
                                      child: Icon(Icons.add, color: Colors.white),
                                    ),
                                    RawMaterialButton(
                                      onPressed: () {
                                        setState(() {
                                          age--;
                                        });
                                      },
                                      fillColor: Color(0xFF4C4F5E),
                                      shape: CircleBorder(),
                                      constraints: BoxConstraints.tightFor(width: 45, height: 45),
                                      child: Icon(Icons.remove, color: Colors.white),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //Calculate Button
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
                          builder: (context) => BasicUiResult(
                            bmiValue: result,
                            bmiCategory: category,
                            message: message,
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
            )
        ),
      )
    );
  }
}