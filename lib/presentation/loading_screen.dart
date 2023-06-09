import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/animation/logo.png'),
          const SizedBox(
            height: 50,
          ),
          const Center(
            child: Text(
              "DESIGN AND DEVELOPMENT OF SMART CRADLE",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "DEPARTMENT OF MECHANICAL ENGINEERING",
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "VIMAL JYOTHI ENGINNERING COLLEGE KANNUR",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 150,
          ),
          Center(
            child: LoadingAnimationWidget.threeArchedCircle(
                color: Colors.black, size: 50),
          )
        ],
      ),
    );
  }
}
