import 'package:flutter/material.dart';

class LogoBrand extends StatelessWidget {
  const LogoBrand({Key? key, this.authorizingForm}) : super(key: key);

  final Widget? authorizingForm;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundImage: AssetImage('assets/images/foodninja-logo.png'),
          backgroundColor: Colors.transparent,
          radius: 60,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'FoodNinja',
          style: Theme.of(context).textTheme.headline3,
        ),
        Text(
          'Deliever Favorite Food',
          style: Theme.of(context).textTheme.subtitle1,
        ),
        const SizedBox(
          height: 20,
        ),
        Container(
          child: authorizingForm,
        )
      ],
    );
  }
}
