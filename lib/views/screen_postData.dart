import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_api/controller/controller_api.dart';
import 'package:student_api/models/model_student.dart';

class ScreenPostData extends StatelessWidget {
  final ApiController apiController = Get.find();

  final TextEditingController namaController = TextEditingController();
  final TextEditingController nimController = TextEditingController();
  final TextEditingController photoController = TextEditingController();
  final TextEditingController facultyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add student daata"),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextField(
              controller: namaController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: "Name",
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: nimController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: "NIM",
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: facultyController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: "Faculty",
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: photoController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: "Photo",
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
              ),
              onPressed: () async {
                Get.dialog(
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
                StudentModel newStudent = StudentModel(
                  nama: namaController.text,
                  nim: nimController.text,
                  photo: photoController.text,
                  faculty: facultyController.text,
                );
                await apiController.postData(newStudent);
                // Get.back();
                // await Future.delayed(Duration(milliseconds: 400));
                // Get.back();
                apiController.getData();
              },
              child: const Text("Add data"),
            ),
          ],
        ),
      ),
    );
  }
}
