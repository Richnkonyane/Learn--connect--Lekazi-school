import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class LocalDB {
  static Database? _db;
  
  static Future<void> initDB() async {
    if (_db != null) return;
    String path = join(await getDatabasesPath(), 'learn_connect.db');
    _db = await openDatabase(path, version: 1, onCreate: (db, v) async {
      await db.execute('''
        CREATE TABLE quiz_results(
          id INTEGER PRIMARY KEY, 
          learnerName TEXT, 
          subject TEXT, 
          topic TEXT, 
          score INTEGER, 
          totalQuestions INTEGER, 
          timestamp TEXT, 
          synced INTEGER DEFAULT 0
        )
      ''');
    });
  }
  
  static Future<Database> get database async {
    if (_db != null) return _db!;
    await initDB();
    return _db!;
  }
  
  static Future<void> saveQuizResult({
    required String learnerName, 
    required String subject, 
    required String topic, 
    required int score, 
    required int total
  }) async {
    final db = await database;
    await db.insert('quiz_results', {
      'learnerName': learnerName, 
      'subject': subject, 
      'topic': topic, 
      'score': score, 
      'totalQuestions': total, 
      'timestamp': DateTime.now().toIso8601String(), 
      'synced': 0
    });
  }
  
  static Future<List<Map<String, dynamic>>> getAllQuizResults() async {
    final db = await database;
    return await db.query('quiz_results', orderBy: 'timestamp DESC');
  }
}
