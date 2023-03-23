import 'package:flutter/material.dart';
import 'package:gym_tracker/common/constants.dart';
import 'package:gym_tracker/data/shared.dart';
import 'package:gym_tracker/presentation/widgets/CustomButton.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Image.asset(
              "assets/images/onboarding4.png",
              width: w * 0.5,
              height: h * 0.5,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Start Your Workout Plan",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Padding(
              padding: const EdgeInsets.all(26.0),
              child: Text(
                "track your daily weights and performace with simplest tools ",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            getheightspace(30),
            CustomButton(
              text: "Get Started ",
              h: h,
              w: w,
              onpressed: () async {
                await Shared.setbool("isopened", true);

                Navigator.pushReplacementNamed(context, "/home");
              },
            )
          ],
        )
      ]),
    ));
  }
}
