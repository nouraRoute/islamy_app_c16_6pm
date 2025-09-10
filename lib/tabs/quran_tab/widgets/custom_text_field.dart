import 'package:flutter/material.dart';
import 'package:islamy_app_c16_6pm/common/app_consts.dart';
import 'package:islamy_app_c16_6pm/theme/app_colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, this.hintText, this.prefixIcon});
  final String? hintText;
  final Widget? prefixIcon;
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: AppColors.goldColor,
      style: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
        fontFamily: AppConsts.fontFamily,
      ),
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.all(12.0),
          child: prefixIcon,
        ),
        fillColor: AppColors.blackColor.withValues(alpha: .7),
        filled: true,
        hintText: hintText,
        border: _getBorder(),
        focusedBorder: _getBorder(),
        enabledBorder: _getBorder(),
        hintStyle: TextStyle(
          color: Colors.white.withValues(alpha: .5),
          fontSize: 16,
          fontWeight: FontWeight.normal,
          fontFamily: AppConsts.fontFamily,
        ),
      ),
    );
  }

  OutlineInputBorder _getBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: AppColors.goldColor),
    );
  }
}
