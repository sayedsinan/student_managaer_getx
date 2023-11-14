import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:student_getx/controller/db_fucntion_controller.dart';
import 'package:student_getx/model/data_model.dart';
import 'package:student_getx/screens/home_screen.dart';


void main(List<String> args) async {
  final DbFunctionsController controller = Get.put(DbFunctionsController());
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(StudentmodelAdapter().typeId)) {
    Hive.registerAdapter(StudentmodelAdapter());
  }
  await controller.loadAllStudents();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(primarySwatch: Colors.amber),
      debugShowCheckedModeBanner: false,
      home: const ScreenHome(),
    );
  }
}