import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamy_app_c16_6pm/common/app_consts.dart';
import 'package:islamy_app_c16_6pm/models/sura_model.dart';
import 'package:islamy_app_c16_6pm/tabs/quran_tab/views/most_recent_view.dart';
import 'package:islamy_app_c16_6pm/tabs/quran_tab/views/suras_list_view.dart';
import 'package:islamy_app_c16_6pm/tabs/quran_tab/widgets/custom_text_field.dart';
import 'package:islamy_app_c16_6pm/theme/app_colors.dart';
import 'package:islamy_app_c16_6pm/widgets/main_bg_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuranTab extends StatefulWidget {
  const QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  String searchText = '';
  // TextEditingController controller = TextEditingController();
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   controller.addListener(() {
  //     setState(() {});
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    print('######');
    return MainBgWidget(
      bgImage: AppConsts.quranTabBg,
      child: Expanded(
        child: Column(
          spacing: 10,
          children: [
            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 20),
              child: CustomTextField(
                onChanged: (text) {
                  setState(() {
                    searchText = text;
                  });
                },
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
              child: CustomScrollView(
                slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate([MostRecentView()]),
                  ),
                  SliverList(
                    delegate: SliverChildListDelegate([
                      SurasListView(
                        searchText: searchText,
                        onNav: () => setState(() {}),
                      ),
                    ]),
                  ),
                  // SurasListView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
