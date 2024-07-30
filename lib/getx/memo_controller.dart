import 'dart:async';

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
  final _dbInitCompleter = Completer<void>();

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
        _dbInitCompleter.complete();
      }
    } catch (e, stackTrace) {
      if (kDebugMode) {
        print("Error initializing database: $e");
        print("StackTrace: $stackTrace");
      }
      _dbInitCompleter.completeError(e);
    }
  }

  @override
  void onReady() {
    super.onReady();
    _initDatabase().then((_) {
      loadMemos();
    });
  }

  Future<void> loadMemos() async {
    await _dbInitCompleter.future;
    if (_db == null) {
      if (kDebugMode) {
        print("Database is not initialized");
      }
      return;
    }
    final db = _db!;
    final snapshots = await store.find(db);
    final loadedMemos = snapshots.map((snapshot) {
      final memo = Memo.fromMap(snapshot.value);
      memo.id = snapshot.key;
      return memo;
    }).toList();
    memos.assignAll(loadedMemos);
  }

  Future<void> addMemo(Memo memo) async {
    await _dbInitCompleter.future;
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
    await _dbInitCompleter.future;
    if (_db == null) {
      if (kDebugMode) {
        print("Database is not initialized");
      }
      return;
    }
    final db = _db!;
    await store.update(
      db,
      memo.toMap(),
      finder: Finder(filter: Filter.byKey(memo.id)),
    );
    final index = memos.indexWhere((m) => m.id == memo.id);
    if (index != -1) {
      memos[index] = memo;
      memos.refresh();
    }
  }

  Future<void> deleteMemo(int id) async {
    await _dbInitCompleter.future;
    if (_db == null) {
      if (kDebugMode) {
        print("Database is not initialized");
      }
      return;
    }
    final db = _db!;
    await store.delete(
      db,
      finder: Finder(filter: Filter.byKey(id)),
    );
    memos.removeWhere((memo) => memo.id == id);
  }
}

