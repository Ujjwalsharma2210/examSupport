import 'package:flutter/material.dart';

import '../res/colors.dart';
import '../res/constants.dart';

Widget TextInputField(
    BuildContext context, TextEditingController controller, String hintText) {
  Color textColor = Colors.grey.shade500;

  return TextField(
    maxLines: null,
    expands: true,
    controller: controller,
    keyboardType: TextInputType.multiline,
    style: TextStyle(color: textColor, fontSize: 16),
    decoration: InputDecoration(
      fillColor: darkGrey,
      filled: true,
      // border: InputBorder.none,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: BorderSide(color: Colors.grey, width: 1),
      ),
      label: Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          hintText,
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),
      hintStyle: TextStyle(color: textColor, fontSize: 16),
    ),
  );
}
