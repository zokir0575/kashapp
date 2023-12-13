import 'package:bloc/bloc.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kash_app/features/profile/data/repositroy/user_repo_impl.dart';
import 'package:kash_app/features/profile/domain/entity/user.dart';
import 'package:kash_app/features/profile/domain/usecase/user_usecase.dart';
import 'package:kash_app/utils/serivice_locator.dart';
import 'package:kash_app/utils/usecases/usecase.dart';

part 'user_bloc.freezed.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserUseCase useCase = UserUseCase(repo: serviceLocator<UserRepoImpl>());

  UserBloc() : super(UserState()) {
    on<_GetUsers>((event, emit) async {
      print(state.status);
      emit(state.copyWith(status: FormzStatus.submissionInProgress));
      final result = await useCase.call(NoParams());
      print(result.right);
      if (result.isRight) {
        print('aaa');
        emit(state.copyWith(
            users: result.right, status: FormzStatus.submissionSuccess));

        print(state.users);
      } else {
        print('bbb');
        emit(state.copyWith(status: FormzStatus.submissionFailure));
      }
    });
  }
}
