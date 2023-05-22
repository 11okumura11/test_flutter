import 'package:flutter/material.dart';
import 'package:test_flutter/view_model/signup_model.dart';
  // final dbHelper = DatabaseHelper.instance;
   final entity = new signUp();

class SignUpPage extends StatelessWidget {
  // const HomePage({Key? key}) : super(key: key);
    var _visible = false;
    var name;
    var mail;
    var pass;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("こんちわテスト"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Align(
          alignment: Alignment.center,
          child: Container(),
          ),
          Container(
            child:
              Text("Sign Up",
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
          ),
          Container(
            width: 350,
            padding: const EdgeInsets.only(bottom: 8),
            // color: Colors.amber,
            child: TextField(
              decoration: InputDecoration(
                labelText: "ユーザ名",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                 name = value;
              }
            ),
          ),
          Container(
            width: 350,
            padding: const EdgeInsets.only(bottom: 8),
            // color: Colors.blue,
            child: TextField(
              decoration: InputDecoration(
                labelText: "メールアドレス",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                 mail = value;
              }
            ),
          ),
          Container(
            width: 350,
            // color: Colors.blue,
            child: TextField(
              decoration: InputDecoration(
                labelText: "パスワード",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                 pass = value;
              }
            ),
          ),
          TextButton(
            child: Text('登録'),
            onPressed: () async{ 
               Map<String, dynamic> row = {
                'name' : name,
                'mail'  : mail,
                'password'  : pass,
              };
              var result =await entity.Insert(row);
              await Navigator.of(context).pushNamed("/");
            },
          ),
        ],
      ),
    );
  }
}
