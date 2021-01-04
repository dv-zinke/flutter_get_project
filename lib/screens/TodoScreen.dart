import 'package:flutter/material.dart';
import 'package:flutter_get_project/controllers/TodoController.dart';
import 'package:flutter_get_project/models/Todo.dart';
import 'package:get/get.dart';

class TodoScreen extends StatelessWidget {
  final TodoController todoController = Get.find();
  final int index;

  TodoScreen({this.index});

  @override
  Widget build(BuildContext context) {

    String text = '';
    if(!(this.index == null)) {
      text = todoController.todos[index].text;
    }
    TextEditingController textEditingController = TextEditingController(text: text);
    return Scaffold(
      appBar: AppBar(
        title: Text("할일 쓰기"),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Expanded(
                child: TextField(
              controller: textEditingController,
              autofocus: true,
              decoration: InputDecoration(
                hintText: "할일",
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              style: TextStyle(fontSize: 25),
              keyboardType: TextInputType.multiline,
              maxLines: 999,
            )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RaisedButton(
                  child: Text("cancel"),
                  color: Colors.red,
                  onPressed: () {
                    Get.back();
                  },
                ),
                RaisedButton(
                  child: Text(!(this.index == null) ? "Edit" :"Add"),
                  color: Colors.green,
                  onPressed: () {
                    if(!(this.index == null)) {
                      var editing = todoController.todos[index];
                      editing.text = textEditingController.text;
                      todoController.todos[index] = editing;
                    }else {
                      todoController.todos.add(
                          Todo(text: textEditingController.text, done: false));
                    }

                    Get.back();
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
