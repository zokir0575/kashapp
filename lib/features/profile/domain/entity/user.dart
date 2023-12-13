import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String id;
  final String firstName;
  final String lastName;

  const UserEntity({this.id = '', this.firstName = '', this.lastName = ''});

  @override
  List<Object?> get props => [id, firstName, lastName];
}
