import 'package:equatable/equatable.dart';
import 'package:kash_app/utils/either.dart';
import 'package:kash_app/utils/error/failures.dart';





abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}
abstract class StreamUseCase<Type, Params> {
  Stream<Type> call(Params params);
}

class SortNextParams extends Equatable {
  final Map<String, String> sortType;
  final String? next;

  const SortNextParams({required this.next, required this.sortType});

  @override
  List<Object?> get props => [next, sortType];
}

class IdNextParams extends Equatable{
  final int id;
  final String? next;
  const IdNextParams({required this.next, required this.id});
  @override
  List<Object?> get props => throw UnimplementedError();

}