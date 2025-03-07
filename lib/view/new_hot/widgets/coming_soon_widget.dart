import 'package:flutter/material.dart';
import 'package:netflix_project/view/home/widgets/custom_button_widget.dart';
import 'package:netflix_project/view/new_hot/widgets/moviename_content_widget.dart';
import 'package:netflix_project/widgets/stack_image_icon_widget.dart';
import 'package:netflix_project/widgets/constants.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        const SizedBox(
          // color: Colors.red,
          width: 50,
          height: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              kHeight20,
              Text(
                "FEB",
                style: TextStyle(
                  fontSize: 16,
                  color: kGreyColor,
                ),
              ),
              Text(
                "11",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          // color: Colors.amberAccent,
          width: size.width - 60,
          height: 450,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StackImageIconWidget(),
              kHeight20,
              Row(
                children: [
                  Text(
                    "MOVIE NAME",
                    style: TextStyle(
                      letterSpacing: -2,
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      CustomButtonWidget(
                        iconData: Icons.notification_important,
                        text: "Remind me",
                        iconSize: 20,
                        textSize: 12,
                      ),
                      kWidth,
                      CustomButtonWidget(
                        iconData: Icons.info,
                        text: "Info",
                        textSize: 12,
                        iconSize: 20,
                      ),
                      kWidth,
                    ],
                  ),
                ],
              ),
              Text("Coming on Friday"),
              kHeight20,
              MovieNameAndContentWidget(
                content:
                    "Landing the lead in the school musical is a\ndream come true for jodi,until the pressure\nsends her confidence --and her relationship--\ninto a tailspin",
                movieName: "Moviename",
              ),
            ],
          ),
        ),
      ],
    );
  }
}
