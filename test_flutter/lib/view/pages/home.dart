import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_flutter/view/pages/welcome.dart';
import 'package:test_flutter/view_model/home_model.dart';
import 'package:test_flutter/provider/error_provider.dart';
import 'package:test_flutter/view/componets/signup/signup_btn.dart';
import 'package:test_flutter/view/componets/error.dart';
import 'custom_pet.dart';

class HomePage extends StatelessWidget {
  final entity = new homeModel();

  @override
  Widget build(BuildContext context) {
    var _visible = context.watch<errorProvider>().visible;
    var _message = context.watch<errorProvider>().message;
    var name;
    var pass;

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
          if(_visible)ErrorMessage(_message),
          Container(
            child:
              Text("Login",
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
              controller: TextEditingController(text: ''),
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
            // color: Colors.blue,
            child: TextField(
              controller: TextEditingController(text: ''),
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
            child: Text('ログイン'),
            onPressed: () async{
              if(await entity.Login(name, pass)){
                if(await entity.checkRegisterPets()){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => customPetsPage()),
                  );
                }else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WelcomePage()),
                  );
                }
                context.read<errorProvider>().visibilityOff();
              }else{
                context.read<errorProvider>().loginNullValidate(name, pass);
                context.read<errorProvider>().loginDiffValidate(name, pass);
              }
            },
          ),
          //新規登録ボタン
          if(_visible)SignupBtn(),
        ],
      ),
    );
  }
}
