import 'dart:math';

class BmiCalculator {
  final int height; // in cm
  final int weight; // in kg

  BmiCalculator({required this.height, required this.weight});

  double calculateBMI() {
    double heightInMeter = height / 100;
    return weight / pow(heightInMeter, 2);
  }

  String getResult(double bmi) {
    if (bmi >= 30) {
      return "Obese";
    } else if (bmi >= 25) {
      return "Overweight";
    } else if (bmi >= 18.5) {
      return "Normal";
    } else {
      return "Underweight";
    }
  }

  String getMessage(String result) {
    switch (result) {
      case "Normal":
        return "You have a normal body weight. Good job!";
      case "Overweight":
        return "Try to exercise more.";
      case "Underweight":
        return "You should eat more healthy food.";
      default:
        return "Consult a doctor for better guidance.";
    }
  }
}
