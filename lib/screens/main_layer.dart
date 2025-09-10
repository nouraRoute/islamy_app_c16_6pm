import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamy_app_c16_6pm/common/app_consts.dart';
import 'package:islamy_app_c16_6pm/common/common_decorations.dart';
import 'package:islamy_app_c16_6pm/tabs/quran_tab/quran_tab.dart';

class MainLayer extends StatefulWidget {
  const MainLayer({super.key});

  @override
  State<MainLayer> createState() => _MainLayerState();
}

class _MainLayerState extends State<MainLayer> {
  int currentTab = 0;
  List<Widget> tabs = [
    QuranTab(),
    Container(color: Colors.red),
    Container(color: Colors.white),
    Container(color: Colors.green),
    Container(color: Colors.pink),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.red,
      body: tabs[currentTab],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentTab,
        onTap: (value) {
          setState(() {
            currentTab = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
              decoration: currentTab == 0
                  ? CommonDecorations.selectedItemDecoration
                  : null,
              child: SvgPicture.asset(
                AppConsts.quranIcon,
                width: currentTab == 0 ? 20 : 25,
                color: currentTab == 0 ? Colors.white : null,
              ),
            ),
            label: 'quran',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
              decoration: currentTab == 1
                  ? CommonDecorations.selectedItemDecoration
                  : null,
              child: SvgPicture.asset(
                AppConsts.hadeethIcon,
                width: currentTab == 1 ? 20 : 25,
                color: currentTab == 1 ? Colors.white : null,
              ),
            ),
            label: 'Hadeeth',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
              decoration: currentTab == 2
                  ? CommonDecorations.selectedItemDecoration
                  : null,
              child: SvgPicture.asset(
                AppConsts.sebhaIcon,
                width: currentTab == 2 ? 20 : 25,
                color: currentTab == 2 ? Colors.white : null,
              ),
            ),
            label: 'Sebha',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
              decoration: currentTab == 3
                  ? CommonDecorations.selectedItemDecoration
                  : null,
              child: SvgPicture.asset(
                AppConsts.radioIcon,
                width: currentTab == 3 ? 20 : 25,
                color: currentTab == 3 ? Colors.white : null,
              ),
            ),
            label: 'Radio',
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
              decoration: currentTab == 4
                  ? CommonDecorations.selectedItemDecoration
                  : null,
              child: SvgPicture.asset(
                AppConsts.timesIcon,
                width: currentTab == 4 ? 20 : 25,
                color: currentTab == 4 ? Colors.white : null,
              ),
            ),
            label: 'Time',
          ),
        ],
      ),
    );
  }
}
