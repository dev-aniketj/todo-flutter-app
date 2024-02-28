import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/app/controller/task_controller.dart';
import 'package:todo/app/core/values/colors.dart';
import 'package:todo/app/core/values/strings.dart';
import 'package:todo/app/ui/pages/new_task.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key});

  @override
  Widget build(BuildContext context) {
    final TaskController taskController = Get.put(TaskController());

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(taskListTitleStr),
          backgroundColor: Colors.blue.shade200,
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: floatBGColor,
          child: const Icon(Icons.add, color: floatIconColor),
          onPressed: () {
            Get.to(const NewTask());
          },
        ),
        body: Container(
          margin: const EdgeInsets.all(8),
          child: GetBuilder<TaskController>(
            builder: (controller) {
              return controller.tasks.isEmpty
                  ? const Center(
                      child:
                          Text(noTaskStr, style: TextStyle(color: textColor)),
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
                            elevation: 2,
                            color: taskController.tasks[index].status == true
                                ? statusCompleteColor
                                : statusInCompleteColor,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 8),
                                      child: Text("${index + 1}.",
                                          style: const TextStyle(
                                              color: textColor)),
                                    ),
                                    Column(
                                      children: [
                                        Text(task.title,
                                            style: const TextStyle(
                                                color: textColor)),
                                        Text(task.status ? compStr : notStr,
                                            style: const TextStyle(
                                                color: textColor)),
                                      ],
                                    ),
                                  ],
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete,
                                    color: delIconColor,
                                  ),
                                  onPressed: () {
                                    Get.defaultDialog(
                                      title: delTaskStr,
                                      middleText: task.title,
                                      onCancel: () => Get.back(),
                                      confirmTextColor: Colors.white,
                                      onConfirm: () {
                                        taskController.remove(index);
                                        Get.back();
                                      },
                                      backgroundColor: dialogColor,
                                      buttonColor: dialogBtnColor,
                                      cancelTextColor: textColor,
                                    );
                                  },
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
      ),
    );
  }
}
