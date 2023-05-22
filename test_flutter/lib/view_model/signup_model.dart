import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:test_flutter/database_helper.dart';

class signUp{
  final dbHelper = DatabaseHelper.instance;
  Future<int> Insert(Map<String, dynamic> row) async {
    Database? db = await dbHelper.database;
    return await db!.insert("d_user", row);
  }
}