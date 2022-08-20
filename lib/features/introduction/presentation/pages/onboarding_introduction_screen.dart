import 'package:devera_do_an_cuoi_khoa/features/authorization/presentation/pages/register_screen.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/logobrand.dart';
import '../../../../core/widgets/initial_screen.dart';

class OnboardingWaitingPage extends StatefulWidget {
  const OnboardingWaitingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingWaitingPage> createState() => _OnboardingWaitingPageState();
}

class _OnboardingWaitingPageState extends State<OnboardingWaitingPage> with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(seconds: 3),
            () => Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => const RegisterScreen()))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Initial_Screen(
          widget: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              LogoBrand(),
              const SizedBox(
                height: 10,
              ),
              CircularProgressIndicator(color: Colors.blueAccent,),
            ],
          ),
      ),
    );
  }
}
