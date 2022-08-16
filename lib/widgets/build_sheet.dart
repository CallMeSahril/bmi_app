import 'package:bmi_app/helper/bmi_calculator.dart';
import 'package:bmi_app/widgets/bmi_card.dart';
import 'package:flutter/material.dart';

class BuildSheet extends StatelessWidget {
  const BuildSheet({Key? key, required this.bmi}) : super(key: key);
  final double bmi;

  @override
  Widget build(BuildContext context) {
    final BmiCaculator bmiCaculator = BmiCaculator.fromBmiValue(bmi);
    bmiCaculator.determineBmiCategory();
    bmiCaculator.getHealRiskDescription();
    return Column(
      children: [
        Expanded(
          child: BmiCard(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(bmiCaculator.bmiCategory!,
                      style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.green)),
                  Text(bmi.toStringAsFixed(1),
                      style: const TextStyle(
                          fontSize: 80,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
                  Text(bmiCaculator.bmiDescription!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black))
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
