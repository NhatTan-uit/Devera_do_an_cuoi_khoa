import 'package:flutter/material.dart';

import 'logobrandonly_or_withauthorization.dart';

class Initial_Screen extends StatelessWidget {
  const Initial_Screen({Key? key, required this.widget}) : super(key: key);

  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/foodninja-background.png'),
          fit: BoxFit.fill,
        ),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [
                0.0,
                0.5,
              ],
              colors: [
                Colors.white.withOpacity(0.1),
                Colors.white,
              ]
          ),
        ),
        child: widget,
      ),
    );
  }
}
