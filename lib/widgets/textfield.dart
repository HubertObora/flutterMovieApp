import 'package:flutter/material.dart';

class TxtField extends StatelessWidget {
  final String text;
  final Icon icon;
  final TextEditingController controller;
  const TxtField(
      {Key? key,
      required this.text,
      required this.icon,
      required this.controller})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
          controller: controller,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: text,
            prefixIcon: icon,
          )),
    );
  }
}

class TxtFieldPassword extends StatelessWidget {
  final String text;
  final Icon icon;
  final TextEditingController controller;
  const TxtFieldPassword(
      {Key? key,
      required this.text,
      required this.icon,
      required this.controller})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: TextField(
          controller: controller,
          obscureText: true,
          enableSuggestions: false,
          autocorrect: false,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: text,
            prefixIcon: icon,
          )),
    );
  }
}
