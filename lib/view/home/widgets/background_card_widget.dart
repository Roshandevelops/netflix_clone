import 'package:flutter/material.dart';
import 'package:netflix_project/view/home/widgets/custom_button_widget.dart';
import 'package:netflix_project/widgets/constants.dart';

class BackgroundCardWidget extends StatelessWidget {
  const BackgroundCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                kMainImage,
              ),
            ),
          ),
          // color: Colors.amber,
          width: double.infinity,
          height: 600,
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CustomButtonWidget(
                  iconData: Icons.add,
                  text: "My List",
                ),
                _playButton(),
                const CustomButtonWidget(
                  iconData: Icons.info_outline,
                  text: "Info",
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  TextButton _playButton() {
    return TextButton.icon(
      style: ButtonStyle(
        shape: const WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(0),
            ),
          ),
        ),
        backgroundColor: WidgetStateProperty.all(
          kWhiteColor,
        ),
      ),
      onPressed: () {},
      icon: const Icon(
        Icons.play_arrow,
        size: 25,
        color: kBlackColor,
      ),
      label: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text(
          "Play",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: kBlackColor,
          ),
        ),
      ),
    );
  }
}
