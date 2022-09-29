import 'dart:io';
import 'package:flutter/material.dart';
import 'package:my_cat/models/infoClass.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../main.dart';

// ignore: must_be_immutable
class AdopteAnimalScreen extends StatelessWidget {
  AdopteAnimalScreen({super.key, required this.info});

  double maxWidth = 384;

  final Information info;

  imageList(int index) {
    final images = [
      info.big_imageURL,
      info.small_imageURL,
      info.image1,
      info.image2
    ];
    return images[index];
  }

  textList(int index) {
    final texts = [
      'Gender: ${info.gender} \n\nAge: ${info.age}\n\nBreed: ${info.breed} \n\nVaccinated: ${info.vac}',
      '   Adoption rules: \n \n' + info.rules,
    ];
    return texts[index];
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: new Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/AdopteBack.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(children: <Widget>[
          Scaffold(
            backgroundColor: Colors.transparent,
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: BackButton(
                color: Color.fromARGB(255, 255, 255, 255),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.popUntil(
                        context, (route) => route.settings.name == "/");
                  },
                  icon: Icon(Icons.home),
                  color: Colors.white,
                ),
              ],
            ),
            body: SingleChildScrollView(
              padding: EdgeInsets.only(top: 70),
              child: Column(
                children: [
                  Container(
                    child: Center(
                      child: CarouselSlider.builder(
                          itemCount: 4,
                          itemBuilder: ((context, index, realIndex) {
                            final urImage = imageList(index);

                            return buildImage(urImage, index);
                          }),
                          options: CarouselOptions(
                            aspectRatio: 16 / 9,
                            autoPlayCurve: Curves.fastOutSlowIn,
                            height: 400,
                            autoPlay: true,
                            autoPlayInterval: Duration(seconds: 2),
                            reverse: true,
                            enlargeCenterPage: true,
                            enlargeStrategy: CenterPageEnlargeStrategy.height,
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            //color: Colors.white,
            margin: EdgeInsets.only(top: 480),
            width: maxWidth + 10,
            height: 240,
            child: Column(
              children: [
                Center(
                  child: CarouselSlider.builder(
                      itemCount: 2,
                      itemBuilder: ((context, index, realIndex) {
                        final urText = textList(index);

                        return buildText(urText, index);
                      }),
                      options: CarouselOptions(
                        height: 220,
                        autoPlay: false,
                        autoPlayInterval: Duration(seconds: 2),
                        reverse: false,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: false,
                        enlargeStrategy: CenterPageEnlargeStrategy.scale,
                      )),
                ),
              ],
            ),
          ),
          Container(
            width: 150,
            height: 50,
            margin: EdgeInsets.only(top: 700, left: 120),
            decoration: BoxDecoration(
                color: Colors.black,
                //color: Color.fromARGB(255, 100, 71, 71),
                border: Border.all(
                    width: 1.5, color: Color.fromARGB(255, 255, 255, 255)),
                borderRadius: BorderRadius.all(Radius.circular(0))),
            child: Center(
                child: Text(
              'Contact: ' + info.phone.toString(),
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 13,
                  fontWeight: FontWeight.bold),
            )),
          ),
        ]),
      ),
    );
  }

  Widget buildImage(File urImage, int index) => Container(
        margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 2, color: Color.fromARGB(255, 8, 0, 0)),
              borderRadius: BorderRadius.circular(10)),
          child: ClipRRect(
            child: Container(
              child: Image.file(
                urImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      );

  Widget buildText(String urText, int index) => Container(
        margin: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
        child: Material(
          child: new Container(
            decoration: BoxDecoration(
                color: Colors.black,
                //color: Color.fromARGB(255, 100, 71, 71),
                border: Border.all(
                    width: 1.5, color: Color.fromARGB(255, 255, 255, 255)),
                borderRadius: BorderRadius.all(Radius.circular(0))),
            child: Center(
                child: Text(
              urText,
              style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontSize: 13,
                  fontWeight: FontWeight.bold),
            )),
          ),
        ),
      );
}
