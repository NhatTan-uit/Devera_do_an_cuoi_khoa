import 'package:equatable/equatable.dart';
import '../../../domain/entities/user.dart';

import '../../../domain/usecase/email_password_authorizing.dart';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'email_register_event.dart';
part 'email_register_state.dart';

class EmailRegisterBloc extends Bloc<EmailRegisterEvent, EmailRegisterState> {
  final EmailAndPassWordAuthorizeUseCase emailAndPassWordAuthorizeUseCase;

  EmailRegisterBloc({required this.emailAndPassWordAuthorizeUseCase})
      : super(EmailRegisterInitial()) {
    on<EmailRegisterEvent>((event, emit) async {
      // TODO: implement event handler
      if (event is SignUpEvent) {
        emit(SignUpLoading());

        String err = await emailAndPassWordAuthorizeUseCase.signUp(event.userEntities);

        if (err != "") {
          emit(SignUpFailed(message: err.toString()));
        } else {
          emit(SignUpVerifyHasNotSent());

          bool isVerify = await emailAndPassWordAuthorizeUseCase
              .emailAndPasswordSignUpVerifyEmail();

          if (isVerify) {
            emit(SignUpVerifyEmailSent());
          }
        }
      }
      else if (event is ResendEvent) {
        emit(SignUpVerifyHasNotSent());

        bool isVerify = await emailAndPassWordAuthorizeUseCase
            .emailAndPasswordSignUpVerifyEmail();

        if (isVerify) {
          emit(SignUpVerifyEmailSent());
        }
      }
    });
  }
}
