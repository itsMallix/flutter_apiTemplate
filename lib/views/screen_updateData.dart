import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_api/controller/controller_api.dart';
import 'package:student_api/models/model_student.dart';

class ScreenUpdateData extends StatelessWidget {
  final String id;
  final String name;
  final String nim;
  final String photo;
  final String faculty;

  ScreenUpdateData({
    super.key,
    required this.id,
    required this.name,
    required this.nim,
    required this.photo,
    required this.faculty,
  });

  final ApiController apiController = Get.find();
  final TextEditingController namaController = TextEditingController();
  final TextEditingController nimController = TextEditingController();
  final TextEditingController photoController = TextEditingController();
  final TextEditingController facultyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    namaController.text = name;
    nimController.text = nim;
    photoController.text = photo;
    facultyController.text = faculty;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Update student data",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
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
                backgroundColor: Colors.blue,
              ),
              onPressed: () async {
                await apiController.updateData(
                  StudentModel(
                    id: id,
                    nama: namaController.text,
                    nim: nimController.text,
                    photo: photoController.text,
                    faculty: facultyController.text,
                  ),
                );
              },
              child: const Text(
                "Update data",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
