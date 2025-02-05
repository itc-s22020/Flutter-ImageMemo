import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_memo/page/home.dart';

import 'getx/memo_controller.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
    SystemUiOverlay.bottom
  ]);
  Get.put<MemoController>(MemoController());

  runApp(const GetMaterialApp(
    title: 'ImageMemoApp',
    initialRoute: '/',
    home: Home(),
  ));
}
