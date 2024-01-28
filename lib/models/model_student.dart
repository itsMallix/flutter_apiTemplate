import 'dart:convert';

List<StudentModel> studentModelFromJson(String str) => List<StudentModel>.from(
    json.decode(str).map((x) => StudentModel.fromJson(x)));

String studentModelToJson(List<StudentModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StudentModel {
  DateTime? createdAt;
  String? nama;
  String? nim;
  String? gpa;
  String? faculty;
  String? id;

  StudentModel({
    this.createdAt,
    this.nama,
    this.nim,
    this.gpa,
    this.faculty,
    this.id,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        nama: json["nama"],
        nim: json["nim"],
        gpa: json["gpa"],
        faculty: json["faculty"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt?.toIso8601String(),
        "nama": nama,
        "nim": nim,
        "gpa": gpa,
        "faculty": faculty,
        "id": id,
      };
}
