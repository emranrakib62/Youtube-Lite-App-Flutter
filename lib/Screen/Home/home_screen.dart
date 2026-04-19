import 'package:flutter/material.dart';
import 'package:youtube_liteee/core/constants/app_color.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundDark,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundDark,
        title: Row(
          children: [
            Icon(Icons.play_arrow,color:Colors.white)
          ],
        ),
      ),
    );
  }
}
