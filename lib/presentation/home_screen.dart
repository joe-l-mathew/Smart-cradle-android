import 'package:flutter/material.dart';
import 'package:smart_cradle/presentation/widgets/baby_awake_widget.dart';
import 'package:smart_cradle/presentation/widgets/baby_sleep_health_widget.dart';
import 'package:smart_cradle/presentation/widgets/cradle_status_widget.dart';

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
      floatingActionButton: GestureDetector(
        onTap: () {
          showModalBottomSheet(
              context: context,
              builder: (builder) => Container(
                    height: 300,
                    width: width,
                  ));
        },
        child: Container(
          width: width * 0.5,
          height: height * 0.08,
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(20),
          ),
          child:
              const Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
