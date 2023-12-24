import 'package:flutter/material.dart';

class TodoAddScreen extends StatelessWidget {
  const TodoAddScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('リスト追加画面（クリックで戻る）'),
        ),
      ),
    );
  }
}
