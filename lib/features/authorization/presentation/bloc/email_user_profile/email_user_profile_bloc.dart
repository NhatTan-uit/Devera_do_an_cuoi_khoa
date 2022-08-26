import 'package:bloc/bloc.dart';
import 'package:devera_do_an_cuoi_khoa/features/authorization/domain/entities/user.dart';
import 'package:file_picker/file_picker.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/usecase/email_password_authorizing.dart';

part 'email_user_profile_event.dart';
part 'email_user_profile_state.dart';

class EmailUserProfileBloc extends Bloc<EmailUserProfileEvent, EmailUserProfileState> {
  final EmailAndPassWordAuthorizeUseCase emailAndPassWordAuthorizeUseCase;

  EmailUserProfileBloc({
    required this.emailAndPassWordAuthorizeUseCase
  }) : super(EmailUserProfileInitial()) {
    on<EmailUserProfileEvent>((event, emit) async {
      // TODO: implement event handler
      if (event is UserProfileToWebServiceWithImg) {
        emit(LoadingUploadData());

        await emailAndPassWordAuthorizeUseCase.registerUserImage(event.pickedFile);

        await emailAndPassWordAuthorizeUseCase.postUserProfileToApi(event.userEntities);

        await emailAndPassWordAuthorizeUseCase.pushUserToCache(event.userEntities);

        String userImg = await emailAndPassWordAuthorizeUseCase.getImage(event.pickedFile.name);

        emit(UserProfileUploadCompleted(
            userImg: userImg,
            userEntities: event.userEntities
        ));
      }
    });
  }
}
