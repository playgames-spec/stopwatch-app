import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stopwatch_app/controllers/stopwatch_controller.dart';

class StopwatchPage extends StatelessWidget {
  StopwatchPage({super.key});

  final StopwatchController stopwatchC = Get.put(StopwatchController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Stopwatch Program"),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(stopwatchC.formatTime(stopwatchC.elapsedTime.value)),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => stopwatchC.start(),
                  child: const Text("start"),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () => stopwatchC.reset(),
                  child: const Text("reset"),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton(
                  onPressed: () => stopwatchC.stop(),
                  child: const Text("stop"),
                ),
              ],
            )
          ],
        )));
  }
}
