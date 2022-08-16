import 'package:flutter/material.dart';

class BmiCard extends StatelessWidget {
  const BmiCard({
    Key? key,
    this.child,
    this.borderColor = Colors.grey,
  }) : super(key: key);

  final Widget? child;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: borderColor!, width: 3),
          borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(20),
      child: child,
    );
  }
}
