import 'package:devera_do_an_cuoi_khoa/features/authorization/presentation/bloc/email_authorization/email_authorize_bloc.dart';
import 'package:devera_do_an_cuoi_khoa/features/authorization/presentation/bloc/email_register/email_register_bloc.dart';
import 'package:devera_do_an_cuoi_khoa/features/introduction/presentation/pages/onboarding_introduction_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:devera_do_an_cuoi_khoa/core/theme/app_theme.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  await di.init();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));

  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (_) => di.s1<EmailAuthorizeBloc>()..add(CheckLoggedInEvent()),
          ),
          BlocProvider(
              create: (_) => di.s1<EmailRegisterBloc>(),
          ),
        ],
        child: MaterialApp(
          title: 'FinalProjectApp',
          theme: AppTheme.light,
          darkTheme: AppTheme.dark,
          themeMode: ThemeMode.system,
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          home: const OnboardingWaitingPage(),
        )
    );
  }
}

