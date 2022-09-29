import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:flash/flash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_cat/screens/dog/dog_listView.dart';

import '../../models/infoClass.dart';

// ignore: must_be_immutable
class addDog extends StatefulWidget {
  var dog;
  var pet;
  addDog({super.key, required this.dog, required this.pet});

  @override
  State<addDog> createState() => _AddDogState();
}

class _AddDogState extends State<addDog> {
  String selectedGender = '';
  String selectedVac = '';
  bool isCheckProfile = false;
  bool isCheckHeader = false;
  bool isCheckImage1 = false;
  bool isCheckImage2 = false;

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

  RandomInt() {
    Random random = new Random();
    int randomNumber = random.nextInt(100);
    int randomNumber2 = random.nextInt(100);
    int randomNumber3 = random.nextInt(100);
    int randomNumber4 = random.nextInt(100);

    return (randomNumber - randomNumber2 + randomNumber4 - randomNumber3).abs();
  }

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
    return image_header;
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
    return image_profile;
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
    return image1;
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
    return image2;
  }

  Widget buildBtn({
    required String title,
    required double txtSize,
    required VoidCallback onClicked,
  }) =>
      Container(
        width: 220,
        child: ElevatedButton(
            onPressed: onClicked,
            style: ElevatedButton.styleFrom(
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0),
              ),
              foregroundColor: Color.fromARGB(255, 0, 0, 0),
              minimumSize: Size.fromHeight(56),
              backgroundColor: Colors.white,
            ),
            child: Row(
              children: [
                Icon(Icons.image_outlined, size: 28, color: Colors.blue),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  title,
                  style: TextStyle(fontSize: 12, color: Colors.blue),
                ),
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
                  'Add Dog for adoption',
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
                              autofocus: true,
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
                              autofocus: true,
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
                                  hintText: 'Breed: "Golden Retriever"'),
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
                        // HEADER IMAGE
                        Stack(children: [
                          buildBtn(
                              title: 'Add header image',
                              txtSize: 12,
                              onClicked: () {
                                var img = pickHeader();
                                setState(() {
                                  isCheckHeader = showCheck(img);
                                });
                              }),
                          Visibility(
                            visible: isCheckHeader,
                            child: Container(
                              margin: EdgeInsets.only(top: 15, left: 180),
                              child: Icon(
                                Icons.check_outlined,
                                color: Color.fromARGB(255, 40, 104, 42),
                              ),
                            ),
                          )
                        ]),
                        Padding(padding: EdgeInsets.all(20)),
                        //  PROFILE IMAGE
                        Stack(
                          children: [
                            buildBtn(
                                title: 'Add profile image',
                                txtSize: 12,
                                onClicked: () {
                                  var img = pickProfile();
                                  setState(() {
                                    isCheckProfile = showCheck(img);
                                  });
                                }),
                            Visibility(
                              visible: isCheckProfile,
                              child: Container(
                                margin: EdgeInsets.only(top: 15, left: 180),
                                child: Icon(
                                  Icons.check_outlined,
                                  color: Color.fromARGB(255, 40, 104, 42),
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(padding: EdgeInsets.all(20)),
                        // IMAGE 1
                        Stack(children: [
                          buildBtn(
                              title: 'Add image',
                              txtSize: 12,
                              onClicked: () {
                                var img = pickImage1();
                                setState(() {
                                  isCheckImage1 = showCheck(img);
                                });
                              }),
                          Visibility(
                            visible: isCheckImage1,
                            child: Container(
                              margin: EdgeInsets.only(top: 15, left: 180),
                              child: Icon(
                                Icons.check_outlined,
                                color: Color.fromARGB(255, 40, 104, 42),
                              ),
                            ),
                          )
                        ]),
                        Padding(padding: EdgeInsets.all(20)),
                        // IMAGE 2
                        Stack(children: [
                          buildBtn(
                              title: 'Add image',
                              txtSize: 12,
                              onClicked: () {
                                var img = pickimage2();

                                setState(() {
                                  isCheckImage2 = showCheck(img);
                                });
                              }),
                          Visibility(
                            visible: isCheckImage2,
                            child: Container(
                              margin: EdgeInsets.only(top: 15, left: 180),
                              child: Icon(
                                Icons.check_outlined,
                                color: Color.fromARGB(255, 40, 104, 42),
                              ),
                            ),
                          )
                        ]),
                        Padding(padding: EdgeInsets.all(20)),
                        SizedBox(
                            width: 300,
                            child: TextField(
                              autofocus: true,
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
                                autofocus: true,
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
                                int rnd = RandomInt();
                                widget.dog.add(Information(
                                  id: rnd,
                                  animal: 'dog',
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
                                ));
                                widget.pet.add(Information(
                                  id: rnd,
                                  animal: 'dog',
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
                                ));
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return DogsListView(
                                    dogList: widget.dog,
                                    pet: widget.pet,
                                  );
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
    flashStyle = FlashBehavior.floating,
  }) {
    showFlash(
      context: context,
      duration: Duration(seconds: 2),
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

  showCheck(img) {
    if (img != null) {
      // Show Check mark...
      return true;
    }
  }
}
