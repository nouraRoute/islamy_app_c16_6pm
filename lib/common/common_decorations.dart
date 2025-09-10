import 'package:flutter/material.dart';
import 'package:islamy_app_c16_6pm/theme/app_colors.dart';

class CommonDecorations {
  static BoxDecoration selectedItemDecoration = BoxDecoration(
    borderRadius: const BorderRadius.all(Radius.circular(66)),
    color: AppColors.blackColor.withValues(alpha: .6),
  );
}
