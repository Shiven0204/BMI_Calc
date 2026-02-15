import 'package:flutter/material.dart';

class BasicUiResult extends StatelessWidget {
  final double bmiValue;
  final String bmiCategory;
  final String message;

  const BasicUiResult({
    super.key,
    required this.bmiValue,
    required this.bmiCategory,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF000812),
      appBar: AppBar(
        title: const Text("BMI Calculator", style: TextStyle(color: Colors.white),),
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
                    'Your Result',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50, color: Colors.white),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: Card(
                      margin: EdgeInsets.all(20),
                      color: const Color(0xFF2E303C),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  bmiCategory,
                                  style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
                                ),
                                const SizedBox(width: 10,),
                              ]
                          ),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  bmiValue.toStringAsFixed(1),
                                  style: const TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.white),
                                ),
                                const SizedBox(width: 10, height: 10,),
                              ]
                          ),Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  message,
                                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(width: 10, height: 10,),
                              ]
                          ),
                        ],
                      ),
                    ),
                  ),
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
