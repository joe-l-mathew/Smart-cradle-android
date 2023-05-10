import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ShowPeeAlert extends StatelessWidget {
  const ShowPeeAlert({super.key, required this.height, required this.width});

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // title: Text('Popup Title'),
      content: Container(
        height: height * 0.4,
        width: width * 0.6,
        child: Column(
          children: [
            Text(
              "PEE ALERT",
              style: TextStyle(fontSize: 20),
            ),
            LottieBuilder.asset('assets/animation/care.json'),
            SizedBox(
              height: 10,
            ),
            Text("PARENT CARE REQUIRED"),
          ],
        ),
      ),
    );
  }
}
