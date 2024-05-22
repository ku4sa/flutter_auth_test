part of 'login_page_bloc.dart';

abstract class LoginPageEvent {}

final class LoginPageOpened extends LoginPageEvent {}

final class UsernameChanged extends LoginPageEvent {
  final String username;
  UsernameChanged({required this.username});
}

final class PasswordChanged extends LoginPageEvent {
  final String password;
  PasswordChanged({required this.password});
}

final class Submit extends LoginPageEvent {}

final class ChangeNeedToRemember extends LoginPageEvent {
  final bool value;
  ChangeNeedToRemember({required this.value});
}
