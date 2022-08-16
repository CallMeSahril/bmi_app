import 'package:sahril_tugas1_bmi/constant/constant.dart';

class BmiCaculator {
  int? height;
  int? weight;
  double? bmi;
  String? bmiCategory;
  String? bmiDescription;

  BmiCaculator({required this.height, required this.weight});
  BmiCaculator.fromBmiValue(this.bmi) {
    // this.bmi = bmi;
  }

  double calculateBmi() {
    double heightInMeter = height! / 100;
    final h = (heightInMeter * heightInMeter);
    bmi = weight! / h;

    return bmi!;
  }

  String determineBmiCategory() {
    String category = " ";
    if (bmi! < 16) {
      category = underweightServere;
    } else if (bmi! < 17) {
      category = underweightModerate;
    } else if (bmi! < 18.5) {
      category = underweightMild;
    } else if (bmi! < 25) {
      category = normal;
    } else if (bmi! < 30) {
      category = overweight;
    } else if (bmi! < 35) {
      category = obsesI;
    } else if (bmi! < 40) {
      category = obeseII;
    } else if (bmi! >= 40) {
      category = obseIII;
    }
    bmiCategory = category;
    return bmiCategory!;
  }

  String getHealRiskDescription() {
    String desc = "";
    switch (bmiCategory) {
      case underweightServere:
      case underweightModerate:
      case underweightMild:
        desc = "Possible nutritional deficiency and osteoporisis.";
        break;
      case normal:
        desc = "Low risk (healthy range).";
        break;
      case overweight:
        desc =
            "Moderate risk of developing heart disease, high blod pressure, strole, diabetes mellitus.";
        break;
      case obsesI:
      case obeseII:
      case obseIII:
        desc =
            "High risk of developing heart disease, high blood pressure, stroke, diabetes mellitus. Metabolic Syndrome";
        break;
      default:
    }
    bmiDescription = desc;
    return bmiDescription!;
  }
}
