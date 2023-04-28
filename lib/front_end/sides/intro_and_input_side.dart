import 'package:exam/front_end/custom_widgets/custom_button.dart';
import 'package:exam/front_end/res/colors.dart';
import 'package:exam/functions/text_rank.dart';
import 'package:flutter/material.dart';

import '../custom_widgets/text_input.dart';

List<String> suggestions = <String>[];

class IntroAndInputSide extends StatefulWidget {
  const IntroAndInputSide({super.key});

  @override
  State<IntroAndInputSide> createState() => _IntroAndInputSideState();
}

class _IntroAndInputSideState extends State<IntroAndInputSide> {
  TextEditingController inputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 60),
        child: Column(
          children: [
            Text(
              """Introducing our exam topic selection tool, designed to help students prepare for their upcoming exams by suggesting the most important topics to focus on. Our tool is built using advanced language processing algorithms that analyze input exams and identify the topics and subtopics that are most frequently tested.""",
              style: TextStyle(
                color: textColor,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.4,
              child: TextInputField(
                  context, inputController, "Input Previous papers here"),
            ),
            const SizedBox(height: 20),
            CustomButton(onPress: buttonPressed, label: "Submit"),
          ],
        ),
      ),
    );
  }

  void buttonPressed() {
    suggestions = getKeywords(inputController.text);
    print(suggestions.toList());
    inputController.clear();
    setState(() {});
  }
}

class OutputSide extends StatefulWidget {
  const OutputSide({super.key});

  @override
  State<OutputSide> createState() => _OutputSideState();
}

class _OutputSideState extends State<OutputSide> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Study this : ",
            style: TextStyle(
              color: textColor,
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.6,
            child: ListView.builder(
              itemCount: suggestions.length,
              itemBuilder: (context, index) {
                return Text(
                  suggestions[index],
                  style: TextStyle(
                    color: textColor,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
