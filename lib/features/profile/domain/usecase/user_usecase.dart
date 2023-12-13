
import 'package:kash_app/features/profile/domain/entity/user.dart';
import 'package:kash_app/features/profile/domain/repositroy/user_repository.dart';
import 'package:kash_app/utils/either.dart';
import 'package:kash_app/utils/error/failures.dart';
import 'package:kash_app/utils/usecases/usecase.dart';

class UserUseCase extends UseCase<List<UserEntity>, NoParams>{
  final UserRepository repo;
  UserUseCase({required this.repo});
  @override
  Future<Either<Failure, List<UserEntity>>> call( params) {
    return repo.getUsers();
  }

}