import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo/app/core/values/strings.dart';
import 'package:todo/app/ui/pages/task_list.dart';

void main() async {
  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: mainTitleStr,
      debugShowCheckedModeBanner: false,
      home: const TaskList(),
      theme: ThemeData(primaryColor: Colors.blue),
    );
  }
}
