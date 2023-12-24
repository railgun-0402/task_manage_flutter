import 'package:flutter/material.dart';

class TodoAddScreen extends StatefulWidget {
  const TodoAddScreen({Key? key}) : super(key: key);

  @override
  State<TodoAddScreen> createState() => _TodoAddScreenState();
}

class _TodoAddScreenState extends State<TodoAddScreen> {
  // テキスト入力値
  String _text = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('リスト追加画面'),
      ),
      body: Container(
        padding: const EdgeInsets.all(64),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            // 入力されたテキストの表示
            Text(_text, style: const TextStyle(color: Colors.blue)),
            const SizedBox(height: 8),
            TextField(
              onChanged: (String value) {
                setState(() {
                  _text = value;
                });
              },
            ),
            const SizedBox(height: 8),
            SizedBox(
              // 横幅をいっぱいにする
              width: double.infinity,
              // 追加ボタン
              child: ElevatedButton(
                  onPressed: () {
                    // 入力値を前画面へ渡す
                    Navigator.of(context).pop(_text);
                  },
                  child: const Text('リスト追加', style: TextStyle(color: Colors.white)),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              width: double.infinity,
              child: TextButton(

                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('キャンセル'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
