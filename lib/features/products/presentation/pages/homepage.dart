import 'package:devera_do_an_cuoi_khoa/features/authorization/domain/entities/user.dart';
import 'package:devera_do_an_cuoi_khoa/core/widgets/button_type_one.dart';
import 'package:devera_do_an_cuoi_khoa/features/authorization/presentation/bloc/email_authorization/email_authorize_bloc.dart';
import 'package:devera_do_an_cuoi_khoa/features/authorization/presentation/pages/register_screen.dart';
import 'package:devera_do_an_cuoi_khoa/features/introduction/domain/entities/cache_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../main.dart';

class HomePage extends StatelessWidget {
  final bool isFromCache;
  final UserEntities? loggedUser;
  final CacheUserEntities? cachedUser;

  const HomePage({
    Key? key,
    required this.isFromCache,
    this.loggedUser,
    this.cachedUser
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        child: !isFromCache? Column(
          children: [
            Text(
                loggedUser!.userId.toString()
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
                loggedUser!.userEmail.toString()
            ),
            const SizedBox(
              height: 20,
            ),
            ButtonTypeOne(
              inputText: 'Logout',
              buttonMarginValue: EdgeInsets.all(0.0),
              onPress: () async {
                BlocProvider.of<EmailAuthorizeBloc>(context).add(await LogoutEvent());

                navigatorKey.currentState!.pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => RegisterScreen()),
                        (route) => false);
              },
            )
          ],
        ) : Column(
          children: [
            Text(
                cachedUser!.userId.toString()
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
                cachedUser!.userImg.toString()
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
                cachedUser!.userEmail.toString()
            ),
            const SizedBox(
              height: 20,
            ),
            ButtonTypeOne(
              inputText: 'Logout',
              buttonMarginValue: EdgeInsets.all(0.0),
              onPress: () async {
                BlocProvider.of<EmailAuthorizeBloc>(context).add(await LogoutEvent());

                navigatorKey.currentState!.pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => RegisterScreen()),
                        (route) => false);
              },
            )
          ],
        ),
      ),
    );
  }
}