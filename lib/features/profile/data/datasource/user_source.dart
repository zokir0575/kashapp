import 'package:dio/dio.dart';
import 'package:kash_app/features/profile/data/model/user_model.dart';
import 'package:kash_app/utils/exceptions.dart';

abstract class UserDataSource {
  Future<List<UserModel>> getUsers();
}

class UserDataSourceImpl implements UserDataSource {
  final Dio _dio;

  UserDataSourceImpl(this._dio);

  @override
  Future<List<UserModel>> getUsers() async {
    try {
      final response = await _dio.get(
        'api/ae6224655d3b4da486903d784f8c2665/users',
      );

      print(response.realUri);
      print(response.statusCode);
      print(response.data);
      if (response.statusCode != null &&
          response.statusCode! >= 200 &&
          response.statusCode! < 300) {
        List<UserModel> list = (response.data as List)
            .map((userData) => UserModel.fromJson(userData))
            .toList();
        return list;
      } else if (response.statusCode != null &&
          response.statusCode! >= 400 &&
          response.statusCode! < 500) {
        if (response.data is Map) {
          throw ServerException(
              statusCode: response.statusCode!,
              errorMessage: ((response.data as Map).values.isNotEmpty
                      ? (response.data as Map).values.first
                      : 'Serverda xatolik ketdi')
                  .toString());
        } else {
          throw ServerException(
              statusCode: response.statusCode!,
              errorMessage: response.data.toString());
        }
      } else {
        throw ServerException(
            statusCode: response.statusCode!,
            errorMessage: response.data.toString());
      }
    } on ServerException {
      rethrow;
    } on Exception catch (e) {
      throw ParsingException(errorMessage: e.toString());
    }
  }
}
