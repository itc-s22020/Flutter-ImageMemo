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
  await Get.putAsync(() async => await MemoController().init());

  runApp(const GetMaterialApp(
    title: 'ImageMemoApp',
    initialRoute: '/',
    home: Home(),
  ));
}
