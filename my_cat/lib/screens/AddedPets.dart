import 'package:flash/flash.dart';
import 'package:floor/floor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:my_cat/models/navigation_drawer.dart';

import 'cat/cat_info.dart';

// ignore: must_be_immutable
class AddedPets extends StatefulWidget {
  var pet;
  var dog;
  var cat;

  AddedPets({super.key, required this.pet, this.dog, this.cat});

  @override
  State<AddedPets> createState() => _AddedPetsState();
}

class _AddedPetsState extends State<AddedPets> {
  double maxWidth = 384;
  var mainColor = Color.fromARGB(130, 12, 10, 27);
  var id_controller = TextEditingController();

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
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/AdopteBack.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(children: <Widget>[
        Scaffold(
            drawer: NavigationDrawer(),
            backgroundColor: Colors.transparent,
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text(
                'My pets for adoption',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: TextButton(
                      // REMOVE PET
                      onPressed: () {
                        openDialog();
                      },
                      child: Text(
                        'Remove Pet',
                        style:
                            TextStyle(color: Color.fromARGB(255, 251, 47, 47)),
                      )),
                ),
              ],
            ),
            body: showList()),
      ]),
    );
  }

  showList() {
    if (widget.pet != null && widget.pet.length > 0) {
      return Container(
        padding: EdgeInsets.only(bottom: 20),
        child: ListView.builder(
          itemCount: widget.pet.length,
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
                                  info: widget.pet[index],
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
                                    width: 3,
                                    color:
                                        GenderColor(widget.pet[index].gender))),
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
                                            '\nGender:   ${widget.pet[index].gender}',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: GenderColor(
                                                    widget.pet[index].gender),
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 130),
                                        child: Text(
                                            '\nAge:   ${widget.pet[index].age}',
                                            style: TextStyle(
                                                fontSize: 14,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 130),
                                        child: Text(
                                            '\nBreed:   ${widget.pet[index].breed}',
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
                                        widget.pet[index].big_imageURL,
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
                                      widget.pet[index].small_imageURL,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 60,
                                  color: Color.fromARGB(91, 0, 0, 0),
                                  // ANIMAL ID
                                  margin: EdgeInsets.only(top: 20, left: 300),
                                  child: Center(
                                    child: Text(
                                        'ID: ' +
                                            widget.pet[index].id.toString(),
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ],
                            ),
                          ),
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
            child: Text('No Pets Avaliable...',
                style: TextStyle(color: Colors.white, fontSize: 15)),
          ),
        ),
      );
    }
  }

  void _IdError({
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
              content: Row(
            children: [
              Text('Invaild ID!'),
            ],
          )),
        );
      },
    );
  }

  removePet(String id) {
    print('\nEntered RemovePet Function!');
    if (widget.pet.isNotEmpty) {
      print('List not empty');
      for (var i = 0; i < widget.pet.length; i++) {
        if (widget.pet[i].id.toString() == id) {
          if (widget.pet[i].animal == 'cat') {
            for (var c = 0; c < widget.cat.length; c++) {
              if (widget.cat[c].id.toString() == id) {
                return setState(() {
                  print('Cat removed ');
                  widget.cat..removeWhere((item) => item == widget.cat[c]);
                  widget.pet..removeWhere((item) => item == widget.pet[i]);
                });
              }
            }
          } else if (widget.pet[i].animal == 'dog') {
            print('Entered dog');
            for (var d = 0; d < widget.dog.length; d++) {
              if (widget.dog[d].id.toString() == id) {
                return setState(() {
                  print('Dog removed ');
                  widget.dog..removeWhere((item) => item == widget.dog[d]);
                  widget.pet..removeWhere((item) => item == widget.pet[i]);
                });
              }
            }
          }
        } else {
          return _IdError();
        }
      }
    } else {
      _IdError();
    }
  }

  Future openDialog() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text(
              'To remove pet, Enter pet ID:',
              style: TextStyle(fontSize: 16),
            ),
            content: TextField(
              controller: id_controller,
              autofocus: true,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: 'id:', hintStyle: TextStyle(fontSize: 14)),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    removePet(id_controller.value.text);
                  },
                  child: Text(
                    'REMOVE',
                    style: TextStyle(color: Colors.red),
                  ))
            ],
          ));
}
