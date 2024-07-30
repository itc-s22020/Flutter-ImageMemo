import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:sembast/sembast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sembast/sembast_io.dart';
import 'package:sembast_web/sembast_web.dart';

import '../sembast/memo.dart';

class MemoController extends GetxController {
  static const String dbName = 'memos.db';
  static const String storeName = 'memos';

  Database? _db;
  final store = intMapStoreFactory.store(storeName);

  final memos = <Memo>[].obs;

  Future<void> _initDatabase() async {
    try {
      if (_db == null) {
        if (kIsWeb) {
          final factory = databaseFactoryWeb;
          _db = await factory.openDatabase(dbName);
        } else {
          final appDocumentDir = await getApplicationDocumentsDirectory();
          final dbPath = p.join(appDocumentDir.path, dbName);
          _db = await databaseFactoryIo.openDatabase(dbPath);
        }
        if (kDebugMode) {
          print("Database initialized successfully");
        }
      }
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print("Error initializing database: $e");
        print("StackTrace: $stackTrace");
      }
    }
  }

  @override
  void onInit() {
    super.onInit();
    _initDatabase();
  }


  Future<Database> _openDb() async {
    final docsDir = await getApplicationDocumentsDirectory();
    final dbPath = p.join(docsDir.path, dbName);
    return await databaseFactoryIo.openDatabase(dbPath);
  }

  Future<void> loadMemos() async {
    final db = _db!;
    final snapshots = await store.find(db);
    memos.value = snapshots.map((snapshot) {
      final memo = Memo.fromMap(snapshot.value);
      memo.id = snapshot.key;
      return memo;
    }).toList();
  }

  Future<void> addMemo(Memo memo) async {
    if (_db == null) {
      if (kDebugMode) {
        print("Database is not initialized");
      }
      return;
    }
    final id = await store.add(_db!, memo.toMap());
    memo.id = id;
    memos.add(memo);
  }


  Future<void> updateMemo(Memo memo) async {
    final db = _db!;
    await store.update(
      db,
      memo.toMap(),
      finder: Finder(filter: Filter.byKey(memo.id)),
    );
    final index = memos.indexWhere((m) => m.id == memo.id);
    if (index != -1) {
      memos[index] = memo;
    }
  }

  Future<void> deleteMemo(int id) async {
    final db = _db!;
    await store.delete(
      db,
      finder: Finder(filter: Filter.byKey(id)),
    );
    memos.removeWhere((memo) => memo.id == id);
  }

  Future<MemoController> init() async {
    await _initDatabase();
    return this;
  }

}