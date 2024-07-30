import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_memo/getx/navigation.dart';
import 'package:image_memo/getx/memo_controller.dart';
import 'dart:typed_data';

import '../sembast/memo.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MemoController memoController = Get.find<MemoController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Memo List'),
      ),
      body: Obx(() => ListView.builder(
        itemCount: memoController.memos.length,
        itemBuilder: (context, index) {
          Memo memo = memoController.memos[index];
          return ListTile(
            title: Text(memo.title),
            subtitle: Text(memo.text),
            leading: memo.imageBytes.isNotEmpty
                ? Image.memory(
              Uint8List.fromList(memo.imageBytes),
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            )
                : Icon(Icons.note),
            onTap: () {
              // TODO
            },
          );
        },
      )),
      floatingActionButton: const FloatingActionButton(
        onPressed: toMemoAddPage,
        child: Icon(Icons.add),
      ),
    );
  }
}