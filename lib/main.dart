import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'Screen/Home/home_screen.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'YouTube Lite',
      theme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}