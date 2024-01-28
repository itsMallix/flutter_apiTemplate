import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_api/controller/controller_api.dart';
import 'package:student_api/views/screen_getData.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final apiController = Get.put(ApiController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ScreenGetData(),
    );
  }
}
