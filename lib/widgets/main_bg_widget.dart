import 'package:flutter/material.dart';
import 'package:islamy_app_c16_6pm/theme/app_colors.dart';
import 'package:islamy_app_c16_6pm/widgets/main_hrader.dart';

class MainBgWidget extends StatelessWidget {
  const MainBgWidget({super.key, required this.bgImage, required this.child});
  final String bgImage;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(bgImage), fit: BoxFit.cover),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.blackColor.withValues(alpha: .7),
              AppColors.blackColor,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(child: Column(children: [MainHeader(), child])),
      ),
    );
  }
}
