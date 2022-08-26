import 'package:devera_do_an_cuoi_khoa/core/widgets/initial_screen.dart';
import 'package:devera_do_an_cuoi_khoa/core/widgets/logobrand.dart';
import 'package:devera_do_an_cuoi_khoa/features/authorization/presentation/bloc/email_authorization/email_authorize_bloc.dart';
import 'package:devera_do_an_cuoi_khoa/features/authorization/presentation/pages/register_user_info.dart';
import 'package:devera_do_an_cuoi_khoa/features/authorization/presentation/pages/resend_email_screen.dart';
import 'package:devera_do_an_cuoi_khoa/features/products/presentation/pages/landing_screen.dart';
import 'package:devera_do_an_cuoi_khoa/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/form_widget.dart';
import '../widgets/backward_FAB.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:devera_do_an_cuoi_khoa/core/utils/snackbar_message.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      floatingActionButton: BackwardButton(
        icon: new Icon(Icons.arrow_back_ios_new_outlined, color: Colors.orange,),
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
              'Login To Your Account',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(
              height: 25.0,
            ),
            BlocConsumer<EmailAuthorizeBloc, EmailAuthorizeState>(
                builder: (_, state) {
                  return FormWidget(isRegister: false);
                },
                listener: (context, state) {
                  if (state is LoadingUser) {
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
                  else if (state is AuthorizingError) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return CupertinoAlertDialog(
                            title: Text('Error Dialog'),
                            content: Text('Unexpected Error!!'),
                            actions: <Widget>[
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Close')),
                            ],
                          );
                        }
                    );
                  }
                  else if (state is AuthenticationUnauthenticated) {
                    SnakBarMessage().showErrorSnackBar(
                        message: state.message, context: context);
                    Navigator.pop(context);
                  }
                  else if (state is EmailHasNotVerified) {
                    SnakBarMessage().showErrorSnackBar(
                        message: state.message, context: context);
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (_) => ResendEmailScreen()));
                  }
                  else if (state is AuthenticationAuthenticated) {
                    SnakBarMessage().showSuccessSnackBar(
                        message: state.message, context: context);

                    navigatorKey.currentState!.pushAndRemoveUntil(
                        MaterialPageRoute(builder: (_) => LandingPage(
                          userImg: state.userImg,
                          isFromCache: false,
                          loggedUser: state.userEntities,
                        )),
                            (route) => false);
                  }
                  else if (state is NewUser) {
                    SnakBarMessage().showSuccessSnackBar(
                        message: "Hello New User!! Complete Your Bio now!!", context: context);
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(
                        builder: (_) => RegisterUserInfo(
                          userId: state.userId,
                          userEmail: state.userEmail,
                        )));
                  }
                }
            ),
          ],
        ),
      ),
    ));
  }
}
