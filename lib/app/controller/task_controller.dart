import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo/app/core/utils/keys.dart';
import 'package:todo/app/models/task_model.dart';

class TaskController extends GetxController {
  var tasks = <Task>[].obs;

  @override
  void onInit() {
    List<dynamic>? storedNotes = GetStorage().read<List>(dbKey);
    if (storedNotes != null) {
      tasks.assignAll(storedNotes.map((e) => Task.fromJson(e)).toList());
    }

    ever(tasks, (_) {
      GetStorage().write(dbKey, tasks.toList());
    });

    super.onInit();
  }

  void add(Task task) {
    tasks.add(task);
    update();
  }

  void remove(int index) {
    tasks.removeAt(index);
    update();
  }

  void updateTaskStatus(int index) {
    tasks[index].status = true;
    update();
  }
}
