import 'package:devera_do_an_cuoi_khoa/features/authorization/domain/entities/user.dart';
import 'package:devera_do_an_cuoi_khoa/core/widgets/button_type_one.dart';
import 'package:devera_do_an_cuoi_khoa/features/authorization/presentation/pages/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../../../main.dart';

class HomePage extends StatelessWidget {
  final bool userLoginStatus;
  final UserEntities? loggedUser;

  const HomePage({Key? key,required this.userLoginStatus, this.loggedUser}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        child: userLoginStatus? Column(
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
                  FirebaseAuth.instance.signOut();
                  final prefs = await SharedPreferences.getInstance();
                  final success = await prefs.remove('counter');
                  navigatorKey.currentState!.pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => RegisterScreen()),
                          (route) => false);
              },
            )
          ],
        ) : Column(
          children: [
            Text(
              'No User'
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'No Email logged'
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
