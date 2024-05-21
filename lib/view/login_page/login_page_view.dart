import 'package:flutter/material.dart';
import 'package:flutter_auth_test/components/textfield.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.7,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
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
                  'LOG IN',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
                MyCustomTextField(
                  controller: TextEditingController(),
                  hInt: 'username',
                  onChanged: (value) {},
                  prefixIcon: Icons.person,
                  suffixIcon: Icons.clear,
                ),
                MyCustomTextField(
                  controller: TextEditingController(),
                  hInt: 'password',
                  onChanged: (value) {},
                  prefixIcon: Icons.lock,
                  suffixIcon: Icons.clear,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
