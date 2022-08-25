import 'package:flutter/material.dart';
import '../widgets/backward_FAB.dart';
import 'package:devera_do_an_cuoi_khoa/core/widgets/initial_screen.dart';

class RegisterUserInfo extends StatelessWidget {
  const RegisterUserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: BackwardButton(
        icon: new Icon(
          Icons.arrow_back_ios_new_outlined,
          color: Colors.orange,
        ),
        onPress: () {
          Navigator.pop(context);
        },
      ),
      body: SingleChildScrollView(
        child: Initial_Screen(
          widget: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100.0,
              ),
              Text(
                'Fill in your BIO',
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(
                height: 25.0,
              ),
            ],
          ),
        ),),
    );
  }
}
