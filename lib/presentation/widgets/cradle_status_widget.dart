import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_cradle/presentation/widgets/tile_title.dart';

class CradleStatusWidget extends StatelessWidget {
  const CradleStatusWidget({
    super.key,
    required this.height,
    required this.width,
    required this.isOn,
  });

  final double height;
  final double width;
  final bool isOn;

  @override
  Widget build(BuildContext context) {
    return isOn
        ? Container(
            height: height * 0.2,
            width: width,
            decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  width: 20,
                ),
                 const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TileTitle(
                      title: "CRADLE OSCILATING",
                    ),
                    Text(
                      "TAP TO STOP",
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    )
                  ],
                ),
                Expanded(
                    child: Lottie.asset('assets/animation/oscilating.json')),
              ],
            ),
          )
        : Container(
            height: height * 0.2,
            width: width,
            decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(width: 20),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "CRADLE STOPPED",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      "TAP TO START",
                      style: TextStyle(fontSize: 10, color: Colors.white),
                    )
                  ],
                ),
                Expanded(
                  child: Lottie.asset('assets/animation/oscilatingStop.json',
                      animate: false),
                ),
              ],
            ),
          );
  }
}

