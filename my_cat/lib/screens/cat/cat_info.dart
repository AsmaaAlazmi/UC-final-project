import 'dart:io';
import 'package:flutter/material.dart';
import 'package:my_cat/models/infoClass.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/navigation_drawer.dart';

// ignore: must_be_immutable
class Detailed_Info extends StatefulWidget {
  final Information info;

  const Detailed_Info({super.key, required this.info});

  @override
  State<Detailed_Info> createState() => _Detailed_InfoState();
}

class _Detailed_InfoState extends State<Detailed_Info> {
  double maxWidth = 384;
  bool isFav = false;

  imageList(int index) {
    final images = [
      widget.info.big_imageURL,
      widget.info.small_imageURL,
      widget.info.image1,
      widget.info.image2
    ];
    return images[index];
  }

  void ToggleFav() {
    setState(() {
      isFav = !isFav;
    });
  }

  textList(int index) {
    final texts = [
      'Gender: ${widget.info.gender} \n\nAge: ${widget.info.age}\n\nBreed: ${widget.info.breed} \n\nVaccinated: ${widget.info.vac}',
      '   Adoption rules: \n \n' + widget.info.rules,
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
              actions: [
                BackButton(
                  color: Color.fromARGB(255, 255, 255, 255),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 70),
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
                  Container(
                    margin: EdgeInsets.only(top: 0),
                    width: maxWidth + 10,
                    height: 220,
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
                                enlargeStrategy:
                                    CenterPageEnlargeStrategy.scale,
                              )),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: IconButton(
                            onPressed: () {
                              ToggleFav();
                            },
                            icon: (isFav
                                ? const Icon(
                                    Icons.favorite,
                                    color: Colors.white,
                                    size: 30,
                                  )
                                : const Icon(
                                    Icons.favorite_border_rounded,
                                    color: Colors.white,
                                    size: 30,
                                  ))),
                      ),
                      SizedBox(
                        width: 60,
                      ),
                      Container(
                        width: 150,
                        height: 50,
                        margin: EdgeInsets.only(top: 0, left: 0),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            //color: Color.fromARGB(255, 100, 71, 71),
                            border: Border.all(
                                width: 1.5,
                                color: Color.fromARGB(255, 255, 255, 255)),
                            borderRadius: BorderRadius.all(Radius.circular(0))),
                        child: Center(
                            child: Text(
                          'Contact: ' + widget.info.phone.toString(),
                          style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 13,
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            drawer: NavigationDrawer(),
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
            child: Padding(
              padding: const EdgeInsets.all(15.0),
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
        ),
      );
}
