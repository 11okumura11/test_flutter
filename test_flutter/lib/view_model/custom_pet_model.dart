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

class customPetModel{
  final dbHelper = DatabaseHelper.instance;

    Future<List<Map<int, String>?>?> PetList() async{
      var prefs = await SharedPreferences.getInstance();
      var id = prefs.getInt("userId")!;

      Database? db = await dbHelper.database;
      var info = await db!.query("d_pet",
                        where: "userid",
                        whereArgs: [id]
                      );
      if(info.isNotEmpty){
        var petlist = info.map((Map m) {
                      Map<int, String>? petlist = {m["id"], m["name"]} as Map<int, String>?;
                      return petlist;
                    }).toList();
        return petlist;
      }else{
        return null;
      }
    }
}