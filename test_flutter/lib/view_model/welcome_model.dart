import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:test_flutter/database_helper.dart';

class welcomeModel{
  final dbHelper = DatabaseHelper.instance;

  Future<int> InsertPets(Map<String, dynamic> row) async {
    Database? db = await dbHelper.database;
    return await db!.insert("d_pet", row);
  }
}