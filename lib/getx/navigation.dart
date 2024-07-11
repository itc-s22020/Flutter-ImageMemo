import 'package:get/route_manager.dart';
import 'package:image_memo/pages/memo_add.dart';

void toMemoAddPage() {
  Get.to(()=>const MemoAdd());
}

void toBackPage() {
  Get.back();
}