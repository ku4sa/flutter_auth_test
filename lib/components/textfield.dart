import 'package:flutter/material.dart';

class MyCustomTextField extends StatefulWidget {
  final bool isPassword;
  final bool obscureText;
  final TextEditingController controller;
  final String? labelText;
  final String? initialValue;
  final String? icon;
  final IconData suffixIcon;
  final String? hintText;
  final IconData? prefixIcon;

  final void Function(String?)? onTapSuffixIcon;
  final void Function(String) onChanged;
  final String? Function(String?)? validator;

  const MyCustomTextField({
    this.isPassword = false,
    super.key,
    this.icon,
    required this.controller,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.obscureText = false,
    this.initialValue,
    this.onTapSuffixIcon,
    required this.onChanged,
    this.validator,
    required this.suffixIcon,
  });

  @override
  State<MyCustomTextField> createState() => _MyCustomTextFieldState();
}

class _MyCustomTextFieldState extends State<MyCustomTextField> {
  late bool obscureText;

  @override
  void initState() {
    obscureText = widget.obscureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      style: const TextStyle(color: Colors.white),
      obscureText: obscureText,
      onChanged: (value) {
        widget.onChanged(value);
      },
      decoration: InputDecoration(
          focusedBorder: _border(
            width: 2,
          ),
          errorBorder: _border(
            color: Colors.limeAccent,
          ),
          enabledBorder: _border(),
          hintText: widget.hintText,
          labelText: widget.labelText,
          labelStyle: const TextStyle(
            color: Colors.white,
          ),
          prefixIcon: Icon(
            widget.prefixIcon,
            color: Colors.white,
          ),
          suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  if (widget.isPassword) {
                    obscureText = !obscureText;
                  } else {
                    widget.controller.clear();
                  }
                });
              },
              icon: Icon(
                widget.suffixIcon,
                color: Colors.white,
              ))),
    );
  }

  UnderlineInputBorder _border({
    double width = 1,
    Color color = Colors.white,
  }) {
    return UnderlineInputBorder(
      borderSide: BorderSide(
        color: color,
        width: width,
      ),
    );
  }
}
