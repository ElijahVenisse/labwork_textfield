// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class MyAppHomeScreen2 extends StatefulWidget {
  const MyAppHomeScreen2({super.key});

  @override
  State<MyAppHomeScreen2> createState() => _MyAppHomeScreenState();
}

class _MyAppHomeScreenState extends State<MyAppHomeScreen2> {
  List<String> toDoItems = ['pizza', 'eliajh'];
  var textInput = TextEditingController();

  void addText() {
    setState(() {
      toDoItems.add(textInput.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 2,
                    child: TextField(
                      controller: textInput,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Todo List',
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  Expanded(
                    flex: 1,
                    child: ElevatedButton.icon(
                      onPressed: addText,
                      icon: const Icon(Icons.add),
                      label: const Text('Add'),
                    ),
                  ),
                ],
              ),
              Expanded(
                // child: ListView(
                //   shrinkWrap: true,
                //   children: todoList.map((item) => TodoItem(item)).toList(),
                // ),

                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: toDoItems.length,
                  itemBuilder: (context, index) {
                    return ToDoItems(index + 1, toDoItems[index]);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ToDoItems extends StatefulWidget {
  ToDoItems(this.index, this.items, {super.key});

  int index;
  String items;

  @override
  State<ToDoItems> createState() => _ToDoItemsState();
}

class _ToDoItemsState extends State<ToDoItems> {
  void deleteItem() {
    
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: ListTile(
        title: Text(widget.items),
        subtitle: const Text('description'),
        leading: CircleAvatar(
          child: Text('${widget.index}'),
        ),
        trailing: IconButton(
          onPressed: deleteItem,
          icon: const Icon(Icons.delete_forever),
          color: Colors.red,
        ),
      ),
    );
  }
}
