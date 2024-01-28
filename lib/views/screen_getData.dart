import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_api/controller/controller_api.dart';
import 'package:student_api/views/screen_postData.dart';

class ScreenGetData extends StatelessWidget {
  final ApiController apiController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Get student data"),
        backgroundColor: Colors.amber,
      ),
      body: Obx(
        () => ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: apiController.studentData.length,
          itemBuilder: (context, index) {
            if (apiController.studentData.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListTile(
                title: Text(apiController.studentData[index].nama!),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("nim : ${apiController.studentData[index].nim!}"),
                    const Spacer(),
                    Text(
                        "faculty : ${apiController.studentData[index].faculty!}"),
                    const Spacer(),
                    Text(
                        "gpa : ${apiController.studentData[index].gpa!.toString()}"),
                  ],
                ),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: () {
          Get.to(() => ScreenPostData());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}