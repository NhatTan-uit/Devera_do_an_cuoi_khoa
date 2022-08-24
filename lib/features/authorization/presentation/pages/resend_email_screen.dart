import 'package:flutter/material.dart';
import '../widgets/backward_FAB.dart';
import 'package:devera_do_an_cuoi_khoa/core/widgets/initial_screen.dart';
import 'package:devera_do_an_cuoi_khoa/core/widgets/logobrand.dart';
import '../../../../core/utils/snackbar_message.dart';
import '../widgets/resend_email_widget.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/email_register/email_register_bloc.dart';

class ResendEmailScreen extends StatelessWidget {
  const ResendEmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
        floatingActionButton: BackwardButton(
          icon: new Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.orange,
          ),
          onPress: () {
            Navigator.pop(context);
          },
        ),
        body: SingleChildScrollView(
            child: Initial_Screen(
          widget: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100.0,
              ),
              LogoBrand(),
              const SizedBox(
                height: 25.0,
              ),
              Text(
                'Resend Verifying Email',
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(
                height: 25.0,
              ),
              BlocConsumer<EmailRegisterBloc, EmailRegisterState>(
                  builder: (_, state) {
                    return ResendEmailWidget();
                  },
                  listener: (context, state) {
                    if (state is SignUpVerifyHasNotSent) {
                      SnakBarMessage().showSuccessSnackBar(
                          message: "Preparing verifying email", context: context);
                    }
                    else if (state is SignUpVerifyEmailSent) {
                      SnakBarMessage().showSuccessSnackBar(
                          message: "Verify Email's sent successfully. Please check your email", context: context);
                    }
                  }
              ),
            ],
          ),
        ),),
    );
  }
}
