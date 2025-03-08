import 'package:flutter/material.dart';
import 'package:netflix_project/view/downloads/widgets/smart_download_widget.dart';
import 'package:netflix_project/view/downloads/widgets/introduce_widget.dart';
import 'package:netflix_project/view/downloads/widgets/setup_widget.dart';
import 'package:netflix_project/widgets/app_bar_widget.dart';
import 'package:netflix_project/widgets/constants.dart';

class DownloadScreen extends StatelessWidget {
  const DownloadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _widgetList = [
      const SmartDownloadsWidget(),
      const IntroduceWidget(),
      const SetUpWidget(),
    ];
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBarWidget(
          title: "Downloads",
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            itemCount: _widgetList.length,
            itemBuilder: (ctx, index) {
              return _widgetList[index];
            },
            separatorBuilder: (context, index) {
              return kHeight;
            },
          ),
        ),
      ),
    );
  }
}
