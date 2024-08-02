import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/quran/quran_tab.dart';
import 'package:islami/tabs/setting/settings.dart';
import 'package:islami/widgets/loading_Indicator.dart';
import 'package:provider/provider.dart';



class suraDetailsScreen extends StatefulWidget {
  static const routeName = '/sura-details';

  @override
  State<suraDetailsScreen> createState() => _suraDetailsScreenState();
}

class _suraDetailsScreenState extends State<suraDetailsScreen> {

List<String> ayat = [];
  late SuraDetailsArgs args ;


  @override
  Widget build(BuildContext context) {
    Settingsprovider settingsprovider =  Provider.of<Settingsprovider>(context);

    args = ModalRoute.of(context)!.settings.arguments as SuraDetailsArgs;
if(ayat.isEmpty){
loadSuraFile();}
    return Container(decoration:
    BoxDecoration(

        image: DecorationImage(
            image:AssetImage(settingsprovider.themeMode== ThemeMode.light?'images/default_bg.png':
            'images/dark_bg.png'),
            fit: BoxFit.fill)
    ),
      child: Scaffold(
        appBar: AppBar(
          title: Text(args.suraName),
        ),
        body: Container(
          padding: EdgeInsets.all(24),
          margin: EdgeInsets.symmetric(vertical:MediaQuery.of(context).size.height*0.06 ,horizontal:MediaQuery.of(context).size.width*0.07 ),
          decoration: BoxDecoration(
            color:  Provider.of<Settingsprovider>(context).themeMode==ThemeMode.light?AppTheme.white:
            AppTheme.darkpimary,
            borderRadius: BorderRadius.circular(25)
          ),
          child: ayat.isEmpty?
          loadingInsicator():
          ListView.builder(itemBuilder: (_, index)=> Text(ayat[index],
            textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge,
          ),
            itemCount: ayat.length,),
        ),

      ),
    );

  }
  Future<void>loadSuraFile()async{

    String sura = await rootBundle.loadString('assets/files/${args.index + 1}.txt');
    ayat = sura.split('\r\n');
    setState(() {

    });
  }
}
