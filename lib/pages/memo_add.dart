import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_memo/getx/navigation.dart';

class MemoAdd extends StatelessWidget {
  const MemoAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("MemoAddPage")
          ],
        ),
      ),
      floatingActionButton:FloatingActionButton(
          onPressed: toBackPage,
          child: Icon(CupertinoIcons.xmark)
      ),
    );
  }

}