import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DB {
  static Future<void> deleteDBFile() async {
    String databasePath = await getDatabasesPath();
    String dbPath = join(databasePath, 'firstDB.db');
    await deleteDatabase(dbPath);
    print("📂 DB 파일 삭제 완료");
  }
  // 데이터베이스 경로와 이름 정의
  static Future<Database> initDB() async {
    String databasePath = await getDatabasesPath();
    String dbPath = join(databasePath, 'firstDB.db');

    return await openDatabase(
        dbPath,
        version: 1,
        onCreate: (Database db, int version) async {
          await db.execute('''
          CREATE TABLE TBL_USER (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            age INTEGER
          )
        ''');
        }
    );
  }

  // 데이터 삽입(함수)
  static Future<void> insertUser(String name, int age) async {
    print("name === > $name");
    final db = await initDB();
    int result = await db.insert('TBL_USER', {'name': name, 'age': age});
    print('Insert 결과 id: $result');
  }

  // 데이터 삽입(쿼리)
  // static Future<void> insertData(String name, int value, double num) async {
  //   print("name === > $name");
  //   final db = await getDatabase();
  //   // INSERT 쿼리 사용
  //   await db.rawInsert(
  //     'INSERT INTO Test (name, value, num) VALUES (?, ?, ?)',
  //     [name, value, num],
  //   );
  // }


  // 데이터 조회(함수)
  static Future<List<Map<String, dynamic>>> selectUser() async {
    final db = await initDB();
    return await db.query('TBL_USER'); // 'Test' 테이블의 모든 데이터를 조회
  }

  // 데이터 조회(함수)
  static Future<List<Map<String, dynamic>>> loadUser(int id) async {
    final db = await initDB();
    return await db.query('TBL_USER',where: "id = ?", whereArgs: [id]); // 'Test' 테이블의 모든 데이터를 조회
  }

  // 데이터 조회(쿼리)
  // static Future<List<Map<String, dynamic>>> getData() async {
  //   final db = await getDatabase();
  //   // SELECT 쿼리 사용
  //   return await db.rawQuery('SELECT * FROM Test');
  // }

  // 데이터 업데이트(함수)
  static Future<int> updateUser(int id, String name, int age) async {
    final db = await initDB();
    return await db.update('TBL_USER', {'name': name, 'age': age},
        where: 'id = ?', whereArgs: [id]);
  }

  // 데이터 업데이트(쿼리)

  // static Future<int> updateData(int id, String name, int value) async {
  //   final db = await getDatabase();
  //   // UPDATE 쿼리 사용
  //   return await db.rawUpdate(
  //     'UPDATE Test SET name = ?, value = ? WHERE id = ?',
  //     [name, value, id],
  //   );
  // }

  // 데이터 삭제(함수)
  static Future<int> removeUser(int id) async {
    final db = await initDB();
    return await db.delete('TBL_USER', where: 'id = ?', whereArgs: [id]);
  }

// 데이터 삭제(쿼리)
// static Future<int> deleteData(int id) async {
//   final db = await getDatabase();
//   // DELETE 쿼리 사용
//   return await db.rawDelete(
//     'DELETE FROM Test WHERE id = ?',
//     [id],
//   );
// }
}