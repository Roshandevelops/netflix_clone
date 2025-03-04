import 'package:flutter/cupertino.dart';
import 'package:netflix_project/view/search/widgets/search_result_widget.dart';

class MoviesTvCardWidget extends StatelessWidget {
  const MoviesTvCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(dummyImageUrl),
        ),
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
