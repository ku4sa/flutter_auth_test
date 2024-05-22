import 'package:flutter/material.dart';
import 'package:flutter_auth_test/navigation/router.dart';
import 'package:flutter_auth_test/repository/auth_repository.dart';
import 'package:get_it/get_it.dart';

void main() async {
  GetIt.instance.registerSingleton<AuthRepository>(
    AuthRepository(),
    dispose: (param) async => await param.dispose(),
  );
  await GetIt.instance<AuthRepository>().init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
