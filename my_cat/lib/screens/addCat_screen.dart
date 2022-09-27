import 'dart:async';
import 'dart:io';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:my_cat/screens/addanimal_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_cat/screens/adopte_listView.dart';
import 'package:my_cat/screens/adopte_screen.dart';

import '../main.dart';
import '../models/adopte_info.dart';

class AddCat extends StatefulWidget {
  AddCat({super.key, required this.cat});

  var cat;

  @override
  State<AddCat> createState() => _AddCatState();
}

class _AddCatState extends State<AddCat> {
  //List<Information> cat = [];
  bool? catExist;

  String selectedGender = '';
  String selectedVac = '';

  // type String:
  var age_controller = TextEditingController();
  var rule_controller = TextEditingController();
  var number_controller = TextEditingController();
  var breed_controller = TextEditingController();
  // type File:
  var header_controller = TextEditingController();
  var profile_controller = TextEditingController();
  var image1_controller = TextEditingController();
  var image2_controller = TextEditingController();

  File? image_header;
  File? image_profile;
  File? image1;
  File? image2;
  Future pickHeader() async {
    try {
      final image_header =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image_header == null) return;
      final imageTemporary = File(image_header.path);
      setState(() => this.image_header = imageTemporary);
    } on PlatformException catch (e) {
      // TODO
      print('Failed ro pick image $e');
    }
  }

  Future pickProfile() async {
    try {
      final image_profile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image_profile == null) return;
      final imageTemporary = File(image_profile.path);
      setState(() => this.image_profile = imageTemporary);
    } on PlatformException catch (e) {
      // TODO
      print('Failed ro pick image $e');
    }
  }

  Future pickimage2() async {
    try {
      final image2 = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image2 == null) return;
      final imageTemporary = File(image2.path);
      setState(() => this.image2 = imageTemporary);
    } on PlatformException catch (e) {
      // TODO
      print('Failed ro pick image $e');
    }
  }

  Future pickImage1() async {
    try {
      final image1 = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image1 == null) return;
      final imageTemporary = File(image1.path);
      setState(() => this.image1 = imageTemporary);
    } on PlatformException catch (e) {
      // TODO
      print('Failed ro pick image $e');
    }
  }

  Widget buildBtn({
    required String title,
    required double txtSize,
    required VoidCallback onClicked,
  }) =>
      SizedBox(
        width: 240,
        child: ElevatedButton(
            onPressed: onClicked,
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.black,
              minimumSize: Size.fromHeight(56),
              backgroundColor: Colors.white,
            ),
            child: Row(
              children: [
                Icon(Icons.image_outlined, size: 28),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  title,
                  style: TextStyle(fontSize: 12),
                )
              ],
            )),
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 1.5),
          image: DecorationImage(
            image: AssetImage("images/AdopteBack.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Scaffold(
              backgroundColor: Colors.transparent,
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Text(
                  'Add Cat for adoption',
                  style: TextStyle(color: Colors.white),
                ),
                leading: BackButton(
                  // back button
                  color: Color.fromARGB(255, 255, 255, 255),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                actions: [
                  IconButton(
                    // home screen
                    onPressed: () {
                      Navigator.popUntil(
                          context, (route) => route.settings.name == '/');
                    },
                    icon: Icon(Icons.home),
                    color: Colors.white,
                  ),
                ],
              ),
              body: SingleChildScrollView(
                child: Container(
                    width: 390,
                    color: Color.fromARGB(40, 255, 255, 255),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(padding: EdgeInsets.all(100)),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Gender:',
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontWeight: FontWeight.bold)),
                            Padding(
                              padding: const EdgeInsets.only(left: 130),
                              child: RadioListTile<String>(
                                activeColor: Color.fromARGB(255, 250, 179, 236),
                                value: 'female',
                                groupValue: selectedGender,
                                title: Text('Female',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color:
                                            Color.fromARGB(255, 250, 179, 236),
                                        fontWeight: FontWeight.bold)),
                                onChanged: (value) =>
                                    setState(() => selectedGender = 'female'),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 130),
                              child: RadioListTile<String>(
                                value: 'male',
                                groupValue: selectedGender,
                                activeColor: Color.fromARGB(255, 95, 223, 255),
                                title: Text('Male',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color:
                                            Color.fromARGB(255, 95, 223, 255),
                                        fontWeight: FontWeight.bold)),
                                onChanged: (value) =>
                                    setState(() => selectedGender = 'male'),
                              ),
                            ),
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(20)),
                        SizedBox(
                            width: 300,
                            child: TextField(
                              controller:
                                  age_controller // to use: age_controller.value ,
                              ,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(),
                                  hintText: 'Age: "two years"'),
                            )),
                        Padding(padding: EdgeInsets.all(20)),
                        SizedBox(
                            width: 300,
                            child: TextField(
                              controller: breed_controller,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  alignLabelWithHint: true,
                                  border: OutlineInputBorder(),
                                  hintText:
                                      'Breed: "Mixed long hair with street cat"'),
                            )),
                        Padding(padding: EdgeInsets.all(20)),
                        Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('Vaccinated:',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Color.fromARGB(255, 255, 255, 255),
                                      fontWeight: FontWeight.bold)),
                              Padding(
                                padding: const EdgeInsets.only(left: 130),
                                child: RadioListTile<String>(
                                  activeColor: Colors.white,
                                  value: 'yes',
                                  groupValue: selectedVac,
                                  title: Text('Yes',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontWeight: FontWeight.bold)),
                                  onChanged: (value) =>
                                      setState(() => selectedVac = 'yes'),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 130),
                                child: RadioListTile<String>(
                                  value: 'no',
                                  groupValue: selectedVac,
                                  activeColor: Colors.white,
                                  title: Text('No',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: Color.fromARGB(
                                              255, 253, 253, 253),
                                          fontWeight: FontWeight.bold)),
                                  onChanged: (value) =>
                                      setState(() => selectedVac = 'no'),
                                ),
                              ),
                            ]),
                        Padding(padding: EdgeInsets.all(20)),
                        buildBtn(
                            title: 'Add header image',
                            txtSize: 12,
                            onClicked: () => pickHeader()),
                        Padding(padding: EdgeInsets.all(20)),
                        buildBtn(
                            title: 'Add profile image',
                            txtSize: 12,
                            onClicked: () => pickProfile()),
                        Padding(padding: EdgeInsets.all(20)),
                        buildBtn(
                            title: 'Add image',
                            txtSize: 12,
                            onClicked: () => pickImage1()),
                        Padding(padding: EdgeInsets.all(20)),
                        buildBtn(
                            title: 'Add image',
                            txtSize: 12,
                            onClicked: () => pickimage2()),
                        Padding(padding: EdgeInsets.all(20)),
                        SizedBox(
                            width: 300,
                            child: TextField(
                              controller: number_controller,
                              keyboardType: TextInputType.number,
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  alignLabelWithHint: true,
                                  border: OutlineInputBorder(),
                                  hintText: 'Phone Number: "+965"'),
                            )),
                        Padding(padding: EdgeInsets.all(20)),
                        SizedBox(
                          width: 300,
                          child: Column(
                            children: [
                              TextField(
                                controller: rule_controller,
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    alignLabelWithHint: true,
                                    border: OutlineInputBorder(),
                                    hintText: 'Rules for adoption (Max 3): '),
                              ),
                              Text(
                                '\n*IMPORTANT: for the ruled ONLY add a max of 3 rules, \ntry writing the most important thing ypu want in the adopter first',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          //    SEND INFORMATION:
                          padding: const EdgeInsets.only(top: 100, bottom: 100),
                          child: TextButton(
                            onPressed: () {
                              if (age_controller.value.text == '' ||
                                  selectedGender == '' ||
                                  selectedVac == '' ||
                                  rule_controller.value.text == '' ||
                                  number_controller.value.text == '' ||
                                  breed_controller.value.text == '' ||
                                  image1 == null ||
                                  image2 == null ||
                                  image_header == null ||
                                  image_profile == null) {
                                return _inputEmpty();
                              } else if (number_controller.value.text.length !=
                                  8) {
                                return _numberError();
                              } else {
                                widget.cat.add(
                                  Information(
                                    animal: 'cat',
                                    gender: selectedGender,
                                    age: age_controller.value.text,
                                    vac: selectedVac,
                                    small_imageURL: image_profile,
                                    big_imageURL: image_header,
                                    image1: image1,
                                    image2: image2,
                                    breed: breed_controller.value.text,
                                    phone: number_controller.value.text,
                                    rules: rule_controller.value.text,
                                  ),
                                );
                                catExist = true;
                                Adopte(
                                  catList: widget.cat,
                                );
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return CatsListView(catList: widget.cat);
                                }));
                              }
                              ;
                            },
                            child: Text(
                              'Add',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 17),
                            ),
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.only(
                                    right: 35, left: 35, top: 10, bottom: 10),
                              ),
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.transparent),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(color: Colors.white))),
                            ),
                          ),
                        ),
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _inputEmpty({
    Duration? duration,
    flashStyle = FlashBehavior.floating,
  }) {
    showFlash(
      context: context,
      duration: duration,
      builder: (context, controller) {
        return Flash(
          controller: controller,
          behavior: flashStyle,
          position: FlashPosition.bottom,
          boxShadows: kElevationToShadow[4],
          horizontalDismissDirection: HorizontalDismissDirection.horizontal,
          child: FlashBar(
            content: Text('please fill all the given inputs...'),
          ),
        );
      },
    );
  }

  void _numberError({
    Duration? duration,
    flashStyle = FlashBehavior.floating,
  }) {
    showFlash(
      context: context,
      duration: duration,
      builder: (context, controller) {
        return Flash(
          controller: controller,
          behavior: flashStyle,
          position: FlashPosition.bottom,
          boxShadows: kElevationToShadow[4],
          horizontalDismissDirection: HorizontalDismissDirection.horizontal,
          child: FlashBar(
            content: Text('Invalid Number...'),
          ),
        );
      },
    );
  }
}
