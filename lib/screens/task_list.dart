import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/screens/new_task.dart';

import 'controller.dart';

class TaskList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TaskController taskController = Get.put(TaskController());

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: Text('Todo App'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Get.to(NewTask());
          },
        ),
        body: GetBuilder<TaskController>(
          builder: (controller) {
            return controller.tasks.isEmpty
                ? Center(
                    child: Text("No Task, Create a New Task"),
                  )
                : ListView.builder(
                    itemCount: controller.tasks.length,
                    itemBuilder: (context, index) {
                      final task = controller.tasks[index];
                      return GestureDetector(
                        onTap: () {
                          controller.updateTaskStatus(index);
                        },
                        child: Card(
                          color: taskController.tasks[index].status == false
                              ? Colors.red.shade200
                              : Colors.green.shade200,
                          child: Container(
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 8),
                                      child: Text("${index + 1}."),
                                    ),
                                    Column(
                                      children: [
                                        Text(task.title),
                                        Text(task.status ? "Completed" : "Not"),
                                      ],
                                    ),
                                  ],
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    Get.defaultDialog(
                                      title: 'Delete Task',
                                      middleText: task.title,
                                      onCancel: () => Get.back(),
                                      confirmTextColor: Colors.white,
                                      onConfirm: () {
                                        taskController.remove(index);
                                        Get.back();
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
