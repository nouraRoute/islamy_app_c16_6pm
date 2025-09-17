import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy_app_c16_6pm/common/app_consts.dart';
import 'package:islamy_app_c16_6pm/models/hadeeth_model.dart';
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
  List<HadeethModel> dataList = [];
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
    loadAhadeeth2();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MainBgWidget(
      bgImage: AppConsts.hadeethBg,
      child: Expanded(
        child: dataList.isEmpty
            ? Center(
                child: CircularProgressIndicator(color: AppColors.goldColor),
              )
            : PageView.builder(
                controller: controller,
                itemCount: dataList.length,
                itemBuilder: (context, index) {
                  HadeethModel hadeeth = dataList[index];
                  return Padding(
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
                                hadeeth.title,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.blackColor,
                                ),
                              ),
                              SizedBox(height: 10),
                              Expanded(
                                child: SingleChildScrollView(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20.0,
                                  ),

                                  child: Text(
                                    hadeeth.content,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: AppColors.blackColor,
                                    ),
                                    textDirection: TextDirection.rtl,
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              ),
                              SizedBox(height: 100),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }

  loadAhadeeth() async {
    List<HadeethModel> ahadethList = [];
    String result = await rootBundle.loadString('assets/Hadeeth/ahadeth.txt');

    List<String> ahadeeth = result.split('#');

    for (var i = 0; i < ahadeeth.length; i++) {
      String hadeeth = ahadeeth[i].trim(); //

      String title = hadeeth.split('\n').first;
      print('title--->$title');

      String content = hadeeth.substring(title.length).trim();
      print('content---->${content}');
      HadeethModel hadeethModel = HadeethModel(
        content: content,
        title: title,
        index: i,
      );
      ahadethList.add(hadeethModel);
    }

    setState(() {
      dataList = ahadethList;
    });
  }

  loadAhadeeth2() async {
    List<HadeethModel> ahadeethList = [];
    for (var i = 1; i < 51; i++) {
      String result = await rootBundle.loadString('assets/Hadeeth/h$i.txt'); //
      String title = result.split('\n').first;
      String content = result.substring(title.length);
      HadeethModel hadeethModel = HadeethModel(
        content: content,
        title: title,
        index: i,
      );
      ahadeethList.add(hadeethModel);
    }
    setState(() {
      dataList = ahadeethList;
    });
  }
}
