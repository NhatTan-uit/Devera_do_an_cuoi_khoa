import 'package:flutter/material.dart';
import 'package:devera_do_an_cuoi_khoa/core/widgets/initial_screen.dart';
import 'package:devera_do_an_cuoi_khoa/core/widgets/logobrand.dart';
import '../widgets/form_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Initial_Screen(
        widget: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50.0,
            ),
            LogoBrand(),
            const SizedBox(
              height: 25.0,
            ),
            Text(
              'Sign Up For Free',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(
              height: 25.0,
            ),
            FormWidget(isRegister: true),
          ],
        ),
      ),
    ));
  }
}
