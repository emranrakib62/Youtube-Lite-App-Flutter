import 'package:flutter/material.dart';
import 'package:youtube_liteee/core/constants/app_color.dart';
class fullScreenLoadingOverlay extends StatelessWidget {
  const fullScreenLoadingOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: double.infinity,
          width: double.infinity,
          color: AppColors.surfaceDark,
          child: Center(child: CircularProgressIndicator(),),
        )
      ],
    );
  }
}
