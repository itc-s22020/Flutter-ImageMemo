import 'package:get/route_manager.dart';
import 'package:image_memo/page/memo_add.dart';

void toMemoAddPage() {
  Get.to(()=>const MemoAdd());
}

void toBackPage() {
  Get.back();
}