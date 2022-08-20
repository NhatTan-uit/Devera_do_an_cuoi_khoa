import 'package:devera_do_an_cuoi_khoa/features/authorization/presentation/pages/login_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/text_form_field_widget.dart';
import '../../../../core/widgets/button_type_one.dart';

class FormWidget extends StatefulWidget {
  final bool isRegister;
  //final User? user;
  const FormWidget({Key? key, required this.isRegister}) : super(key: key);

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _userController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Form(
            key: _formKey,
            child: !widget.isRegister
                ? Column(
              children: <Widget>[
                TextFormFieldWidget(
                  controller: _emailController,
                  name: 'Email',
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormFieldWidget(
                  controller: _passwordController,
                  name: 'Password',
                ),
                Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ButtonTypeOne(
                        inputText: 'Login',
                        buttonMarginValue: EdgeInsets.fromLTRB(80, 20, 80, 20),
                      ),
                    )
                ),
              ],
            )
                : Column(
              children: <Widget>[
                TextFormFieldWidget(
                  controller: _userController,
                  name: 'Your name...',
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormFieldWidget(
                  controller: _emailController,
                  name: 'Email',
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormFieldWidget(
                  controller: _passwordController,
                  name: 'Password',
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ButtonTypeOne(
                        inputText: 'Register',
                        buttonMarginValue: EdgeInsets.fromLTRB(80, 20, 80, 0),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (_) => LoginScreen()));
                        },
                        child: Container(
                          padding: EdgeInsets.fromLTRB(30.0, 12.0, 30.0, 12.0),
                          child: Text(
                              'already have an account?',
                              style: Theme.of(context).textTheme.bodyText1
                          ),
                        )
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                )
              ],
            ),
          ),
        ),
    );
  }
}
