import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import '../tabs/radio/default_button.dart';
import '../tabs/radio/radioModel.dart';

class radio_widget extends StatelessWidget {
  const radio_widget({super.key, required this.radios, required this.player, required this.next, required this.previous,});
  final Radios radios;
  final  AudioPlayer player;
  final Function next,previous;

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(radios.name??'',style:TextStyle(color: Colors.white) ,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Default_Button(
                  icon: Icons.skip_previous_rounded, size: 35, onpress: () {
                    previous();
              }),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 14),
                child: Default_Button(
                    icon: Icons.play_arrow_rounded, size: 55, onpress: () {
                      player.play(UrlSource(radios.url!));
                }),
              ),
              Default_Button(
                  icon: Icons.pause, size: 35, onpress: () {player.pause();
              }),
              Default_Button(
                  icon: Icons.skip_next_rounded, size: 35, onpress: () {
                    next();
              }),
            ],
          ),

        ],
      ),

    );
  }
}
