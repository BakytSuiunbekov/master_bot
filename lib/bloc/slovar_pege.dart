import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import 'package:master_bot/components/slider.dart';
import 'package:master_bot/constants/app_color.dart';
import 'package:master_bot/models/sozduk_detals_model.dart';

class SlovarPege extends StatefulWidget {
  const SlovarPege({
    super.key,
    required this.sozdor,
  });
  final List<SozdorZapisModel> sozdor;

  @override
  State<SlovarPege> createState() => _SlovarPegeState();
}

class _SlovarPegeState extends State<SlovarPege> {
  int index = 0;
  bool isPlaying = false;
  bool isTimeSozdor = false;
  var orusContent = dialog;

  playerMetod() {
    final player = AudioPlayer();
    final audioZapis = widget.sozdor[index].zapis;
    player.play(AssetSource('player/$audioZapis'));
  }

  void timeSozdor() {
    Timer.periodic(const Duration(seconds: 4), (Timer t) {
      playerMetod();
      setState(() {
        widget.sozdor[index++].text;
        if (index == widget.sozdor.length) {
          index--;
          index = 0;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Card(
                  color: AppColor.scaffoldBaground,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                    child: Text('$index',
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w700)),
                  ),
                ),
                Card(
                  color: AppColor.scaffoldBaground,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.translate,
                        color: Colors.black,
                        size: 25,
                      ),
                    ),
                  ),
                ),
                Card(
                  color: AppColor.scaffoldBaground,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 2),
                    child: Text(orusContent.length.toString(),
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w700)),
                  ),
                ),
              ],
            ),
            const Spacer(),
            sliderWidget(value: index.toDouble()),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7),
                  color: AppColor.contColor),
              width: double.infinity,
              height: 230,
              child: Column(
                children: [
                  const Spacer(),
                  const Padding(
                    padding: EdgeInsets.all(4),
                  ),
                  const SizedBox(height: 10),
                  const Align(
                    alignment: Alignment.center,
                    child: Text(
                      // widget.sozdor[index].text,

                      'gj',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    decoration: BoxDecoration(
                        color: AppColor.scaffoldBaground,
                        borderRadius: BorderRadius.circular(10)),
                    width: 200,
                    height: 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              index--;
                            });
                          },
                          icon: const Icon(Icons.skip_previous),
                        ),
                        IconButton(
                          onPressed: () {
                            // (isTimeSozdor == true) ? timeSozdor() : null;
                            timeSozdor();
                            setState(() {
                              isTimeSozdor = !isTimeSozdor;

                              isPlaying = !isPlaying;
                            });
                          },
                          icon: Icon(
                            (isPlaying == true)
                                ? Icons.pause
                                : Icons.play_arrow,
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              index++;
                            });
                          },
                          icon: const Icon(Icons.skip_next),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  )
                ],
              ),
            ),
            const Spacer(),
            Container(
              decoration: BoxDecoration(
                  color: AppColor.contColor,
                  borderRadius: BorderRadius.circular(10)),
              width: double.infinity,
              height: 330,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return TextButton(
                      onPressed: () {
                        orusContent = dialog;
                      },
                      child: const Text('Туура окуу'));
                },
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
