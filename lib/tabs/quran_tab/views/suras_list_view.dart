import 'package:flutter/material.dart';
import 'package:islamy_app_c16_6pm/theme/app_colors.dart';

class SurasListView extends StatelessWidget {
  const SurasListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          Text(
            'Suras list',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) => ListTile(
              minVerticalPadding: 0,
              contentPadding: EdgeInsets.zero,
              title: Text(
                'Al-Fatiha',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              subtitle: Text(
                '7 Verses',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              trailing: Text(
                'الفاتحه',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              leading: Stack(
                alignment: Alignment(0, 0),
                children: [
                  Icon(Icons.brightness_5, size: 45, color: Colors.white),
                  Text(
                    (index + 1).toString(),
                    style: TextStyle(
                      fontSize: (index + 1) > 99
                          ? 8
                          : (index * 10) > 9
                          ? 14
                          : 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            itemCount: 20,
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                endIndent: 65,
                indent: 65,
                color: AppColors.goldColor,
              );
            },
          ),
        ],
      ),
    );
  }
}
//custon scroll view