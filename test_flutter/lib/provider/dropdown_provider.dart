import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:test_flutter/view_model/welcome_model.dart';

class DropDownbutton {
  Map<String, List<String>> dropDownMenu = {
    'Gender': ['オス', 'メス', 'その他'],
    'Workout': ['Shoulder', 'Chest', 'Back'],
    'Coding': ['Flutter', 'Python', 'C#']
  };
}
class dropDownProvider with ChangeNotifier{
  dynamic _gender;
  dynamic get gender => _gender;
        //選択したものを再描画(性別)
    void GenderSelectProvider(String value){ 
        _gender = value;
        notifyListeners();
    }
}