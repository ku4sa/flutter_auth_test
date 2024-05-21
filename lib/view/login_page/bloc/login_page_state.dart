part of 'login_page_bloc.dart';

class LoginPageState {
  String? username;
  String? password;
  FormStatus formStatus;

  LoginPageState({
    this.username,
    this.password,
    this.formStatus = FormStatus.initial,
  });

  LoginPageState copyWith({
    String? username,
    String? password,
    FormStatus? formStatus,
  }) {
    return LoginPageState(
      username: username ?? this.username,
      password: password ?? this.password,
      formStatus: formStatus ?? this.formStatus,
    );
  }
}

enum FormStatus {
  success,
  inProccess,
  error,
  initial,
}
