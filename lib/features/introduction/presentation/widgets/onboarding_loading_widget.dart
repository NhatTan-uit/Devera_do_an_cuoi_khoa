import 'package:flutter/material.dart';
import 'package:devera_do_an_cuoi_khoa/core/widgets/logobrand.dart';
import '../../../../core/widgets/initial_screen.dart';

class OnboardingLoadingWidget extends StatelessWidget {
  const OnboardingLoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Initial_Screen(
        widget: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            LogoBrand(),
            const SizedBox(
              height: 20,
            ),
            CircularProgressIndicator(color: Colors.blueAccent,),
          ],
        ),
    );
  }
}
