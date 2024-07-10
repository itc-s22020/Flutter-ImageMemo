import 'package:isar/isar.dart';

part 'memo_model.g.dart';

@Collection()
class Memo {
  Id id = Isar.autoIncrement;

  late String title;
  late List<int> imageBytes;
  late String text;
}
