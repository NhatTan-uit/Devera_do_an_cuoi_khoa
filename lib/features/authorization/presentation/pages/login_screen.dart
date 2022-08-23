import 'package:devera_do_an_cuoi_khoa/core/widgets/initial_screen.dart';
import 'package:devera_do_an_cuoi_khoa/core/widgets/logobrand.dart';
import 'package:flutter/material.dart';
import '../widgets/form_widget.dart';
import '../widgets/backward_FAB.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: BackwardButton(
        icon: new Icon(Icons.arrow_back_ios_new_outlined, color: Colors.orange,),
        onPress: () {
          Navigator.pop(context);
          },
      ),
        body: SingleChildScrollView(
      child: Initial_Screen(
        widget: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100.0,
            ),
            LogoBrand(),
            const SizedBox(
              height: 25.0,
            ),
            Text(
              'Login To Your Account',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(
              height: 25.0,
            ),
            FormWidget(isRegister: false),
          ],
        ),
      ),
    ));
  }
}
