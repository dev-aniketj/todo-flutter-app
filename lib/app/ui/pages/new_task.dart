import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/app/core/values/colors.dart';
import 'package:todo/app/core/values/strings.dart';

import '../../controller/task_controller.dart';
import '../../models/task_model.dart';

class NewTask extends StatelessWidget {
  final int? index;

  const NewTask({super.key, this.index});

  @override
  Widget build(BuildContext context) {
    final TaskController taskController = Get.find();
    String text = index == null ? "" : taskController.tasks[index!].title;
    TextEditingController textEditingController =
        TextEditingController(text: text);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(createNewTStr),
          backgroundColor: Colors.blue.shade200,
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: SizedBox(
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
                      hintText: hintTStr,
                      labelText: labelTStr,
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: textColor),
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    style: const TextStyle(color: textColor, fontSize: 20),
                    keyboardType: TextInputType.text,
                    maxLines: 5,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: addBtnColor,
                      ),
                      onPressed: () => Get.back(),
                      child: const Text(cancelStr,
                          style: TextStyle(color: textColor)),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: cancelBtnColor,
                      ),
                      onPressed: () {
                        taskController.add(Task(
                          title: textEditingController.text,
                          status: false,
                        ));
                        Get.back();
                      },
                      child: const Text(addStr,
                          style: TextStyle(color: textColor)),
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
