import 'package:freezed_annotation/freezed_annotation.dart';
part 'user.freezed.dart';
@Freezed(
  copyWith: true,
  toStringOverride: true,
)

class User with _$User {
  factory User({
    required String username,
    String? name,
    String? password,
  }) = _User;
}
