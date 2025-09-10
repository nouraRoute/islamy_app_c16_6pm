import 'package:flutter/material.dart';
import 'package:islamy_app_c16_6pm/common/app_consts.dart';
import 'package:islamy_app_c16_6pm/theme/app_colors.dart';

class MostRecentView extends StatelessWidget {
  const MostRecentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Text(
            'Most Recently',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
        //    SizedBox(height: 10),
        SizedBox(
          height: 150,
          child: ListView.builder(
            padding: EdgeInsets.only(left: 20),
            itemBuilder: (context, index) => SizedBox(
              width: 280,
              child: Card(
                color: AppColors.goldColor,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 7,
                    bottom: 7,
                    right: 7,
                    left: 20,
                  ),
                  child: Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              width: 200,
                              child: Text(
                                'Al-Anbiya',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: AppColors.blackColor,
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),
                            Text(
                              'الأنبياء',
                              style: TextStyle(
                                fontSize: 24,
                                color: AppColors.blackColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '112 Verses',
                              style: TextStyle(
                                fontSize: 14,
                                color: AppColors.blackColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        bottom: 0,
                        child: Image.asset(AppConsts.suraCard),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            scrollDirection: Axis.horizontal,
            itemCount: 10,
          ),
        ),
      ],
    );
  }
}
