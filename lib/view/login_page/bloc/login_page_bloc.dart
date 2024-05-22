import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_auth_test/repository/auth_repository.dart';
import 'package:get_it/get_it.dart';

part 'login_page_event.dart';
part 'login_page_state.dart';

class LoginPageBloc extends Bloc<LoginPageEvent, LoginPageState> {
  LoginPageBloc() : super(LoginPageState()) {
    on<Submit>(_onSubmit);
    on<LoginPageOpened>(_onLoginPageOpened);
    on<ChangeNeedToRemember>(_onChangeNeedToRemember);
    on<UsernameChanged>(_onUsernameChanged);
    on<PasswordChanged>(_onPasswordChanged);
  }

  final AuthRepository _authRepository = GetIt.instance<AuthRepository>();

  Future<void> _onSubmit(Submit event, Emitter<LoginPageState> emit) async {
    emit(state.copyWith(formStatus: FormStatus.inProccess));
    try {
      final respose = await _authRepository.logIn(
        state.username,
        state.password,
        state.isNeedToRemember,
      );
      if (respose.statusCode == 200) {
        emit(state.copyWith(formStatus: FormStatus.success));
      } else {
        emit(state.copyWith(
            formStatus: FormStatus.error, message: respose.body!['message']));
      }
    } catch (error) {
      emit(
        state.copyWith(
          formStatus: FormStatus.error,
          message: (error is HttpResponse
              ? error.body!['message']
              : 'Глобальная ошибка'),
        ),
      );
    }
    emit(
      state.copyWith(
        formStatus: FormStatus.initial,
        message: null,
      ),
    );
  }

  Future<void> _onLoginPageOpened(
      LoginPageOpened event, Emitter<LoginPageState> emit) async {}

  Future<void> _onUsernameChanged(
      UsernameChanged event, Emitter<LoginPageState> emit) async {
    emit(
      state.copyWith(
        username: event.username,
        isValid: event.username.isNotEmpty && state.password.isNotEmpty,
      ),
    );
  }

  Future<void> _onPasswordChanged(
      PasswordChanged event, Emitter<LoginPageState> emit) async {
    emit(
      state.copyWith(
        password: event.password,
        isValid: event.password.isNotEmpty && state.username.isNotEmpty,
      ),
    );
  }

  Future<void> _onChangeNeedToRemember(
      ChangeNeedToRemember event, Emitter<LoginPageState> emit) async {
    emit(state.copyWith(isNeedToRemember: event.value));
  }
}
