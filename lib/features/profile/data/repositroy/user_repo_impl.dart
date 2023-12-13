import 'package:kash_app/features/profile/data/datasource/user_source.dart';
import 'package:kash_app/features/profile/domain/entity/user.dart';
import 'package:kash_app/features/profile/domain/repositroy/user_repository.dart';
import 'package:kash_app/utils/either.dart';
import 'package:kash_app/utils/error/failures.dart';
import 'package:kash_app/utils/exceptions.dart';

class UserRepoImpl extends UserRepository {
  final UserDataSource dataSource;

  UserRepoImpl({required this.dataSource});

  @override
  Future<Either<Failure, List<UserEntity>>> getUsers() async {
    try {
      final result = await dataSource.getUsers();
      return Right(result);
    } on DioException {
      return Left(DioFailure());
    }
  }
}
