import 'package:flutter/material.dart';

import '../res/constants.dart';

class CustomButton extends StatelessWidget {
  void Function()? onPress;
  String label;
  CustomButton({super.key, required this.onPress, required this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),
      onPressed: onPress,
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
