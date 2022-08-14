import 'package:devera_do_an_cuoi_khoa/features/authorization/presentation/pages/login_screen.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/logobrandonly_or_withauthorization.dart';
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
                builder: (BuildContext context) => const LoginScreen()))
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Initial_Screen(
          widget: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
