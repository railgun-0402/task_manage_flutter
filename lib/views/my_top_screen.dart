import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:task_manage/views/list_edit/list_edit.dart';
import 'package:task_manage/views/todo_add_screen.dart';

class MyTopScreen extends StatelessWidget {
  const MyTopScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manage App',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: const TodoListPage(),
    );
  }
}

class TodoListPage extends StatefulWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  // Todoリストのデータ
  List<String> todoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('リスト一覧画面'),
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return Slidable(
            key: UniqueKey(),
            endActionPane: ActionPane (
              extentRatio: 0.5,
              motion: const StretchMotion(), // 動きの種類
              dismissible: DismissiblePane(
                onDismissed: () {
                  setState(() {
                    todoList.removeAt(index);
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('タスクを削除しました!'))
                  );
                },
              ),
              children: [
                SlidableAction(
                    onPressed: (_) async {
                      // 編集画面へ遷移(todoを渡す)
                      final editText =
                      await Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) {
                            return ListEdit(todoContent: todoList[index]);
                          })
                      );
                      print('editText:::');
                      print(editText);
                      if (editText != null) {
                        // キャンセルした場合はnullが返ってくる
                        setState(() {
                          todoList[index] = editText;
                        });
                      }
                    },
                  backgroundColor: Colors.yellow.shade700,
                  foregroundColor: Colors.white,
                  icon: Icons.edit_document,
                  label: '編集',
                ),
                SlidableAction(
                  onPressed: (_) {
                    // TODO: 削除するだけだが、最後までスワイプするとどっちにしろ消えるのはだめ？
                    setState(() {
                      todoList.removeAt(index);
                    });
                  },
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: '削除',
                ),
              ],
            ),
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(),
                )
              ),
              child: ListTile(
                title: Text(todoList[index]),
                trailing: Checkbox(
                  // TODO: チェックボックスのバックエンドは未完
                  value: true,
                  onChanged: (bool? value){print('チェックボックスが押下されました');},
                ),
              ),
            ),
          );
        },

      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () async {
            // リスト追加画面から渡される値を受け取る
            final newListText = await Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return const TodoAddScreen();
              })
            );
            if (newListText != null) {
              // キャンセルした場合はnullが返ってくる
              setState(() {
                todoList.add(newListText);
              });
            }
          },
          child: const Icon(Icons.add),
      ),
    );
  }
}
