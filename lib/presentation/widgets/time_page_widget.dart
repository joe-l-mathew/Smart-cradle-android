import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/timer_provider.dart';

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
