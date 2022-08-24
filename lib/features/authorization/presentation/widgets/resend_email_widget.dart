import 'package:flutter/material.dart';
import 'timer_button_widget.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/email_register/email_register_bloc.dart';

class ResendEmailWidget extends StatefulWidget {
  const ResendEmailWidget({Key? key}) : super(key: key);

  @override
  State<ResendEmailWidget> createState() => _ResendEmailWidgetState();
}

class _ResendEmailWidgetState extends State<ResendEmailWidget> with TickerProviderStateMixin{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 25.0,
        ),
        TimerButton(
          label: "Resend",
          onPressed: resendEmail,
          timeOutInSeconds: 10,
          buttonType: ButtonType.ElevatedButton,
          disabledColor: Theme.of(context).primaryColor.withOpacity(0.5),
          color: Theme.of(context).primaryColor,
          disabledTextStyle: new TextStyle(color: Colors.grey),
        ),
      ],
    );
  }

  void resendEmail() async {
    BlocProvider.of<EmailRegisterBloc>(context)
        .add(await ResendEvent());
  }
}

