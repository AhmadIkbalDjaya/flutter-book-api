import 'package:fai_books/model/books.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBHelper {
  static Database? _database;

  static Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  static Future<Database> _initDatabase() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'books.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE books (
            book_id INTEGER PRIMARY KEY,
            name TEXT,
            cover TEXT,
            url TEXT,
            authors TEXT,
            rating REAL,
            created_editions INTEGER,
            year INTEGER
          )
        ''');
      },
    );
  }

  static Future<dynamic> insertBook(Books book) async {
    final db = await database;
    await book.insertToDatabase(db);
    return true;
  }

  static Future<List<Books>> getAllBooks() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('books');
    return List.generate(maps.length, (index) {
      return Books.fromMap(maps[index]);
    });
  }

  static Future<void> deleteBook(int bookId) async {
    final db = await database;
    await db.delete(
      'books',
      where: 'book_id = ?',
      whereArgs: [bookId],
    );
  }
}
