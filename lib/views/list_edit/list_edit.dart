/*
 * タスク編集画面
 */
import 'package:flutter/material.dart';
import 'package:task_manage/service/validation/validators.dart';

class ListEdit extends StatefulWidget {
  ListEdit({Key? key, required this.todoContent}) : super(key: key ?? UniqueKey());

  // Top画面から受け取ったTodo内容
  final String todoContent;

  @override
  State<ListEdit> createState() => _ListEditState();
}

class _ListEditState extends State<ListEdit> {
  // テキスト入力値
  String _editText = '';

  final focusNode = FocusNode();
  // 編集テキストのTextEditingController
  final TextEditingController editingController = TextEditingController();

  // keyの宣言
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('タスク編集'),
      ),
      body: Form(
        key: _formKey,
        child: Focus(
          focusNode: focusNode,
          child: GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _textLabel('〜現在のTodo内容〜'),
                  const SizedBox(height: 12.0),
                  _textLabel(widget.todoContent),
                  const SizedBox(height: 40.0),
                  TextFormField(
                    onChanged: (String value) {
                      setState(() {
                        _editText = value;
                      });
                    },
                    validator: editValidator,
                    controller: editingController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Todoの編集内容を入力',
                      labelText: '編集',
                    ),
                  ),
                  const SizedBox(height: 18.0),
                  /// 更新ボタン
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          // フォームの入力値が正しかった場合成功画面に遷移
                          Navigator.of(context).pop(_editText);
                        }
                      },
                      child: const Text('更新'),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  /// キャンセルボタン
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                      ),
                      onPressed: () async {
                        Navigator.of(context).pop();
                      },
                      child: const Text('キャンセル'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // Labelの共通Widget
  Widget _textLabel(String content) {
    return (
      Container(
        alignment: Alignment.center,
        width: double.infinity,
        child: Text(
          content,
          textAlign: TextAlign.left,
          style: const TextStyle(fontSize: 16.0),
        ),
      )
    );
  }
}
