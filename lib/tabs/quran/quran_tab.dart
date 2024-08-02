import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:islami/tabs/quran/sura_details_screen.dart';

class quranTab extends StatelessWidget {
List<String> suraName = ["الفاتحه","البقرة","آل عمران","النساء","المائدة","الأنعام","الأعراف","الأنفال","التوبة","يونس","هود"
  ,"يوسف","الرعد","إبراهيم","الحجر","النحل","الإسراء","الكهف","مريم","طه","الأنبياء","الحج","المؤمنون"
  ,"النّور","الفرقان","الشعراء","النّمل","القصص","العنكبوت","الرّوم","لقمان","السجدة","الأحزاب","سبأ"
  ,"فاطر","يس","الصافات","ص","الزمر","غافر","فصّلت","الشورى","الزخرف","الدّخان","الجاثية","الأحقاف"
  ,"محمد","الفتح","الحجرات","ق","الذاريات","الطور","النجم","القمر","الرحمن","الواقعة","الحديد","المجادلة"
  ,"الحشر","الممتحنة","الصف","الجمعة","المنافقون","التغابن","الطلاق","التحريم","الملك","القلم","الحاقة","المعارج"
  ,"نوح","الجن","المزّمّل","المدّثر","القيامة","الإنسان","المرسلات","النبأ","النازعات","عبس","التكوير","الإنفطار"
  ,"المطفّفين","الإنشقاق","البروج","الطارق","الأعلى","الغاشية","الفجر","البلد","الشمس","الليل","الضحى","الشرح"
  ,"التين","العلق","القدر","البينة","الزلزلة","العاديات","القارعة","التكاثر","العصر",
  "الهمزة","الفيل","قريش","الماعون","الكوثر","الكافرون","النصر","المسد","الإخلاص","الفلق","الناس"];
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Image.asset('images/qur2an_screen_logo.png',
      height: MediaQuery.of(context).size.height* 0.25,),
      SizedBox(height: 12,),
      Expanded(
        child: ListView.separated(itemBuilder: (_, index)=> GestureDetector(
          onTap: ()=>Navigator.of(context).pushNamed(suraDetailsScreen.routeName,
            arguments: SuraDetailsArgs(suraName: suraName[index], index: index),

          ),
          child: Text(suraName[index],
          style: Theme.of(context).textTheme.headlineSmall,
          textAlign: TextAlign.center,),
        ),
          itemCount: suraName.length,
          separatorBuilder:(_, __)=>SizedBox(height: 12,),
        ),
      ),
    ],
    );
  }
}
class SuraDetailsArgs {
  String suraName ;
  int index ;
  SuraDetailsArgs({required this.suraName ,required this.index});
}
