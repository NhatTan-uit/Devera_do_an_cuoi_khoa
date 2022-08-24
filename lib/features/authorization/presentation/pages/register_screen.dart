import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:devera_do_an_cuoi_khoa/core/widgets/initial_screen.dart';
import 'package:devera_do_an_cuoi_khoa/core/widgets/logobrand.dart';
import '../../../../core/utils/snackbar_message.dart';
import '../widgets/form_widget.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:devera_do_an_cuoi_khoa/features/authorization/presentation/bloc/email_register/email_register_bloc.dart';


class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Initial_Screen(
        widget: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50.0,
            ),
            LogoBrand(),
            const SizedBox(
              height: 25.0,
            ),
            Text(
              'Sign Up For Free',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(
              height: 25.0,
            ),
            BlocConsumer<EmailRegisterBloc, EmailRegisterState>(
                builder: (_, state) {
                  if (state is SignUpVerifyHasNotSent) {
                    return Column(
                      children: [
                        Text(
                          'Veryfy mail is sending to you...',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                          ),
                        )
                      ],
                    );
                  }
                  return FormWidget(isRegister: true);
                },
                listener: (context, state) {
                  if (state is SignUpLoading) {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                    );
                  }
                  else if (state is SignUpFailed) {
                    SnakBarMessage().showErrorSnackBar(
                        message: state.message, context: context);

                    Navigator.pop(context);
                  }
                  else if (state is SignUpVerifyEmailSent) {
                    SnakBarMessage().showSuccessSnackBar(
                        message: "Verify Email sent successfully. Please check your email", context: context);
                    Navigator.pop(context);
                  }
                }
            ),
          ],
        ),
      ),
    ));
  }
}
