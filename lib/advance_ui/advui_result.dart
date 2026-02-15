import 'package:flutter/material.dart';

class AdvUiResult extends StatelessWidget {
  final double bmiValue;
  final String bmiCategory;
  final String message;
  final int height;
  final int weight;
  final int age;
  final String currentTime;


  const AdvUiResult({
    super.key,
    required this.bmiValue,
    required this.bmiCategory,
    required this.message,
    required this.height,
    required this.weight,
    required this.age,
    required this.currentTime,
  });

  Color getStatusColor() {
    if (bmiValue < 18.5) return Colors.blue;
    if (bmiValue < 25) return Colors.green;
    if (bmiValue < 30) return Colors.orange;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF000812),
        appBar: AppBar(
          title: const Text(
            "BMI Calculator", style: TextStyle(color: Colors.white),),
          centerTitle: true,
          backgroundColor: const Color(0xFF2E303C),
          elevation: 0,
        ),
        body: Center(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    'Your BMI',
                    style: TextStyle(fontSize: 50, color: Colors.white),
                  ),
                  Card(
                      color: Color(0xFF2E303C),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                bmiValue.toStringAsFixed(1),
                                style: TextStyle(fontSize: 70,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Text(
                                "${weight.toInt()}kg | ${height
                                    .toInt()}cm | ${age}yr",
                                style: TextStyle(fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              SizedBox(height: 15,),
                              Text(
                                "You are $bmiCategory",
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: getStatusColor(),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                  ),
                  SizedBox(height: 20,),
                  Text(
                    currentTime,
                    style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 20,
                    ),
                  ),
                  SizedBox(height: 20,),
              GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color(0xFFDFBD44),
                      ),
                      width: double.infinity,
                      height: 60,
                      child: Center(
                        child: Text(
                          "Re_Calculate",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}