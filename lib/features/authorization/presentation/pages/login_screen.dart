import 'package:devera_do_an_cuoi_khoa/core/widgets/initial_screen.dart';
import 'package:devera_do_an_cuoi_khoa/core/widgets/logobrandonly_or_withauthorization.dart';
import 'package:flutter/material.dart';
import '../../../../core/widgets/button_type_one.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

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
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      } else
                        null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      } else
                        null;
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: ButtonTypeOne(
        inputText: 'Login',
        buttonMarginValue: EdgeInsets.fromLTRB(100, 20, 100, 20),
      ),
    );
  }
}
