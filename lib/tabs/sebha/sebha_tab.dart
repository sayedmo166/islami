import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:islami/app_theme.dart';
import 'package:islami/tabs/setting/settings.dart';
import 'package:provider/provider.dart';

class SebhaTab extends StatefulWidget {
  @override
  State<SebhaTab> createState() => _SebhaTabState();
  static const routeName = '/sebha-screen';
}

class _SebhaTabState extends State<SebhaTab> {
  int tasbeh = 0;
  double degree = 28.76;
  String lable = 'سبحان الله';
  @override
  Widget build(BuildContext context) {
    Settingsprovider settingsprovider =  Provider.of<Settingsprovider>(context);

    return Center(
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 10),
                child: Image.asset(settingsprovider.themeMode==ThemeMode.light?
                  'images/head_sebha_logo.png' : 'images/head_sebha_dark.png',
                  height: MediaQuery.of(context).size.height / 10,
                  width: MediaQuery.of(context).size.width / 4,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 14.3),
                child: GestureDetector(
                  onTap: () {
                    tasbeh++;
                    if (tasbeh == 34) {
                      lable = 'الحمد لله';
                    } else if (tasbeh == 67) {
                      lable = 'الله اكبر';
                    } else if (tasbeh == 100) {
                      tasbeh = 0;
                      lable = 'بسم الله';
                    }

                    degree += 10.03;
                    setState(() {});
                  },
                  child: RotationTransition(
                    turns: AlwaysStoppedAnimation(degree),
                    child: Image.asset(
                      settingsprovider.themeMode==ThemeMode.light?
                      'images/body_sebha_logo.png' : 'images/body_sebha_dark.png',height: MediaQuery.of(context).size.height / 4,
                      width: MediaQuery.of(context).size.width / 2,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 20,
          ),
          Text(
            'عدد التسبيحات',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height / 30),
            height: MediaQuery.of(context).size.height / 10.5,
            width: MediaQuery.of(context).size.width / 6,
            decoration: BoxDecoration(
              color: AppTheme.lightprimary.withOpacity(0.6),
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text(
              '$tasbeh',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: MediaQuery.of(context).size.height / 17,
            width: MediaQuery.of(context).size.width / 2.8,
            decoration: BoxDecoration(
              color: AppTheme.lightprimary,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text(
              lable,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}