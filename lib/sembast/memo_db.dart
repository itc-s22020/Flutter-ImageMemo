import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'package:path/path.dart';

import 'memo.dart';

class MemoDatabase {
  static const String dbName = 'memos.db';
  static const String storeName = 'memos';

  Database? _db;
  final store = intMapStoreFactory.store(storeName);

  Future<Database> get database async {
    _db ??= await _openDb();
    return _db!;
  }

  Future<Database> _openDb() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final dbPath = join(docsDir.path, dbName);
    final db = await databaseFactoryIo.openDatabase(dbPath);
    return db;
  }

  Future<int> insert(Memo memo) async {
    final db = await database;
    return await store.add(db, memo.toMap());
  }

  Future<List<Memo>> getAllMemos() async {
    final db = await database;
    final snapshots = await store.find(db);
    return snapshots.map((snapshot) {
      final memo = Memo.fromMap(snapshot.value);
      memo.id = snapshot.key;
      return memo;
    }).toList();
  }

  Future<void> update(Memo memo) async {
    final db = await database;
    await store.update(
      db,
      memo.toMap(),
      finder: Finder(filter: Filter.byKey(memo.id)),
    );
  }

  Future<void> delete(int id) async {
    final db = await database;
    await store.delete(
      db,
      finder: Finder(filter: Filter.byKey(id)),
    );
  }
}