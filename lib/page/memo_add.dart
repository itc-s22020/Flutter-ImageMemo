import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:image_memo/component/image_pick.dart';
import 'package:image_memo/getx/navigation.dart';

class MemoAdd extends StatelessWidget {
  const MemoAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _MemoAddBody(),
      floatingActionButton:FloatingActionButton(
          onPressed: toBackPage,
          child: Icon(CupertinoIcons.xmark)
      ),
    );
  }



}

class _MemoAddBody extends StatelessWidget {
  const _MemoAddBody();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("createMemo"),
          const SizedBox(height: 20),
          const SizedBox(
            width: 400,
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "title"
              ),
            ),
          ),
          const SizedBox(height: 20),
          const SizedBox(
            width: 400,
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "memo"
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
                  borderRadius: BorderRadius.circular(5)
                )
              ),
              onPressed: imagePick,
              child: const Text("ImagePick"),
            ),
          )
        ],
      ),
    );
  }
}