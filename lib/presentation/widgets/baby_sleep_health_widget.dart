import 'package:flutter/material.dart';

class BabySleepHealthWidget extends StatelessWidget {
  const BabySleepHealthWidget({
    super.key,
    required this.width,
    required this.height,
    required this.status,
  });

  final double width;
  final double height;
  final int status;

  @override
  Widget build(BuildContext context) {
    List<String> dataList = ['VERY LOW', "LOW", "MEDIUM", "HIGH", "BABY AWAKE"];
    return Container(
      width: width,
      height: height * 0.2,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(bottom: Radius.circular(20)),
          color: status == 0
              ? Colors.green
              : status == 1
                  ? const Color.fromARGB(255, 93, 161, 95)
                  : status == 2
                      ? const Color.fromARGB(255, 72, 98, 73)
                      : status == 3
                          ? const Color.fromARGB(255, 145, 72, 67)
                          : Colors.red),
      child: Center(
          child: Text(
        "BABY WAKE CHANCE: ${dataList[status]}",
        style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),
      )),
    );
  }
}
