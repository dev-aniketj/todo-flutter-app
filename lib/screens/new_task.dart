import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model.dart';
import 'controller.dart';

class NewTask extends StatelessWidget {
  final int? index;

  NewTask({this.index});

  @override
  Widget build(BuildContext context) {
    final TaskController taskController = Get.find();
    String text = index == null ? "" : taskController.tasks[index!].title;
    TextEditingController textEditingController =
        TextEditingController(text: text);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Create a New Task')),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Container(
            height: 500,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: textEditingController,
                    autofocus: true,
                    textCapitalization: TextCapitalization.sentences,
                    decoration: InputDecoration(
                      hintText: 'Create a new task!!',
                      labelText: 'My Task',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black87),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    style: TextStyle(fontSize: 20),
                    keyboardType: TextInputType.text,
                    maxLines: 5,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text('Cancel'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        taskController.add(Task(
                          title: textEditingController.text,
                          status: false,
                        ));

                        Get.back();
                      },
                      child: const Text('Add'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
