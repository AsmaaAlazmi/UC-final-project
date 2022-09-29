import 'dart:io';

class Information {
  String animal;
  String gender;
  String age;
  String vac;
  File? small_imageURL;
  File? big_imageURL;
  File? image1;
  File? image2;
  String rules;
  String breed;
  String phone;
  int id;

  Information(
      {required this.animal,
      required this.gender,
      required this.age,
      required this.vac,
      required this.small_imageURL,
      required this.big_imageURL,
      required this.breed,
      required this.image1,
      required this.image2,
      required this.rules,
      required this.phone,
      required this.id});
}
