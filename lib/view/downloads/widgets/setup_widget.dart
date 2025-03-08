import 'package:flutter/material.dart';
import 'package:netflix_project/widgets/constants.dart';
import 'package:netflix_project/widgets/material_button_widget.dart';

class SetUpWidget extends StatelessWidget {
  const SetUpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MaterialButtonWidget(
          buttonWidth: double.infinity,
          buttoncolor: kButtonColorBlue,
          text: "Set Up",
          fontColor: kWhiteColor,
        ),
        const MaterialButtonWidget(
          buttonWidth: double.infinity,
          buttoncolor: kButtonColorWhite,
          text: "See What You Can Download",
          fontColor: kBlackColor,
        ),
      ],
    );
  }
}
