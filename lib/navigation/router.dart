import 'package:flutter_auth_test/view/login_page/login_page_view.dart';
import 'package:flutter_auth_test/view/splash_page/splash_page.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/splash',
  routes: [
    /* GoRoute(
      path: '/',
      builder: (context) => const HomePage(),
    ),*/
    GoRoute(
      path: '/splash',
      builder: (context, params) => const SplashPage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, params) => const LoginPage(),
    ),
  ],
);
