import 'dart:convert';

List<StudentModel> studentModelFromJson(String str) => List<StudentModel>.from(
    json.decode(str).map((x) => StudentModel.fromJson(x)));

String studentModelToJson(List<StudentModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class StudentModel {
  DateTime? createdAt;
  String? nama;
  String? nim;
  String? phone;
  String? faculty;
  String? photo;
  String? id;

  StudentModel({
    this.createdAt,
    this.nama,
    this.nim,
    this.phone,
    this.faculty,
    this.photo,
    this.id,
  });

  factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
        createdAt: json["createdAt"] == null
            ? null
            : DateTime.parse(json["createdAt"]),
        nama: json["nama"],
        nim: json["nim"],
        phone: json["phone"],
        faculty: json["faculty"],
        photo: json["photo"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "createdAt": createdAt?.toIso8601String(),
        "nama": nama,
        "nim": nim,
        "phone": phone,
        "faculty": faculty,
        "photo": photo,
        "id": id,
      };
}
