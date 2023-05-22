import 'package:flutter/material.dart';


class ErrorMessage extends StatelessWidget {
  //イニシャライザ
  ErrorMessage(this.message);
  String message;

  @override
  Widget build(BuildContext context) {
    return  Text(message,
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              );
  }
}