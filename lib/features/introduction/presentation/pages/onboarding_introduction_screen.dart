import 'package:devera_do_an_cuoi_khoa/features/authorization/presentation/bloc/email_authorization/email_authorize_bloc.dart';
import 'package:devera_do_an_cuoi_khoa/features/authorization/presentation/pages/register_screen.dart';
import 'package:devera_do_an_cuoi_khoa/features/homepage/presentation/pages/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/onboarding_loading_widget.dart';

class OnboardingWaitingPage extends StatelessWidget {
  const OnboardingWaitingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<EmailAuthorizeBloc, EmailAuthorizeState>(
        builder: (context, state) {
          if (state is LoadingUser) {
            return OnboardingLoadingWidget();
          }
          else if (state is LoggedUser) {
            return HomePage(
              userLoginStatus: true,
              loggedUser: state.userEntities,
            );
          }
          else if (state is UnLoggedUser) {
            return RegisterScreen();
          }
          return OnboardingLoadingWidget();
        }
      ),
    );
  }
}


// class OnboardingWaitingPage extends StatefulWidget {
//   const OnboardingWaitingPage({Key? key}) : super(key: key);
//
//   @override
//   State<OnboardingWaitingPage> createState() => _OnboardingWaitingPageState();
// }
//
// class _OnboardingWaitingPageState extends State<OnboardingWaitingPage> with SingleTickerProviderStateMixin {
//   @override
//   void initState() {
//     super.initState();
//     Future.delayed(
//         const Duration(seconds: 3),
//             () => Navigator.pushReplacement(
//             context,
//             MaterialPageRoute(
//                 builder: (BuildContext context) => const RegisterScreen()))
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Initial_Screen(
//         widget: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             LogoBrand(),
//             const SizedBox(
//               height: 20,
//             ),
//             CircularProgressIndicator(color: Colors.blueAccent,),
//           ],
//         ),
//       ),
//     );
//   }
//}
