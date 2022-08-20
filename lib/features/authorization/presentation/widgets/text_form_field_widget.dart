import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String name;

  const TextFormFieldWidget({Key? key,required this.name, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      scrollPadding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          hintText: name,
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
      validator: (val) => val!.isEmpty ? "$name Can't be empty" : null,
    );
  }
}
