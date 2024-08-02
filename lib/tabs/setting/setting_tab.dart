import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/setting/settings.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';



class settingTab extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    Settingsprovider settingsprovider =  Provider.of<Settingsprovider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppLocalizations.of(context)!.darktheme,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w600)),
              Switch(value:settingsprovider.themeMode == ThemeMode.dark ,
                onChanged:(isDark) {
                  settingsprovider.changeTheme(isDark? ThemeMode.dark :ThemeMode.light);
                },
                activeColor: AppTheme.gold,
                inactiveThumbColor:Colors.grey,

              ),
            ],
          ),
          SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(AppLocalizations.of(context)!.language,style:Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w600),),
              DropdownButtonHideUnderline(
                child: DropdownButton<String>(value: settingsprovider.language,
                  items: [DropdownMenuItem(value: "en",
                    child: Text('English',style: TextStyle(color:settingsprovider.themeMode==ThemeMode.dark?Colors.white:Colors.black ),),),
                    DropdownMenuItem(value: 'ar',
                      child: Text('العربية',style: TextStyle(color:settingsprovider.themeMode==ThemeMode.dark?Colors.white:Colors.black ),),)],
                  onChanged: (selectedlanguage){
                    if(selectedlanguage != null)return
                      settingsprovider.changeLanguage(selectedlanguage!);

                  },
                  dropdownColor: settingsprovider.themeMode == ThemeMode.dark ? AppTheme.darkpimary : Colors.white,

                  borderRadius: BorderRadius.circular(16),), )],
          ),

        ],
      ),
    );
  }
}