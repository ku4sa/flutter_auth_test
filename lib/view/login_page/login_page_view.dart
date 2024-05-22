import 'package:flutter/material.dart';
import 'package:flutter_auth_test/components/textfield.dart';
import 'package:flutter_auth_test/view/login_page/bloc/login_page_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginPageBloc bloc;
  late TextEditingController passwordController;
  late TextEditingController usernameController;
  @override
  void initState() {
    bloc = LoginPageBloc();
    passwordController = TextEditingController();
    usernameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    passwordController.dispose();
    usernameController.dispose();
    bloc.close();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc,
      child: BlocListener<LoginPageBloc, LoginPageState>(
        bloc: bloc,
        listener: (context, state) {
          if (state.formStatus == FormStatus.success) {
            context.go('/');
          } else if (state.formStatus == FormStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Неудачная попытка авторизации: ${state.message}',
                  style: const TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.blue,
              ),
            );
          }
        },
        child: Scaffold(
          body: Center(
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFFC864C8),
                    Color.fromARGB(255, 126, 65, 223),
                  ],
                  stops: [0.6, 1],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20.0,
                  horizontal: 15.0,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        color: Colors.white,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Icon(
                          Icons.login,
                          size: 20,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    const Text(
                      'Авторизация',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                      ),
                    ),
                    MyCustomTextField(
                      controller: usernameController,
                      labelText: 'Имя пользователя',
                      onChanged: (value) {
                        bloc.add(UsernameChanged(username: value));
                      },
                      prefixIcon: Icons.person,
                      suffixIcon: Icons.clear,
                    ),
                    MyCustomTextField(
                      controller: passwordController,
                      isPassword: true,
                      labelText: 'Пароль',
                      onChanged: (value) {
                        bloc.add(PasswordChanged(password: value));
                      },
                      prefixIcon: Icons.lock,
                      suffixIcon: Icons.remove_red_eye,
                    ),
                    Row(
                      children: [
                        BlocBuilder<LoginPageBloc, LoginPageState>(
                            buildWhen: (previous, current) =>
                                previous.isNeedToRemember !=
                                current.isNeedToRemember,
                            builder: (context, state) {
                              return Checkbox(
                                value: state.isNeedToRemember,
                                onChanged: (value) {
                                  if (value != null) {
                                    bloc.add(
                                        ChangeNeedToRemember(value: value));
                                  }
                                },
                                side: const BorderSide(color: Colors.white),
                              );
                            }),
                        const Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              'Запомнить меня',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                    BlocBuilder<LoginPageBloc, LoginPageState>(
                      buildWhen: (previous, current) {
                        return (previous.isValid != current.isValid ||
                            previous.formStatus != current.formStatus);
                      },
                      builder: (context, state) {
                        return state.formStatus == FormStatus.inProccess
                            ? const CircularProgressIndicator()
                            : TextButton(
                                onPressed: state.isValid
                                    ? () {
                                        bloc.add(Submit());
                                      }
                                    : null,
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  disabledBackgroundColor: Colors.grey,
                                ),
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Войти'),
                                ),
                              );
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
