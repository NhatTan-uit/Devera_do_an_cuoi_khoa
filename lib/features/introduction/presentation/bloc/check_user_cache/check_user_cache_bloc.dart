import 'package:devera_do_an_cuoi_khoa/features/introduction/data/models/cache_user_model.dart';
import 'package:devera_do_an_cuoi_khoa/features/introduction/domain/entities/cache_user.dart';
import 'package:equatable/equatable.dart';
import 'package:devera_do_an_cuoi_khoa/features/introduction/domain/usecase/check_cache_exist.dart';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'check_user_cache_event.dart';
part 'check_user_cache_state.dart';

class CheckUserCacheBloc
    extends Bloc<CheckUserCacheEvent, CheckUserCacheState> {
  final CheckCacheUserUseCase checkCacheUserUseCase;

  CheckUserCacheBloc({required this.checkCacheUserUseCase})
      : super(CheckUserCacheInitial()) {
    on<CheckUserCacheEvent>((event, emit) async {
      // TODO: implement event handler
      if (event is CheckUserLoggedInEvent) {
        emit(Processing());

        final isFirstTime = await checkCacheUserUseCase.checkIfFirstTime();

        if (isFirstTime) {
          await checkCacheUserUseCase.pushNotFirstTime();
          emit(UserFirstTimeToApp());
        }
        else {
          emit(UserBeenToApp());

          final cacheUser = await checkCacheUserUseCase.getUserFromCache();

          emit(cacheUser.fold(
                  (left) => UserUnCached(message: left),
                  (right) => UserCached(
                    message: "Login Succesfully",
                    checkUserEntities: right,
              )));
        }
      }
    });
  }
}
