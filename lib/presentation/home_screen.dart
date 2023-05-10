import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:provider/provider.dart';
import 'package:smart_cradle/presentation/widgets/baby_awake_widget.dart';
import 'package:smart_cradle/presentation/widgets/baby_sleep_health_widget.dart';
import 'package:smart_cradle/presentation/widgets/cradle_status_widget.dart';
import 'package:smart_cradle/provider/timer_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 188, 240, 229),
      body: Column(
        children: [
          CradleStatusWidget(
            height: height,
            width: width,
            isOn: true,
          ),
          SizedBox(
            height: 10,
            width: width,
          ),
          BabyAwakeWidget(
            width: width,
            height: height,
            isBabyAwake: false,
          ),
          const Divider(
            height: 1,
          ),
          BabySleepHealthWidget(width: width, height: height, status: 0)
        ],
      ),
      floatingActionButton: Provider.of<TimerProvider>(context).minutes == 0
          ? GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    isScrollControlled: false,
                    context: context,
                    builder: (builder) => TimerPage(
                          width: width,
                          height: height,
                        ));
              },
              child: Container(
                width: width * 0.5,
                height: height * 0.08,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "SET TIMER",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.timer_outlined,
                        color: Colors.white,
                      )
                    ]),
              ),
            )
          : Container(
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
                      descriptionTextStyle: const TextStyle(color: Colors.white),
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
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

Duration _duration = const Duration(hours: 0, minutes: 0);

class TimerPage extends StatefulWidget {
  const TimerPage({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: widget.height * 0.7,
        width: widget.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            DurationPicker(
              height: widget.height * 0.5,
              width: widget.width - 120,
              duration: _duration,
              onChange: (val) {
                setState(() => _duration = val);
              },
              snapToMins: 5.0,
            ),
            GestureDetector(
              onTap: () {
                if (_duration.inMinutes != 0) {
                  Provider.of<TimerProvider>(context, listen: false)
                      .changeTime(_duration.inMinutes);
                  Navigator.pop(context);
                }
              },
              child: Container(
                width: widget.width * 0.5,
                height: widget.height * 0.06,
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                  child: Text(
                    "START",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 1,
            )
          ],
        ));
  }
}
