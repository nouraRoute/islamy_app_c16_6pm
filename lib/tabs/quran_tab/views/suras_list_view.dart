import 'package:flutter/material.dart';
import 'package:islamy_app_c16_6pm/common/app_consts.dart';
import 'package:islamy_app_c16_6pm/models/sura_model.dart';
import 'package:islamy_app_c16_6pm/tabs/quran_tab/sura_details.dart';
import 'package:islamy_app_c16_6pm/theme/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SurasListView extends StatelessWidget {
  const SurasListView({
    required this.searchText,
    super.key,
    required this.onNav,
  });
  final String searchText;
  final void Function() onNav;
  @override
  Widget build(BuildContext context) {
    List<SuraModel> suras = SuraModel.getSurasList
        .where(
          (element) =>
              element.arName.contains(searchText) ||
              element.enName.toLowerCase().contains(searchText.toLowerCase()),
        )
        .toList();

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
            itemBuilder: (context, index) {
              SuraModel curranSura = suras[index];
              return ListTile(
                onTap: () {
                  cashSuraToList(curranSura.index).then((value) => onNav());

                  //cash sura id in the list
                  Navigator.of(
                    context,
                  ).pushNamed(SuraDetails.routeName, arguments: curranSura);
                },
                minVerticalPadding: 0,
                contentPadding: EdgeInsets.zero,
                title: Text(
                  curranSura.enName,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                subtitle: Text(
                  '${curranSura.versesCount} Verses',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                trailing: Text(
                  curranSura.arName,
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
                      curranSura.index.toString(),
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
              );
            },
            itemCount: suras.length,
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

  Future cashSuraToList(int index) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<String> data = pref.getStringList(AppConsts.mostRecentKey) ?? [];
    Set<String> temp = data.toSet();
    data = temp.toList();
    data.remove(index.toString());
    data.add(index.toString());
    pref.setStringList(AppConsts.mostRecentKey, data);
  }
}
