import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit() : super(0);

  void increment() => emit(state + 1);

  void decrement() => emit(state - 1);
  // void sozdor = SozdorModel

  // playerMetod() {
  //   final player = AudioPlayer();
  //   final audioZapis = sozdor.state.zapis;
  //   player.play(AssetSource('player/$audioZapis'));
  // }

  // void timeSozdor() {
  //   Timer.periodic(const Duration(seconds: 4), (Timer t) {
  //     playerMetod();
  //     emit(state + 1);
  //     // setState(() {
  //     sozdor[index++].text;
  //     if (state == sozdor.length) {
  //       emit(state - 1);
  //       emit(state = 0);
  //     }
  //     // });
  //   });
  // }
}
