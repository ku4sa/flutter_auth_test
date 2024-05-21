import 'package:flutter/material.dart';
import 'package:flutter_auth_test/view/login_page/login_page_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: LoginPage());
  }
}
