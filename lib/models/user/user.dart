import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'user.g.dart';
part 'user.freezed.dart';

@Freezed()
@HiveType(typeId: 0, adapterName: 'UserAdapter')
class User with _$User {
  const User._();
  factory User({
    @HiveField(0) required String username,
    @HiveField(1) required String password,
  }) = _User;
  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
