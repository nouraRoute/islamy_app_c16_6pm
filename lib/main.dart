import 'package:flutter/material.dart';
import 'package:islamy_app_c16_6pm/screens/main_layer.dart';
import 'package:islamy_app_c16_6pm/theme/app_theme.dart';
import 'package:islamy_app_c16_6pm/tabs/quran_tab/sura_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        MainLayer.routeName: (_) => MainLayer(),
        SuraDetails.routeName: (ctx) => SuraDetails(),
      },
      theme: AppTheme.appTheme,
      initialRoute: MainLayer.routeName,
    );
  }
}
