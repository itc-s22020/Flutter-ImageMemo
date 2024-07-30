import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_memo/component/image_pick.dart';
import 'package:image_memo/getx/image_controller.dart';
import 'package:image_memo/getx/navigation.dart';

import '../getx/memo_controller.dart';
import '../sembast/memo.dart';

class MemoAdd extends StatelessWidget {
  final MemoController controller = Get.find<MemoController>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController textController = TextEditingController();

  MemoAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _MemoAddBody(
        titleController: titleController,
        textController: textController,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _saveMemo();
          toBackPage();
        },
        child: const Icon(CupertinoIcons.check_mark),
      ),
    );
  }

  void _saveMemo() {
    final imageController = Get.find<ImageController>();
    final memo = Memo(
      title: titleController.text,
      text: textController.text,
      imageBytes: imageController.image.value,
    );
    controller.addMemo(memo);
  }
}

class _MemoAddBody extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController textController;

  const _MemoAddBody({
    required this.titleController,
    required this.textController,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("createMemo"),
            const SizedBox(height: 20),
            SizedBox(
              width: 400,
              child: TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "title",
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 400,
              child: TextField(
                controller: textController,
                keyboardType: TextInputType.multiline,
                maxLines: 5,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "memo",
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 400,
              height: 40,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                onPressed: imagePick,
                child: const Text("ImagePick"),
              ),
            ),
            const SizedBox(height: 10),
            const _ImageView(),
          ],
        ),
      ),
    );
  }
}

class _ImageView extends StatelessWidget {
  const _ImageView();

  @override
  Widget build(BuildContext context) {
    final c = Get.put(ImageController());
    return Obx(() {
      if (c.image.value.length > 10) {
        return SizedBox(
            width: 400,
            height: 300,
            child: FittedBox(
                fit: BoxFit.contain, child: Image.memory(c.image.value)));
      } else {
        return const Text("NoSelectImage");
      }
    });
  }
}