import 'package:flutter/material.dart';

class ControlPanel extends StatelessWidget {
  final double width;

  const ControlPanel({super.key, this.width = 320});

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width, child: Placeholder());
  }
}
