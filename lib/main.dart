import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/hadeth/hadeth_data_screen.dart';
import 'package:islami/tabs/quran/sura_details_screen.dart';
import 'package:islami/tabs/sebha/sebha_tab.dart';
import 'package:islami/tabs/setting/settings.dart';
import 'homeScreen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



void main() {
  runApp( ChangeNotifierProvider(
    create: (_) => Settingsprovider(),
    child: islamiApp(),
  ),
  );
}
class islamiApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
  Settingsprovider settingsprovider =  Provider.of<Settingsprovider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        HomeScreen.routeName:(_) => HomeScreen(),
        suraDetailsScreen.routeName : (_) => suraDetailsScreen(),
        SebhaTab.routeName : (_) => SebhaTab(),
        HadethDataScreen.routeName : (_) => HadethDataScreen(),

      },
      theme:AppTheme.lightTheme ,
      darkTheme: AppTheme.darkTheme,
      themeMode:settingsprovider.themeMode,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(settingsprovider.language  ),
    );
  }
}
