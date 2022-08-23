import 'package:flutter/material.dart';

class BackwardButton extends StatelessWidget {
  final VoidCallback onPress;
  final Icon icon;

  const BackwardButton({Key? key, required this.onPress, required this.icon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.0),
      child: Container(
        width: 50.0,
        child: FloatingActionButton(
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          backgroundColor: Colors.pink.withOpacity(0.1),
          child: icon,
          onPressed: onPress,
        ),
      ),
    );
  }
}
