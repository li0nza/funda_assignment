import 'package:flutter/material.dart';

class Error extends StatelessWidget {
  final String message;

  Error({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      message,
      style: TextStyle(
        color: Theme.of(context).errorColor,
        fontSize: 22,
      ),
    ));
  }
}
