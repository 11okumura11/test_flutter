import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:test_flutter/database_helper.dart';


class errorProvider with ChangeNotifier{
  bool _visible = false;
  String _message = "";
  bool get visible => _visible;
  String get message => _message;
  
    //ログイン時入力不足な時
    void loginNullValidate(String? name, String? pass){
      if(name == null || pass == null){
          _message = "ユーザ名またはパスワードを入力してください。";
          _visible = true;
          notifyListeners();
      }
    }

    //ログイン時データベースに値がない時
    void loginDiffValidate(String? name, String? pass){
      if(name != null && pass != null){
        _visible = true;
        _message = "ユーザ名またはパスワードが違います。";
        notifyListeners();
      }
    }

    //非表示に切り替える
    void visibilityOff(){
      _visible = false;
      notifyListeners();
    }



}