import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final _databaseVersion = 1; // スキーマのバージョン指定

  // DatabaseHelper クラスを定義
  DatabaseHelper._privateConstructor();
  // DatabaseHelper._privateConstructor() コンストラクタを使用して生成されたインスタンスを返すように定義
  // DatabaseHelper クラスのインスタンスは、常に同じものであるという保証
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // Databaseクラス型のstatic変数_databaseを宣言
  // クラスはインスタンス化しない
  static Database? _database;

  // databaseメソッド定義
  // 非同期処理
  Future<Database?> get database async {
    // _databaseがNULLか判定
    // NULLの場合、_initDatabaseを呼び出しデータベースの初期化し、_databaseに返す
    // NULLでない場合、そのまま_database変数を返す
    // これにより、データベースを初期化する処理は、最初にデータベースを参照するときにのみ実行されるようになります。
    // このような実装を「遅延初期化 (lazy initialization)」と呼びます。
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  // データベース接続
  _initDatabase() async {
    // アプリケーションのドキュメントディレクトリのパスを取得
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    // 取得パスを基に、データベースのパスを生成
    String path = join(documentsDirectory.path, "MyDatabase.db");
      //await deleteDatabase(path); // データベースの削除

    // データベース接続
    return await openDatabase(path,
        version: _databaseVersion,
        // テーブル作成メソッドの呼び出し
        onCreate: _onCreate);
  }
  // テーブル作成
  // 引数:dbの名前
  // 引数:スキーマーのversion
  // スキーマーのバージョンはテーブル変更時にバージョンを上げる（テーブル・カラム追加・変更・削除など）
  Future _onCreate(Database db, int version) async {
    //ユーザーテーブル
    await db.execute('''
          CREATE TABLE 'd_user' (
            'id' INTEGER PRIMARY KEY,
            'name' TEXT NOT NULL,
            'mail' TEXT NOT NULL,
            'password' TEXT NOT NULL
          )
          ''');
    //ペットテーブル
    await db.execute('''
          CREATE TABLE 'd_pet' (
            'id' INTEGER PRIMARY KEY,
            'userid' INTEGER NOT NULL,
            'name' TEXT NOT NULL,
            'gender' TEXT NOT NULL,
            'age' INTEGER NOT NULL,
            'weight' INTEGER NOT NULL
          )
          ''');
  }

  // Future<List<Map<String, dynamic>>> Login(String name, String pass) async{
  //     Database? db = await instance.database;
  //     // String sql = 'SELECT * FROM my_table';
  //     // sql += 'WHERE name =$name';
  //     // sql += ' AND password =$pass';
  //   return await db!.query(table,
  //   where: "name=? AND password=?",
  //   whereArgs: [name, pass]
  //   );
  // }

  // Future<int> Insert(Map<String, dynamic> row) async {
  //   Database? db = await instance.database;
  //   return await db!.insert(table, row);
  // }
}