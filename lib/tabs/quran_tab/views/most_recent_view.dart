import 'package:flutter/material.dart';
import 'package:islamy_app_c16_6pm/common/app_consts.dart';
import 'package:islamy_app_c16_6pm/models/sura_model.dart';
import 'package:islamy_app_c16_6pm/theme/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MostRecentView extends StatefulWidget {
  const MostRecentView({super.key});

  @override
  State<MostRecentView> createState() => _MostRecentViewState();
}

class _MostRecentViewState extends State<MostRecentView> {
  List<SuraModel> mostRecent = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadMostRicent();
  }

  @override
  void didUpdateWidget(covariant MostRecentView oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    loadMostRicent();
  }

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
            itemBuilder: (context, index) {
              SuraModel sura = mostRecent[index];
              return SizedBox(
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
                                  sura.enName,
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: AppColors.blackColor,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                              Text(
                                sura.arName,
                                style: TextStyle(
                                  fontSize: 24,
                                  color: AppColors.blackColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '${sura.versesCount} Verses',
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
              );
            },
            scrollDirection: Axis.horizontal,
            itemCount: mostRecent.length,
          ),
        ),
      ],
    );
  }

  loadMostRicent() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<String> data = pref.getStringList(AppConsts.mostRecentKey) ?? [];
    print('--->${data}');
    List<SuraModel> suras = data
        .map((e) => SuraModel.getSurasList[int.parse(e) - 1])
        .toList();
    setState(() {
      mostRecent = suras.reversed.toList();
    });
  }
}
