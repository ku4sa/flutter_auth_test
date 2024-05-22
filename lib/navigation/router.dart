import 'package:flutter_auth_test/models/user/user.dart';
import 'package:flutter_auth_test/repository/auth_repository.dart';
import 'package:flutter_auth_test/view/login_page/login_page_view.dart';
import 'package:flutter_auth_test/view/splash_page/splash_page.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

import '../view/home_page/home_page_view.dart';

final router = GoRouter(
  initialLocation: '/splash',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/splash',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => const LoginPage(),
      redirect: (context, state) {
        return GetIt.instance<AuthRepository>().user.value != null
            ? '/'
            : '/login';
      },
    ),
  ],
);
