import 'package:equatable/equatable.dart';
import '../../../domain/entities/user.dart';

import '../../../domain/usecase/email_password_authorizing.dart';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'email_authorize_event.dart';
part 'email_authorize_state.dart';

class EmailAuthorizeBloc extends Bloc<EmailAuthorizeEvent, EmailAuthorizeState> {
  final EmailAndPassWordAuthorizeUseCase emailAndPassWordAuthorizeUseCase;

  EmailAuthorizeBloc({
    required this.emailAndPassWordAuthorizeUseCase

  }) : super(EmailAuthorizeInitial()) {
    on<EmailAuthorizeEvent>((event, emit) async {
      // TODO: implement event handler
      if (event is LoginEvent) {
        emit(LoadingUser());
        await emailAndPassWordAuthorizeUseCase.emailAndPasswordLogin(event.userEntities);

        final bool checkLoginStatus = await emailAndPassWordAuthorizeUseCase.emailAndPasswordCheckLoginStatus();

        print(checkLoginStatus);

        if (checkLoginStatus) {
          final bool checkIsEmailVerified = await emailAndPassWordAuthorizeUseCase.isEmailVerified();

          if (checkIsEmailVerified) {
            final user = await emailAndPassWordAuthorizeUseCase.getUser();

            final isNewUser = await emailAndPassWordAuthorizeUseCase.checkIfFirstTimeUserFromApi(user.userId.toString());

            if (isNewUser) {
              emit(NewUser());
            }
            else {
              final userFromApi = await emailAndPassWordAuthorizeUseCase.getCurrentUserFromApi(user.userId.toString());

              await emailAndPassWordAuthorizeUseCase.pushUserToCache(userFromApi);

              emit(AuthenticationAuthenticated(
                message: "Login Succesfully",
                userEntities: userFromApi,
              ));
            }
          }
          else {
            emit(EmailHasNotVerified(message: "Login Failed! Your email has not been verified yet!"));
          }
        }
        else emit(AuthenticationUnauthenticated(message: "Login Failed! Please check your email and password"));
      }
      else if (event is LogoutEvent) {
        emit(LoadingUser());

        bool checkLogoutStatus = await emailAndPassWordAuthorizeUseCase.removeUserCache();

        if (checkLogoutStatus) {
          emit(AuthenticationUnauthenticated(message: ""));
        }
        else {
          emit(AuthorizingError(message: ""));
        }
      }
    });
  }
}
