import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      context.go('/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Material(
      color: Colors.white,
      child: Center(
        child: SizedBox(
          width: 200,
          height: 100,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Text('Идет загрузка...'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
