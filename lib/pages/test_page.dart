// ignore_for_file: unused_field

import 'dart:async';

import 'package:flutter/material.dart';

import 'package:master_bot/components/app_bar_widget.dart';
import 'package:master_bot/components/custom_buttom.dart';
import 'package:master_bot/components/slider.dart';
import 'package:master_bot/constants/app_color.dart';
import 'package:master_bot/models/suroo_model.dart';

class TestPage extends StatefulWidget {
  const TestPage({
    super.key,
    required this.suroo,
  });

  final List<Suroo> suroo;

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  int index = 0;
  int tuuraJoop = 0;
  int katajoop = 0;
  Color testColor = AppColor.contColor;
  Color colorTest = AppColor.contColor;

  Timer? _timer;

  bool _isRunning = false;
  final Duration _oneSec = const Duration(seconds: 5);

  void _startTimer() {
    _timer = Timer.periodic(_oneSec, (Timer timer) {
      setState(() {
        widget.suroo[index++];
      });
      testColor = AppColor.contColor;
      if (index == widget.suroo.length) {
        setState(
          () {
            _pauseTimer();
            index--;
            index = 0;
            katajoop = 0;
            tuuraJoop = 0;
          },
        );
      }
    });
    setState(() {
      _isRunning = true;
    });
  }

  void _pauseTimer() {
    if (_timer != null) {
      _timer!.cancel();
      setState(() {
        _isRunning = false;
      });
    }
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldBaground,
      appBar: AppBar(
        backgroundColor: AppColor.scaffoldBaground,
        title: AppBarWidget(
          suroolordunSany: index,
          tuuraJoop: tuuraJoop,
          kataJoop: katajoop,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(7),
        child: Column(children: [
          sliderWidget(value: index.toDouble()),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: testColor,
            ),
            width: double.infinity,
            height: 290,
            child: Column(
              children: [
                const Spacer(),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    widget.suroo[index].text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
          const SizedBox(height: 5),
          CustomButton(
            onTap: (isTrue) {
              if (isTrue == true) {
                tuuraJoop++;
                setState(() {
                  testColor = AppColor.tuuraColor;
                });
              } else {
                setState(() {
                  testColor = AppColor.kataColor;
                });
                katajoop++;
              }
            },
            jooptor: widget.suroo[index].jooptor,
          ),
          Container(
            color: AppColor.contColor,
            width: double.infinity,
            height: 47,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _isRunning
                    ? ElevatedButton(
                        onPressed: () {
                          _pauseTimer();
                          showDialog<void>(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: const Text('Тестин жыйынтыгы'),
                                  content: Text(
                                    'берилген суроолор: $index\n '
                                    'Туура жообтор: $tuuraJoop\n'
                                    'Ката жооптоп: $katajoop\n',
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .labelLarge,
                                      ),
                                      child: const Text('Артка'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              });
                        },
                        child: const Icon(Icons.pause),
                      )
                    : ElevatedButton(
                        onPressed: () {
                          _startTimer();
                        },
                        child: const Icon(Icons.play_arrow),
                      ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ]),
      ),
    );
  }
}
