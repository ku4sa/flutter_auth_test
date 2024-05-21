import 'dart:async';

import 'package:flutter/material.dart';

class MyCustomTextField extends StatefulWidget {
  final Color? filledColor;
  final bool isSearch;
  final bool obscureText;
  final TextEditingController controller;
  final String? labelText;
  final String? initialValue;
  final String hInt;
  final String? icon;
  final IconData suffixIcon;
  final String? hintText;
  final IconData? prefixIcon;
  final IconData? secondSuffixIcon;
  final void Function(String?)? onTapSuffixIcon;
  final void Function(String) onChanged;
  final String? Function(String?)? validator;

  const MyCustomTextField({
    super.key,
    this.icon,
    required this.controller,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.isSearch = false,
    this.obscureText = false,
    this.secondSuffixIcon,
    this.initialValue,
    required this.hInt,
    this.onTapSuffixIcon,
    required this.onChanged,
    this.filledColor,
    this.validator,
    required this.suffixIcon,
  });

  @override
  State<MyCustomTextField> createState() => _MyCustomTextFieldState();
}

class _MyCustomTextFieldState extends State<MyCustomTextField> {
  String value = "";
  String? error;
  late bool obscureText;
  Timer? _timer;
  String? showError;

  void validate() {
    if (widget.validator != null) {
      setState(() {
        error = widget.validator!(widget.controller.text);
      });
    }
  }

  void changeValue(String v) {
    validate();
    widget.onChanged(widget.controller.text);
    _timer?.cancel();
  }

  @override
  void initState() {
    obscureText = widget.obscureText;
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      style: const TextStyle(color: Colors.white),
      obscureText: obscureText,
      onChanged: (value) {
        changeValue(value);
      },
      decoration: InputDecoration(
        focusedBorder: border(
          width: 2,
        ),
        errorBorder: border(
          color: Colors.limeAccent,
        ),
        enabledBorder: border(),
        fillColor: widget.filledColor,
        filled: widget.filledColor != null,
        errorText: error,
        errorMaxLines: 3,
        helperMaxLines: 3,
        hintText: widget.hintText,
        labelText: widget.labelText,
        prefixIcon: Icon(
          widget.prefixIcon,
          color: Colors.white,
        ),
        suffixIcon: Icon(widget.suffixIcon),
      ),
    );
  }

  UnderlineInputBorder border({
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
