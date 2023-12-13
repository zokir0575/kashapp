import 'package:get_it/get_it.dart';
import 'package:kash_app/features/profile/data/datasource/user_source.dart';
import 'package:kash_app/features/profile/data/repositroy/user_repo_impl.dart';
import 'package:kash_app/utils/dio.dart';
import 'package:kash_app/utils/storage.dart';

final serviceLocator = GetIt.I;

Future<void> setupLocator() async {
  await StorageRepository.getInstance();
  serviceLocator.registerLazySingleton(DioSettings.new);
  serviceLocator.registerLazySingleton(() => UserDataSourceImpl(serviceLocator<DioSettings>().dio));
  serviceLocator.registerLazySingleton(() => UserRepoImpl(dataSource: serviceLocator<UserDataSourceImpl>()));
}

Future resetLocator() async {
  await serviceLocator.reset();
  setupLocator();
}
