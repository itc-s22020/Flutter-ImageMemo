import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_memo/pages/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [
    SystemUiOverlay.bottom
  ]);

  runApp(const MaterialApp(
    title: 'PolyGraphy',
    home: Home(),
  ));
}