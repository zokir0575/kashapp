import 'package:kash_app/features/profile/domain/entity/user.dart';
import 'package:kash_app/utils/either.dart';
import 'package:kash_app/utils/error/failures.dart';

abstract class UserRepository{
  Future<Either<Failure, List<UserEntity>>> getUsers();
}