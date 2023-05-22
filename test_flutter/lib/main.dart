import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:test_flutter/provider/dropdown_provider.dart';
import 'package:test_flutter/provider/error_provider.dart';
import 'package:test_flutter/view_model/home_model.dart';
import 'package:test_flutter/view/pages/home.dart';
import 'package:test_flutter/view/pages/welcome.dart';
import 'package:test_flutter/view/pages/signup.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      //modelをprobidersの中に追加する
      providers: [
        ChangeNotifierProvider<errorProvider>(
          create: (context) => errorProvider(),
          child:HomePage()
        ),
        ChangeNotifierProvider<dropDownProvider>(
          create: (context) => dropDownProvider(),
          child:WelcomePage()
        ),

      ],
      //view画面
      child: MaterialApp(
      title: "こんちわテスト",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),               // １. 最初に起動させたいページ
      //home: VisibilitySample(),               // １. 最初に起動させたいページ
      routes: <String, WidgetBuilder>{  // 2. routesには「/」を含めない。
        '/signup': (BuildContext context) => SignUpPage(),
        '/welcome': (BuildContext context) => WelcomePage(),
      }
      ),
    );
  }
}