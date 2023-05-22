import 'dart:io';

// import 'package:cookie_jar/cookie_jar.dart';
// import 'package:dio/dio.dart';
// import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:test_flutter/database_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';

class homeModel{
  final dbHelper = DatabaseHelper.instance;

    Future<bool> Login(String? name, String? pass) async{
      var prefs = await SharedPreferences.getInstance();
      Database? db = await dbHelper.database;
      var info = await db!.query("d_user",
                        where: "name=? AND password=?",
                        whereArgs: [name, pass]
                      );
      var search = await db.query("d_user");
      print("ログインユーザ");
      print(search);
      if(info.isNotEmpty){
          info.map((Map m) {
            int? id = m["id"];
            prefs.setInt("userId", id!);
            return id;
          }).first;
        return true;
      }else{
        return false;
      }
    }

    Future<bool> checkRegisterPets() async{
      var prefs = await SharedPreferences.getInstance();
      var id = prefs.getInt("userId")!;
      Database? db = await dbHelper.database;
      var info = await db!.query("d_pet",
                        where: "userid=?",
                        whereArgs: [id]
                      );

      var search = await db.query("d_pet");
      print("ペット情報");
      print(search);
        return info.isNotEmpty;
    }
}