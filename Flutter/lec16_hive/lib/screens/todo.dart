import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TodoSCR extends StatefulWidget {
  const TodoSCR({super.key});

  @override
  State<TodoSCR> createState() => _TodoSCRState();
}

class _TodoSCRState extends State<TodoSCR> {
  final TextEditingController todoCtrl = TextEditingController();
  Box? todoBox;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    todoBox = Hive.box('todoBox');
  }

  void addTodo() {
    if (todoCtrl.text.isNotEmpty) {
      todoBox?.add(todoCtrl.text);
      todoCtrl.clear();
    }
  }

  void deleteTodo(int index) {
    todoBox?.deleteAt(index);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Todo deleted!"), backgroundColor: Colors.red),
    );
  }

  void editTodo(int index) {
    todoCtrl.text = todoBox?.getAt(index);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Edit Todo"),
          content: TextField(
            controller: todoCtrl,
            decoration: InputDecoration(hintText: "Enter todo"),
          ),

          actions: [
            TextButton(
              onPressed: () {
                todoCtrl.clear();
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                if (todoCtrl.text.isNotEmpty) {
                  todoBox?.putAt(index, todoCtrl.text);
                }
                todoCtrl.clear();
                Navigator.pop(context);
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (todoBox == "null") {
      return Scaffold(body: CircularProgressIndicator());
    }
    return Scaffold(
      appBar: AppBar(title: Text("TodoApp")),
      body: Column(
        children: [
          TextField(
            controller: todoCtrl,
            decoration: InputDecoration(
              hintText: "Enter your todo here",
              prefixIcon: Icon(Icons.note_alt_sharp),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(onPressed: addTodo, child: Text("Add")),
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: todoBox!.listenable(),
              builder: (context, Box? box, _) {
                if (box!.isEmpty) {
                  return Center(child: Text("No todos"));
                }

                return ListView.builder(
                  itemCount: box?.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(box?.getAt(index)),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () => editTodo(index),
                              icon: Icon(Icons.edit),
                            ),
                            IconButton(
                              onPressed: () => deleteTodo(index),
                              icon: Icon(Icons.delete),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
