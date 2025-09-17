import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy_app_c16_6pm/common/app_consts.dart';
import 'package:islamy_app_c16_6pm/models/sura_model.dart';
import 'package:islamy_app_c16_6pm/theme/app_colors.dart';

class SuraDetails extends StatefulWidget {
  static const String routeName = 'suraDetails';
  const SuraDetails({super.key});

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> ayatList = [];
  @override
  Widget build(BuildContext context) {
    SuraModel suraModel =
        ModalRoute.of(context)!.settings.arguments as SuraModel;
    if (ayatList.isEmpty) {
      loadSura(suraModel.index);
    }
    return Scaffold(
      appBar: AppBar(title: Text(suraModel.enName)),
      body: Stack(
        alignment: Alignment(0, 0),
        children: [
          Image.asset(AppConsts.suraDetailsBg, fit: BoxFit.fill),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 16),
              Text(
                suraModel.arName,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: AppColors.goldColor,
                ),
              ),
              SizedBox(height: 42),
              Expanded(
                child: ayatList.isEmpty
                    ? CircularProgressIndicator()
                    : SingleChildScrollView(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: RichText(
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            children: [
                              for (int i = 0; i < ayatList.length; i++)
                                TextSpan(text: ayatList[i] + ' (${i + 1}) '),
                            ],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: AppColors.goldColor,
                            ),
                          ),
                        ),
                      ),
              ),
              SizedBox(height: 100),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> loadSura(int index) async {
    //
    String res = await rootBundle.loadString('assets/Suras/$index.txt');

    setState(() {
      ayatList = res.trim().split('\n');
    });
  }
}
