import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class TextFormFieldWidget extends StatelessWidget {
  final bool isEmailValidation;
  final bool isObscured;
  final TextEditingController controller;
  final String name;

  const TextFormFieldWidget({Key? key,
    required this.isEmailValidation,
    required this.isObscured,
    required this.name,
    required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscured,
      controller: controller,
      scrollPadding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          hintText: name,
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
      validator: (val) {
        if (val!.isEmpty) {
          return "$name Can't be empty";
        }
        else if (isEmailValidation){
          return !EmailValidator.validate(val)? "The email address is badly formatted" : null;
        }
        else {
          return val.length < 6 ? "Fields must contain atleast 6 characters" : null;
        }
      },
    );
  }
}
