import 'package:flutter/material.dart';

class ListEdit extends StatelessWidget {
  const ListEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('タスク編集'),
      ),
      body: const Center(
        child: Text('編集画面'),
      ),
    );
  }
}
