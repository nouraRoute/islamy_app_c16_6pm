import 'package:flutter/material.dart';
import 'package:islamy_app_c16_6pm/common/app_consts.dart';

class MainHeader extends StatelessWidget {
  const MainHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Image.asset(
        AppConsts.mainHeader,
        width: 300,
        height: 140,
        fit: BoxFit.cover,
      ),
    );
  }
}
