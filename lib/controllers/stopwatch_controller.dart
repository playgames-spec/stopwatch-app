import 'dart:async';

import 'package:get/get.dart';

class StopwatchController extends GetxController {
  var elapsedTime = 0.obs;
  Timer? _timer;

  void start() {
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      elapsedTime++;
    });
  }

  void stop() {
    _timer?.cancel();
  }

  void reset() {
    _timer?.cancel();
    elapsedTime.value = 0;
  }

  String formatTime(int seconds) {
    int? _hours = seconds ~/ 3600;
    int? _minutes = (seconds % 3600) ~/ 60;
    int? _seconds = (seconds % 60);
    return "${_hours.toString().padLeft(2, '0')}:${_minutes.toString().padLeft(2, '0')}:${_seconds.toString().padLeft(2, '0')}";
  }

  @override
  void onClose() {
    // TODO: implement onClose
    _timer?.cancel();
    super.onClose();
  }
}
