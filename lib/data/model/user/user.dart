import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User {
  const factory User({
    @Default("") String id,
    @Default("") String name,
    @Default("") String email,
    @Default("") String password,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> data) => _$UserFromJson(data);
}
