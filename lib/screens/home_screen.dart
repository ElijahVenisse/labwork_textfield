import 'package:flutter/material.dart';

class MyAppHomeScreen extends StatefulWidget {
  MyAppHomeScreen({super.key});

  @override
  State<MyAppHomeScreen> createState() => _MyAppHomeScreenState();
}

class _MyAppHomeScreenState extends State<MyAppHomeScreen> {
  List<String> todoList = [];

  var item = TextEditingController();

  void addList() {
    setState(() {
      todoList.add(item.text);
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
                      controller: item,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Todo List',
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Expanded(
                    flex: 2,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        print(item);
                        addList();
                      },
                      icon: const Icon(Icons.add),
                      label: Text('ADD'),
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
                  itemCount: todoList.length,
                  itemBuilder: (_, index) => TodoItem(todoList[index], index),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TodoItem extends StatelessWidget {
  TodoItem(this.item, this.index, {super.key});
  int index;
  String item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: ListTile(
        title: Text(item),
        leading: CircleAvatar(
          child: Text("#"),
        ),
        trailing: IconButton(
          onPressed: () {},
          icon: Icon(Icons.delete_forever, color: Colors.pink),
        ),
      ),
    );
  }
}
