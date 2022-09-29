import 'package:flutter/material.dart';
import 'package:my_cat/screens/cat/addCat_screen.dart';
import 'package:my_cat/screens/dog/addDog_screen.dart';

import 'AddedPets.dart';

class Add extends StatelessWidget {
  Add({super.key, required this.cat, required this.dog, required this.pet});

  var cat;
  var dog;
  var pet;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Stack(children: <Widget>[
        Scaffold(
            extendBodyBehindAppBar: true,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              //centerTitle: true,
              title: Text(
                'Place for adoption',
                style: TextStyle(color: Colors.white),
              ),
              leading: BackButton(
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              actions: [
                IconButton(
                  iconSize: 20,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AddedPets(
                                  dog: dog,
                                  cat: cat,
                                  pet: pet,
                                )));
                  },
                  icon: Icon(Icons.pets),
                  color: Colors.white,
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.home),
                  color: Colors.white,
                ),
              ],
            ),
            body: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/AdopteBack.png"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                        top: 390,
                      ),
                      child: Column(
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => addDog(
                                            dog: dog,
                                            pet: pet,
                                          )));
                            },
                            child: Text(
                              'Dogs',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.all(15),
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
                          Container(
                            padding: EdgeInsets.only(top: 55),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AddCat(
                                            cat: cat,
                                            pet: pet,
                                          )));
                            },
                            child: Text(
                              'Cats',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                            style: ButtonStyle(
                              padding: MaterialStateProperty.all<EdgeInsets>(
                                EdgeInsets.all(15),
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
                        ],
                      ),
                    ),
                  ],
                ))),
      ]),
    );
  }
}
