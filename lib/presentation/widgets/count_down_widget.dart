import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:provider/provider.dart';

import '../../provider/timer_provider.dart';

class CountDownWidget extends StatelessWidget {
  const CountDownWidget({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width * 0.5,
        height: height * 0.15,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.cyan),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Cradle Stops in: ",
                style: TextStyle(color: Colors.white),
              ),
              TimerCountdown(
                timeTextStyle: const TextStyle(color: Colors.white),
                colonsTextStyle: const TextStyle(color: Colors.white),
                descriptionTextStyle:
                    const TextStyle(color: Colors.white),
                format: CountDownTimerFormat.minutesSeconds,
                endTime: DateTime.now().add(
                  Duration(
                    minutes:
                        Provider.of<TimerProvider>(context, listen: false)
                            .minutes,
                  ),
                ),
                onEnd: () {
                  Provider.of<TimerProvider>(context, listen: false)
                      .changeTime(0);
                },
              ),
            ],
          ),
        ),
      );
  }
}
