import 'package:flutter/material.dart';
import 'package:netflix_project/controller/download_provider.dart';
import 'package:netflix_project/view/downloads/widgets/smart_download_widget.dart';
import 'package:netflix_project/view/downloads/widgets/introduce_widget.dart';
import 'package:netflix_project/view/downloads/widgets/setup_widget.dart';
import 'package:netflix_project/widgets/app_bar_widget.dart';
import 'package:netflix_project/widgets/constants.dart';
import 'package:provider/provider.dart';

class DownloadScreen extends StatefulWidget {
  const DownloadScreen({super.key});

  @override
  State<DownloadScreen> createState() => _DownloadScreenState();
}

class _DownloadScreenState extends State<DownloadScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<DownloadProvider>(context, listen: false).getData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final widgetList = [];
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
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SmartDownloadsWidget(),
                const IntroduceWidget(),
                const SetUpWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
