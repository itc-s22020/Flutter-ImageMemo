import 'dart:typed_data';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class ImageController extends GetxController{
  final Rx<Uint8List> image = Uint8List(0).obs;

  void setFile(Uint8List newImage) => image.value = newImage;
}