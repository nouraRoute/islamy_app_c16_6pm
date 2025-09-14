import 'package:flutter/material.dart';
import 'package:islamy_app_c16_6pm/common/app_consts.dart';
import 'package:islamy_app_c16_6pm/theme/app_colors.dart';
import 'package:islamy_app_c16_6pm/widgets/main_bg_widget.dart';

class HadeethTab extends StatelessWidget {
  const HadeethTab({super.key});

  @override
  Widget build(BuildContext context) {
    return MainBgWidget(
      bgImage: AppConsts.hadeethBg,
      child: Expanded(
        child: PageView.builder(
          controller: PageController(viewportFraction: 0.8, initialPage: 1),
          itemBuilder: (context, index) => Card(color: AppColors.goldColor),
        ),
      ),
    );
  }
}
