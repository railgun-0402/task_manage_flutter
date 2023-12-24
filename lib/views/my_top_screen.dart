import 'package:flutter/material.dart';
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
          return Card(
            child: ListTile(
              title: Text(todoList[index]),
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
