import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:student_api/models/model_student.dart';
import 'package:student_api/utils/constant.dart';

class ApiController extends GetxController {
  final studentData = <StudentModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  Future<void> getData() async {
    try {
      final dio = Dio();
      final response = await dio.get(baseUrl + endPoint).then((response) {
        if (response.statusCode == 200) {
          final List<StudentModel> studentList = List<StudentModel>.from(
            response.data.map((x) => StudentModel.fromJson(x)),
          );
          studentData.assignAll(studentList);
        } else {
          return "failed get data";
        }
      });
    } catch (err) {
      print("error : $err");
    }
  }

  Future<void> postData(StudentModel studentModel) async {
    try {
      final dio = Dio();
      final response = await dio.post(
        baseUrl + endPoint,
        data: studentModel.toJson(),
      );
      if (response.statusCode == 201) {
        Get.snackbar(
          "Success",
          "Data berhasil ditambahkan",
          backgroundColor: Colors.green,
        );
      } else {
        print("data gagal ditambahkan, status code ${response.statusCode}");
      }
    } catch (err) {
      print(err);
    }
  }

  Future<void> deleteData(String id) async {
    try {
      final dio = Dio();
      final response = await dio.delete(baseUrl + endPoint + "/$id");
      if (response.statusCode == 200) {
        Get.snackbar(
          "Success",
          "Data berhasil dihapus",
          backgroundColor: Colors.green,
        );
        const CircularProgressIndicator();
        getData();
      } else {
        print("data gagal dihapus, status code ${response.statusCode}");
      }
    } catch (err) {
      print(err);
    }
  }

  Future<void> updateData(StudentModel studentModel) async {
    try {
      final dio = Dio();
      final response = await dio.put(
        "$baseUrl$endPoint/${studentModel.id}",
        data: studentModel.toJson(),
      );
    } catch (err) {
      print(err);
    }
  }
}
