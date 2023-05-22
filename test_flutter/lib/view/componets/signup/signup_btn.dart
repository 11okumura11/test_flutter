import 'package:flutter/material.dart';


class SignupBtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  TextButton(
                child: Text('新規登録はこちらから'),
                onPressed: () {
                  Navigator.of(context).pushNamed("/signup");
                }
              );
  }
}