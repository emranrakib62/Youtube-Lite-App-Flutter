import 'package:flutter/material.dart';

import '../../core1/widget/webview_wrapper.dart';


class YoutubeScreen extends StatelessWidget {
  const YoutubeScreen({super.key, required this.title, required this.url});
  final String title;
  final String url;

  @override
  Widget build(BuildContext context) {
    return WebviewWrapper(url: url, title: title);
  }
}