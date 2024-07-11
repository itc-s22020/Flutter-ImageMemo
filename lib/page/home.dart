import 'package:flutter/material.dart';
import 'package:image_memo/getx/navigation.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Hello Flutter!'),
            ],
          )
      ),
      floatingActionButton:FloatingActionButton(
          onPressed: toMemoAddPage,
          child: Icon(Icons.add)
      ),
    );
  }

}