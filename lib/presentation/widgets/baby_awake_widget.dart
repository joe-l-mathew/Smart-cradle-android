import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_cradle/presentation/widgets/tile_title.dart';

class BabyAwakeWidget extends StatelessWidget {
  const BabyAwakeWidget({
    super.key,
    required this.width,
    required this.height,
    required this.isBabyAwake,
  });

  final double width;
  final double height;
  final bool isBabyAwake;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height * 0.2,
      decoration: BoxDecoration(
        color: !isBabyAwake ? Colors.blue : Colors.red,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: isBabyAwake
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Lottie.asset("assets/animation/babyAwake.json"),
                const TileTitle(title: "BABY AWAKE"),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Lottie.asset("assets/animation/babySleeping.json"),
                const TileTitle(title: "BABY SLEEPING"),
              ],
            ),
    );
  }
}
