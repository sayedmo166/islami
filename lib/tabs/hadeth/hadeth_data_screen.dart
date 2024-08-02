import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/hadeth/hadeth.dart';
import 'package:islami/tabs/hadeth/hadeth_tab.dart';
import 'package:islami/tabs/setting/settings.dart';
import 'package:islami/widgets/loading_Indicator.dart';
import 'package:provider/provider.dart';


class HadethDataScreen extends StatelessWidget {
  static const String routeName = '/hadeth-details';

  @override
  Widget build(BuildContext context) {
    Settingsprovider settingsprovider =  Provider.of<Settingsprovider>(context);

    Hadeth hadeth = ModalRoute.of(context)!.settings.arguments as Hadeth;
    return Container(decoration:
    BoxDecoration(

        image: DecorationImage(
            image:AssetImage(settingsprovider.themeMode==ThemeMode.light?'images/default_bg.png':
            'images/dark_bg.png'),
            fit: BoxFit.fill)
    ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(hadeth.title),
        ),
        body: Container(
          padding: EdgeInsets.all(24),
          margin: EdgeInsets.symmetric(vertical:MediaQuery.of(context).size.height*0.06 ,horizontal:MediaQuery.of(context).size.width*0.07 ),
          decoration: BoxDecoration(
              color: Provider.of<Settingsprovider>(context).themeMode==ThemeMode.light?AppTheme.white:
              AppTheme.darkpimary,
              borderRadius: BorderRadius.circular(25)
          ),
          child: hadeth.content.isEmpty?
          loadingInsicator() :
          ListView.builder(itemBuilder: (_, index)=> Text(hadeth.content[index],
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleLarge,
          ),
            itemCount: hadeth.content.length,),
        ),

      ),
    );
  }
}
