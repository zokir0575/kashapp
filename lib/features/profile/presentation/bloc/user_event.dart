part of 'user_bloc.dart';

@Freezed()
  class UserEvent with _$UserEvent {
  factory UserEvent.getUsers() = _GetUsers;
}
