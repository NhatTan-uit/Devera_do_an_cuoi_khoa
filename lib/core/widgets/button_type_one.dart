import 'package:flutter/material.dart';

class ButtonTypeOne extends StatelessWidget {
  const ButtonTypeOne({Key? key, required this.inputText, required this.buttonMarginValue, this.onPress}) : super(key: key);

  final String inputText;
  final EdgeInsets? buttonMarginValue;
  final VoidCallback? onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: buttonMarginValue,
      width: double.infinity,
      child: ElevatedButton(
          onPressed: onPress,
          child: Text(
            inputText,
            style: Theme.of(context).textTheme.button,
          )
      ),
    );
  }
}
