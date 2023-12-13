part of 'user_bloc.dart';

@Freezed()
  class UserState with _$UserState{
  factory UserState({
    @Default([]) List<UserEntity> users,
    @Default(FormzStatus.pure) FormzStatus status,
}) =_UserState;
}

