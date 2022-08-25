import 'package:devera_do_an_cuoi_khoa/features/introduction/presentation/bloc/check_user_cache/check_user_cache_bloc.dart';
import 'package:devera_do_an_cuoi_khoa/features/authorization/presentation/pages/register_screen.dart';
import 'package:devera_do_an_cuoi_khoa/features/products/presentation/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/onboarding_loading_widget.dart';
import '../widgets/Introduction_widget.dart';

class OnboardingWaitingPage extends StatelessWidget {
  const OnboardingWaitingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<CheckUserCacheBloc, CheckUserCacheState>(
        builder: (context, state) {
          if (state is Processing) {
            return OnboardingLoadingWidget();
          }
          else if (state is UserFirstTimeToApp) {
            return IntroductionToAppWidget();
          }
          else if (state is UserCached) {
            return HomePage(
              isFromCache: true,
              cachedUser: state.checkUserEntities,
            );
          }
          else if (state is UserUnCached) {
            return RegisterScreen();
          }
          else if (state is UserBeenToApp) {
            return RegisterScreen();
          }
          return OnboardingLoadingWidget();
        }
      ),
    );
  }
}
