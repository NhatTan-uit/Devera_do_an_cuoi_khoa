import 'dart:ffi';

import 'package:flutter/material.dart';

class BioItemContainer extends StatelessWidget {
  final VoidCallback? onTap;
  final Widget widget;
  const BioItemContainer({Key? key, required this.widget, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 4,// Shadow position
              ),
            ]
        ),
        child: Container(
          height: MediaQuery.of(context).size.height/7,
          color: Theme.of(context).colorScheme.secondary,
          child: widget,
        ),
      ),
    );
  }
}
