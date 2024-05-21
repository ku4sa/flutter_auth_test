import 'dart:async';

import 'package:bloc/bloc.dart';

part 'login_page_event.dart';
part 'login_page_state.dart';

class LoginPageBloc extends Bloc<LoginPageEvent, LoginPageState> {
  LoginPageBloc(super.initialState) {
    on<Submit>(_onSubmit);
    on<LoginPageOpened>(_onLoginPageOpened);
    /*//on<UsernameUnfocused>(_usernameUnfocused);
    //on<PasswordUnfocused>(_passwordUnfocused);
*/
    on<ChangePasswordVisibility>(_onChangePasswordVisibility);
    on<UsernameChanged>(_onUsernameChanged);
    on<PasswordChanged>(_onPasswordChanged);
  }

  Future<void> _onSubmit(Submit event, Emitter<LoginPageState> emit) async {}

  Future<void> _onLoginPageOpened(
      LoginPageOpened event, Emitter<LoginPageState> emit) async {}

  Future<void> _onChangePasswordVisibility(
      ChangePasswordVisibility event, Emitter<LoginPageState> emit) async {}

  Future<void> _onUsernameChanged(
      UsernameChanged event, Emitter<LoginPageState> emit) async {}

  Future<void> _onPasswordChanged(
      PasswordChanged event, Emitter<LoginPageState> emit) async {}
}
