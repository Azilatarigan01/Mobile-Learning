import 'package:sqflite/sqflite.dart';

class MySQLViewModel {
  static late Database db;

  static Future migrateTables(Database database, int version) {
    return Future.wait([
      database.execute("""
      CREATE TABLE materi_tugas (
        id INTEGER PRIRMARY KEY AUTO_INCREMENT,
        doc_id VARCHAR(32) NOT NULL,
        task_id VARCHAR(64) NOT NULL
      )
      """),
    ]);
  }

  static Future saveDownloadTask(String docId, String taskId) async {
    final task = {
      "doc_id": docId,
      "task_id": taskId,
    };
    await db.insert("materi_tugas", task);
  }

  static Future<String?> taskFromDoc(String docId) async {
    final listTask = await db.query(
      "materi_tugas",
      where: "doc_id = ?",
      whereArgs: [docId],
    );
    if (listTask.isEmpty) return null;
    return (listTask.first["task_id"] ?? "").toString();
  }
}
