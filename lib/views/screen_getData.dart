import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_api/controller/controller_api.dart';
import 'package:student_api/views/screen_postData.dart';
import 'package:student_api/views/screen_updateData.dart';

class ScreenGetData extends StatelessWidget {
  final ApiController apiController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Get student data",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
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
                onTap: () {
                  Get.to(
                    ScreenUpdateData(
                      id: apiController.studentData[index].id!,
                      name: apiController.studentData[index].nama!,
                      nim: apiController.studentData[index].nim!,
                      photo: apiController.studentData[index].photo!,
                      faculty: apiController.studentData[index].faculty!,
                    ),
                  );
                },
                title: Text(apiController.studentData[index].nama!),
                leading: CircleAvatar(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image(
                      image:
                          NetworkImage(apiController.studentData[index].photo!),
                    ),
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    Get.defaultDialog(
                      title: "Hapus Data",
                      middleText:
                          "Apakah anda yakin ingin menghapus data ini ?",
                      actions: [
                        TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text("No"),
                        ),
                        TextButton(
                          onPressed: () {
                            apiController.deleteData(
                              apiController.studentData[index].id!,
                            );
                            Get.back();
                          },
                          child: const Text("Yes"),
                        ),
                      ],
                    );
                  },
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("nim : ${apiController.studentData[index].nim!}"),
                    const Spacer(),
                    Text(
                        "faculty : ${apiController.studentData[index].faculty!}"),
                    const Spacer(),
                  ],
                ),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          Get.to(() => ScreenPostData());
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
