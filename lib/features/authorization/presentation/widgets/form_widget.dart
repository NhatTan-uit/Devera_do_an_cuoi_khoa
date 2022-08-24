import 'package:devera_do_an_cuoi_khoa/features/authorization/domain/entities/user.dart';
import 'package:devera_do_an_cuoi_khoa/features/authorization/presentation/pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/text_form_field_widget.dart';
import '../../../../core/widgets/button_type_one.dart';

import '../bloc/email_authorization/email_authorize_bloc.dart';
import '../bloc/email_register/email_register_bloc.dart';

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
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
                  isObscured: false,
                  isEmailValidation: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormFieldWidget(
                  controller: _passwordController,
                  name: 'Password',
                  isObscured: true,
                  isEmailValidation: false,
                ),
                Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ButtonTypeOne(
                        inputText: 'Login',
                        buttonMarginValue: EdgeInsets.fromLTRB(80, 20, 80, 20),
                        onPress: authorizingRequest,
                      ),
                    )
                ),
              ],
            )
                : Column(
              children: <Widget>[
                TextFormFieldWidget(
                  icon: Icon(Icons.account_circle_sharp, color: Theme.of(context).primaryColor,),
                  controller: _userController,
                  name: 'Your name...',
                  isObscured: false,
                  isEmailValidation: false,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormFieldWidget(
                  icon: Icon(Icons.mail, color: Theme.of(context).primaryColor,),
                  controller: _emailController,
                  name: 'Email',
                  isObscured: false,
                  isEmailValidation: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormFieldWidget(
                  icon: Icon(Icons.lock, color: Theme.of(context).primaryColor,),
                  controller: _passwordController,
                  name: 'Password',
                  isObscured: true,
                  isEmailValidation: false,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ButtonTypeOne(
                        inputText: 'Register',
                        buttonMarginValue: EdgeInsets.fromLTRB(80, 20, 80, 0),
                        onPress: registerRequest,
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

  void authorizingRequest() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final userinput = UserEntities(
          userEmail: _emailController.text,
          passWord: _passwordController.text
      );

     BlocProvider.of<EmailAuthorizeBloc>(context)
          .add(await LoginEvent(userEntities: userinput));
    }
  }

  void registerRequest() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final userinput = UserEntities(
          userEmail: _emailController.text,
          passWord: _passwordController.text
      );

      BlocProvider.of<EmailRegisterBloc>(context)
          .add(await SignUpEvent(userEntities: userinput));

      Navigator.of(context).push(MaterialPageRoute(builder: (_) => LoginScreen()));
    }
  }
}
