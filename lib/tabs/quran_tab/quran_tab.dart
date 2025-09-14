import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamy_app_c16_6pm/common/app_consts.dart';
import 'package:islamy_app_c16_6pm/tabs/quran_tab/views/most_recent_view.dart';
import 'package:islamy_app_c16_6pm/tabs/quran_tab/views/suras_list_view.dart';
import 'package:islamy_app_c16_6pm/tabs/quran_tab/widgets/custom_text_field.dart';
import 'package:islamy_app_c16_6pm/theme/app_colors.dart';
import 'package:islamy_app_c16_6pm/widgets/main_bg_widget.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return MainBgWidget(
      bgImage: AppConsts.quranTabBg,
      child: Expanded(
        child: Column(
          spacing: 10,
          children: [
            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
              child: CustomTextField(
                hintText: 'Sura Name',
                prefixIcon: SvgPicture.asset(
                  AppConsts.quranIcon,
                  // color: AppColors.goldColor,
                  colorFilter: ColorFilter.mode(
                    AppColors.goldColor,
                    BlendMode.srcIn,
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(children: [MostRecentView(), SurasListView()]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
