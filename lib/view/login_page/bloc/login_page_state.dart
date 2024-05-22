part of 'login_page_bloc.dart';

class LoginPageState {
  String username;
  String password;
  bool isNeedToRemember;
  FormStatus formStatus;
  bool isValid;
  String? message;

  LoginPageState({
    this.username = "",
    this.password = "",
    this.formStatus = FormStatus.initial,
    this.isNeedToRemember = false,
    this.isValid = false,
    this.message,
  });

  LoginPageState copyWith({
    String? username,
    String? password,
    FormStatus? formStatus,
    bool? isNeedToRemember,
    bool? isValid,
    String? message,
  }) {
    return LoginPageState(
      username: username ?? this.username,
      password: password ?? this.password,
      formStatus: formStatus ?? this.formStatus,
      isNeedToRemember: isNeedToRemember ?? this.isNeedToRemember,
      isValid: isValid ?? this.isValid,
      message: message ?? this.message,
    );
  }
}

enum FormStatus {
  success,
  inProccess,
  error,
  initial,
}
