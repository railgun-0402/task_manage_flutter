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

class TodoListPage extends StatelessWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('リスト一覧画面'),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            // pushで画面遷移
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return const TodoAddScreen();
              })
            );
          },
          child: const Icon(Icons.add),
      ),
    );
  }
}
