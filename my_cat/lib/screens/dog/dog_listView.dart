import 'dart:io';

import 'package:flutter/material.dart';
import 'package:my_cat/models/infoClass.dart';

import 'package:my_cat/screens/cat/cat_info.dart';
import 'package:my_cat/models/navigation_drawer.dart';

import '../AddedPets.dart';

// ignore: must_be_immutable
class DogsListView extends StatefulWidget {
  var dogList;
  var pet;
  DogsListView({Key? key, required this.dogList, required this.pet})
      : super(key: key);

  @override
  State<DogsListView> createState() => _DogsListViewState();
}

class _DogsListViewState extends State<DogsListView> {
  double maxWidth = 384;
  var mainColor = Color.fromARGB(130, 12, 10, 27);

  // FILTER:
  List<Information> femaleList = [];
  List<Information> maleList = [];

  String filterValue = 'any';

  filteredList(String value) {
    bool skipFemale = false;
    bool skipMale = false;
    if (value == 'female') {
      for (var i = 0; i < widget.dogList.length; i++)
        if (widget.dogList[i].gender == 'female') {
          if (femaleList.isEmpty) {
            femaleList.add(widget.dogList[i]);
          } else {
            for (var f = 0; f < femaleList.length; f++) {
              if (femaleList[f] == widget.dogList[i]) {
                // skip duplicated item...
                skipFemale = true;
              }
              if (!skipFemale) {
                femaleList.add(widget.dogList[i]);
                skipFemale = false;
              }
            }
          }
          skipMale = false;
        }
      return femaleList;
    } else if (value == 'male') {
      for (var i = 0; i < widget.dogList.length; i++) {
        if (widget.dogList[i].gender == 'male') {
          if (maleList.isEmpty) {
            maleList.add(widget.dogList[i]);
          } else {
            for (var m = 0; m < maleList.length; m++) {
              if (maleList[m] == widget.dogList[i]) {
                // skip duplicated item...
                skipMale = true;
              }
              if (!skipMale) {
                maleList.add(widget.dogList[i]);
                skipMale = false;
              }
            }
          }
        }
        skipMale = false;
      }
      return maleList;
    } else {
      return widget.dogList;
    }
  }

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
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/AdopteBack.png"),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Stack(children: <Widget>[
        Scaffold(
            drawer: NavigationDrawer(
              dog: widget.dogList,
              pet: widget.pet,
            ),
            backgroundColor: Colors.transparent,
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text(
                'Adopte Dog',
                style: TextStyle(color: Colors.white),
              ),
              actions: [
                BackButton(
                  // BACK
                  color: Color.fromARGB(255, 255, 255, 255),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                // FILTER
                PopupMenuButton(
                    initialValue: 'any',
                    onSelected: (String value) {
                      setState(() {
                        filterValue = value;
                      });
                    },
                    icon: Icon(Icons.filter_list_rounded),
                    itemBuilder: (context) => [
                          PopupMenuItem(
                            child: Text('no filter'),
                            value: 'any',
                          ),
                          PopupMenuItem(
                            child: Text('female'),
                            value: 'female',
                          ),
                          PopupMenuItem(
                            child: Text('male'),
                            value: 'male',
                          )
                        ]),
              ],
            ),
            body: showList()),
      ]),
    ]);
  }

  showList() {
    var filter = filteredList(filterValue);
    if (filter != [] && filter.length > 0) {
      return Container(
        padding: EdgeInsets.only(top: 60),
        child: ListView.builder(
          itemCount: filter.length,
          itemBuilder: (context, index) {
            return Card(
                elevation: 20,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                color: Colors.transparent,
                margin: EdgeInsets.only(bottom: 20),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        // opens info page
                        context,
                        MaterialPageRoute(
                            builder: (context) => Detailed_Info(
                                  info: filter[index],
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
                                    color: GenderColor(filter[index].gender))),
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
                                        padding:
                                            const EdgeInsets.only(left: 130),
                                        child: Text(
                                            '\nGender:   ${filter[index].gender}',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: GenderColor(
                                                    filter[index].gender),
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 130),
                                        child: Text(
                                            '\nAge:   ${filter[index].age}',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 130),
                                        child: Text(
                                            '\nBreed:   ${filter[index].breed}',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold)),
                                      )
                                    ],
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(50),
                                  child: Container(
                                      //  LARGE IMAGE
                                      width: maxWidth,
                                      height: 150,
                                      margin: EdgeInsets.only(bottom: 60),
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              width: 2.5, color: mainColor)),
                                      child: Image.file(
                                        filter[index].big_imageURL,
                                        fit: BoxFit.cover,
                                      )),
                                ),
                                Container(
                                  //  SMALL IMAGE
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color.fromARGB(
                                                153, 146, 145, 145),
                                            spreadRadius: 3,
                                            blurRadius: 15,
                                            offset: Offset(-10, 2)),
                                      ],
                                      border: Border.all(
                                          width: 1,
                                          color: Color.fromARGB(
                                              255, 253, 252, 252)),
                                      borderRadius: BorderRadius.circular(45)),
                                  margin: EdgeInsets.only(left: 10, top: 80),
                                  width: 120,
                                  height: 150,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(45),
                                    child: Image.file(
                                      filter[index].small_imageURL,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 60,
                                  color: Color.fromARGB(69, 0, 0, 0),
                                  // ANIMAL ID
                                  margin: EdgeInsets.only(top: 20, left: 300),
                                  child: Center(
                                    child: Text(
                                        'ID: ' + filter[index].id.toString(),
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            fontWeight: FontWeight.bold)),
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
        ),
      );
    } else {
      return Container(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.only(top: 100),
          child: Center(
            child: Text('No Dogs Avaliable...',
                style: TextStyle(color: Colors.white, fontSize: 15)),
          ),
        ),
      );
    }
  }
}
