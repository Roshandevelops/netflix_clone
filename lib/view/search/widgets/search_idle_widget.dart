import 'package:flutter/material.dart';
import 'package:netflix_project/widgets/title_widget.dart';
import 'package:netflix_project/view/search/widgets/top_search_item_tile.dart';
import 'package:netflix_project/widgets/constants.dart';

const verticalImageUrl = [
  "https://media.themoviedb.org/t/p/w500_and_h282_face/kYgQzzjNis5jJalYtIHgrom0gOx.jpg",
  "https://media.themoviedb.org/t/p/w500_and_h282_face/rOmUuQEZfPXglwFs5ELLLUDKodL.jpg",
  "https://media.themoviedb.org/t/p/w500_and_h282_face/vZG7PrX9HmdgL5qfZRjhJsFYEIA.jpg",
];

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TitleWidget(
          heading: "Top Searches",
        ),
        kHeight20,
        Expanded(
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (ctx, index) {
              return TopSearchesTileWidget();
            },
            separatorBuilder: (ctx, index) {
              return kHeight20;
            },
            itemCount: 15,
          ),
        )
      ],
    );
  }
}
