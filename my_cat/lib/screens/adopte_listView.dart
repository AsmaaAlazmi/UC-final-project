import 'dart:io';

import 'package:flutter/material.dart';

import 'package:my_cat/screens/adopte_screen.dart';
import 'package:my_cat/screens/animal_info_screen.dart';

import '../main.dart';

// ignore: must_be_immutable
class CatsListView extends StatefulWidget {
  var catList;
  var catExist;
  CatsListView({Key? key, this.catList, this.catExist}) : super(key: key);

  @override
  State<CatsListView> createState() => _CatsListViewState();
}

class _CatsListViewState extends State<CatsListView> {
  late var catList = widget.catList;
  late var catExist = widget.catExist;

  setstate() {
    catList;
  }

  double maxWidth = 384;
  var mainColor = Color.fromARGB(130, 12, 10, 27);

  GenderColor(String gender) {
    var clr;
    if (gender.toLowerCase() == 'male') {
      clr = Color.fromARGB(255, 121, 224, 250);
    } else {
      clr = Color.fromARGB(255, 251, 177, 252);
    }

    return clr;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
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
                title: Text(
                  'Adopte Cat',
                  style: TextStyle(color: Colors.white),
                ),
                leading: BackButton(
                  color: Color.fromARGB(255, 255, 255, 255),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Adopte()));
                  },
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      print('filter');
                    },
                    icon: Icon(Icons.filter_list),
                    color: Colors.white,
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MyApp()));
                    },
                    icon: Icon(Icons.home),
                    color: Colors.white,
                  ),
                ],
              ),
              body: showList()),
        ]),
      ),
    );
  }

  showList() {
    if (catExist == true) {
      return ListView.builder(
        itemCount: catList.length,
        itemBuilder: (context, index) {
          return Card(
              child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AdopteAnimalScreen(
                            info: catList[index],
                          )));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      width: maxWidth - 1,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(
                              width: 1.5,
                              color: GenderColor(catList[index].gender))),
                      child: Stack(
                        children: [
                          Container(
                            //    TEXT SPACE
                            width: maxWidth,
                            height: 110,
                            margin: EdgeInsets.only(top: 150),
                            color: Color.fromARGB(255, 0, 0, 0),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 130),
                                  child: Text(
                                      '\nGender:   ${catList[index].gender}',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: GenderColor(
                                              catList[index].gender),
                                          fontWeight: FontWeight.bold)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 130),
                                  child: Text('\nAge:   ${catList[index].age}',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 130),
                                  child: Text(
                                      '\nBreed:   ${catList[index].breed}',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold)),
                                )
                              ],
                            ),
                          ),
                          Container(
                              //  LARGE IMAGE
                              width: maxWidth,
                              height: 150,
                              margin: EdgeInsets.only(bottom: 60),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(width: 2.5, color: mainColor)),
                              child: Image.file(
                                catList[index].big_imageURL,
                                fit: BoxFit.cover,
                              )),
                          Container(
                            //  SMALL IMAGE
                            decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromARGB(153, 146, 145, 145),
                                      spreadRadius: 3,
                                      blurRadius: 15,
                                      offset: Offset(-10, 2)),
                                ],
                                border: Border.all(
                                    width: 1,
                                    color: Color.fromARGB(255, 253, 252, 252)),
                                borderRadius: BorderRadius.circular(45)),
                            margin: EdgeInsets.only(left: 10, top: 80),
                            width: 120,
                            height: 150,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(45),
                              child: Image.file(
                                catList[index].small_imageURL,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ));
        },
      );
    } else {
      return Container(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Center(
            child: Text('No Cats Avaliable...',
                style: TextStyle(color: Colors.white, fontSize: 15)),
          ),
        ),
      );
    }
  }
}
