import 'package:flutter/material.dart';
import 'package:islamy_app_c16_6pm/common/app_consts.dart';
import 'package:islamy_app_c16_6pm/theme/app_colors.dart';
import 'package:islamy_app_c16_6pm/widgets/main_bg_widget.dart';

class HadeethTab extends StatefulWidget {
  const HadeethTab({super.key});

  @override
  State<HadeethTab> createState() => _HadeethTabState();
}

class _HadeethTabState extends State<HadeethTab> {
  PageController controller = PageController(
    viewportFraction: 0.8,
    initialPage: 0,
  );
  int currantPAge = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(() {
      if ((controller.page ?? 0).toInt() != currantPAge) {
        setState(() {
          currantPAge = (controller.page ?? 0).toInt();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print('---->${currantPAge}');

    return MainBgWidget(
      bgImage: AppConsts.hadeethBg,
      child: Expanded(
        child: PageView.builder(
          controller: controller,
          itemBuilder: (context, index) => Padding(
            padding: EdgeInsets.symmetric(
              vertical: index != currantPAge ? 20.0 : 0,
            ),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 8),
              padding: EdgeInsets.only(top: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                color: AppColors.goldColor,
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(AppConsts.hadeethCard, fit: BoxFit.fill),
                  Column(
                    children: [
                      SizedBox(height: 42),
                      Text(
                        'data',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.blackColor,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'data',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.blackColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
