import 'package:kash_app/features/profile/domain/entity/user.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';
@JsonSerializable()
class UserModel extends UserEntity{
  const UserModel({super.lastName, super.firstName, super.id});
  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}