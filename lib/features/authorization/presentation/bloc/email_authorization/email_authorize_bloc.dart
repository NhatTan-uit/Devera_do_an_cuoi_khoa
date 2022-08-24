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
        final bool checkLoginStatus = await emailAndPassWordAuthorizeUseCase.call(event.userEntities);

        if (checkLoginStatus) {
          await emailAndPassWordAuthorizeUseCase.pushUserToCache(event.userEntities);

          final cacheUser = await emailAndPassWordAuthorizeUseCase.getUser();

          emit(
              cacheUser.fold(
                  (left) => FailCacheUser(message: left),
                  (right) => AuthenticationAuthenticated(
                    message: "Login Succesfully",
                    userEntities: right,))
          );
        }
        else emit(AuthenticationUnauthenticated(message: "Login Failed! Please check your email and password"));
      }
      else if (event is CheckLoggedInEvent) {
        emit(LoadingUser());

        final cacheUser = await emailAndPassWordAuthorizeUseCase.getUser();

        print(cacheUser.isRight());

        if (cacheUser.isRight()) {
          emit(
            cacheUser.fold(
                    (left) => FailCacheUser(message: left),
                    (right) => LoggedUser(
                        userEntities: right))
          );
        }
        else {
          emit(UnLoggedUser());
        }
      }
    });
  }
}
