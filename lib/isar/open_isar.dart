import 'package:path_provider/path_provider.dart';
import 'package:isar/isar.dart';
import 'model/memo_model.dart';

Future<Isar> openIsar() async {
  final dir = await getApplicationDocumentsDirectory();
  return Isar.open(
    [MemoSchema],
    directory: dir.path,
  );
}