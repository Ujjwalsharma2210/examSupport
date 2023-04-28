import 'package:exam/front_end/res/colors.dart';
import 'package:exam/front_end/sides/intro_and_input_side.dart';
import 'package:exam/front_end/sides/output_side.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: ListView(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Text(
                "What to study?",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                  color: textColor,
                ),
              ),
            ),
          ),
          Divider(
            // height: 20,
            thickness: 2,
            color: dividerColor,
          ),
          Row(
            children: [
              IntroAndInputSide(),
              OutputSide(),
            ],
          ),
        ],
      ),
    );
  }
}
