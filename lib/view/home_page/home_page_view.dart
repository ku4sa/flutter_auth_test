import 'package:flutter/material.dart';
import 'package:flutter_auth_test/repository/auth_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final repository = GetIt.instance<AuthRepository>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Center(
          child: Text('Главная страница'),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Добро пожаловать ${repository.user.value?.username}'),
            TextButton(
              onPressed: () {
                repository.logOut().then((value) => context.go('/login'));
              },
              child: const Text('Выйти'),
            ),
          ],
        ),
      ),
    );
  }
}
