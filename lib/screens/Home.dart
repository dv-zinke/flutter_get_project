import 'package:flutter/material.dart';
import 'package:flutter_get_project/controllers/TodoController.dart';
import 'package:flutter_get_project/screens/TodoScreen.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final TodoController todoController = Get.put(TodoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo app"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          Get.to(TodoScreen());
        },
      ),
      body: Container(
        child: Obx(() => ListView.separated(
              itemBuilder: (context, index) => ListTile(
                title: Text(
                  todoController.todos[index].text,
                  style: todoController.todos[index].done
                      ? TextStyle(
                          color: Colors.red,
                          decoration: TextDecoration.lineThrough)
                      : TextStyle(
                          color: Theme.of(context).textTheme.bodyText1.color),
                ),
                onTap: (){
                  Get.to(TodoScreen(index: index,));
                },
                leading: Checkbox(
                  value: todoController.todos[index].done,
                  onChanged: (v){
                    var changed = todoController.todos[index];
                    changed.done = v;
                    todoController.todos[index] = changed;
                  },
                ),
                trailing: Icon(Icons.chevron_right),
              ),
              separatorBuilder: (_, __) => Divider(),
              itemCount: todoController.todos.length,
            )),
      ),
    );
  }
}
