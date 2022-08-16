import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sahril_tugas1_bmi/constant/constant.dart';
import 'package:sahril_tugas1_bmi/helper/bmi_calculator.dart';
import 'package:sahril_tugas1_bmi/widgets/bmi_card.dart';
import 'package:sahril_tugas1_bmi/widgets/build_sheet.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? gender = "male";
  int height = 100;
  int weight = 50;
  int age = 20;

  List<Widget> generateList(start, end) {
    List<Widget> weights = [];
    for (var i = start; i < end; i++) {
      weights.add(Text(
        "$i",
        style: labelTextStyle.copyWith(fontSize: 20),
      ));
    }
    return weights;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: GestureDetector(
          onTap: () {
            final bmiCaculator = BmiCaculator(height: height, weight: weight);
            bmiCaculator.calculateBmi();
            showModalBottomSheet(
                context: context,
                builder: (context) => BuildSheet(
                      bmi: bmiCaculator.bmi!,
                    ));
          },
          child: Container(
            height: 60,
            decoration: const BoxDecoration(color: Color(0xffec3c66)),
            child: const Center(
                child: Text(
              'Hitung BMI',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )),
          ),
        ),
        appBar: AppBar(
          title: const Text(
            "BMI Calculator",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          gender = "male";
                          setState(() {});
                        },
                        child: BmiCard(
                          borderColor:
                              (gender == "male" ? Colors.black : Colors.grey),
                          child: Column(
                            children: const [
                              Icon(
                                Icons.male,
                                size: 100,
                                color: Color(0xffFF9356),
                              ),
                              Text(
                                "Male",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 19),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        child: GestureDetector(
                      onTap: () {
                        gender = "female";
                        setState(() {});
                      },
                      child: BmiCard(
                        borderColor:
                            (gender == "female" ? Colors.black : Colors.grey),
                        child: Column(
                          children: const [
                            Icon(
                              Icons.female,
                              size: 100,
                              color: Color(0xffFF4181),
                            ),
                            Text(
                              "Female",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 19),
                            )
                          ],
                        ),
                      ),
                    ))
                  ],
                ),
                BmiCard(
                  child: Column(
                    children: [
                      Text(
                        "HEIGHT",
                        style: labelTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text("$height", style: numberTextStyle),
                          Text(
                            "cm",
                            style: labelTextStyle,
                          ),
                        ],
                      ),
                      Slider(
                        value: height.toDouble(),
                        onChanged: (value) {
                          height = value.toInt();
                          setState(() {});
                        },
                        min: 80,
                        max: 200,
                        activeColor: Colors.black,
                        thumbColor: Colors.red,
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            "WEIGHT",
                            style: labelTextStyle,
                          ),
                          BmiCard(
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.15,
                              child: CupertinoPicker(
                                  scrollController: FixedExtentScrollController(
                                      initialItem: 5),
                                  itemExtent: 25,
                                  magnification: 2,
                                  useMagnifier: true,
                                  onSelectedItemChanged: (val) {
                                    weight = val + 20;
                                  },
                                  children: generateList(20, 220)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Text(
                            "AGE",
                            style: labelTextStyle,
                          ),
                          BmiCard(
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.15,
                              child: CupertinoPicker(
                                  scrollController: FixedExtentScrollController(
                                      initialItem: 5),
                                  itemExtent: 25,
                                  magnification: 2,
                                  useMagnifier: true,
                                  onSelectedItemChanged: (val) {
                                    age = val + 20;
                                  },
                                  children: generateList(5, 90)),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ])),
        ));
  }
}
