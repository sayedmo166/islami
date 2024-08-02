import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/tabs/hadeth/hadeth.dart';
import 'package:islami/tabs/hadeth/hadeth_data_screen.dart';


class hadethtab extends StatefulWidget {


  @override
  State<hadethtab> createState() => _hadethtabState();
}

class _hadethtabState extends State<hadethtab> {
  List<Hadeth> ahadeth =[];

  @override
  Widget build(BuildContext context) {
    if(ahadeth.isEmpty ){
    loadAhadethFile();}
    return Column(children: [
      Image.asset('images/hadeth_logo.png',
        height: MediaQuery.of(context).size.height* 0.25,),
      SizedBox(height: 12,),
      Expanded(
        child: ListView.separated(itemBuilder: (_, index)=> GestureDetector(
          onTap: ()=>Navigator.of(context).pushNamed(HadethDataScreen.routeName,
            arguments: ahadeth[index],

          ),
          child: Text(ahadeth[index].title,
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,),
        ),
          itemCount: ahadeth.length,
          separatorBuilder:(_, __)=>SizedBox(height: 12,),
        ),
      ),
    ],
    );
  }
 Future<void > loadAhadethFile() async {
    String hadethfile = await rootBundle.loadString('assets/files/ahadeth.txt');
    List<String> hadethText = hadethfile.split('#');
    ahadeth = hadethText.map(
          (hadethText) {
        List<String> lines = hadethText.trim().split('\n');
        String title = lines.first;
        lines.removeAt(0);
        List<String> content = lines;
        return Hadeth(
          title: title,
          content: content,
        );
      },
    ).toList();
    setState(() {});
  }
}

