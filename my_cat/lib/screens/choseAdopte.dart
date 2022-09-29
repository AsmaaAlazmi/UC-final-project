import 'package:flutter/material.dart';
import 'package:my_cat/screens/cat/cat_listView.dart';
import 'package:my_cat/screens/dog/dog_listView.dart';
import 'package:my_cat/models/navigation_drawer.dart';

import 'AddedPets.dart';

// ignore: must_be_immutable
class Adopte extends StatelessWidget {
  var catList;
  var dogList;
  var petList;

  Adopte(
      {Key? key,
      required this.catList,
      required this.dogList,
      required this.petList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Scaffold(
          drawer: NavigationDrawer(),
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            //centerTitle: true,
            title: Text(
              'Adopte',
              style: TextStyle(color: Colors.white),
            ),
            actions: [
              BackButton(
                onPressed: () {
                  Navigator.pop(context);
                },
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
                                    builder: (context) => DogsListView(
                                          pet: petList,
                                          dogList: dogList,
                                        )));
                          },
                          child: Text(
                            'Dogs',
                            style: TextStyle(color: Colors.white, fontSize: 15),
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
                                    builder: (context) => CatsListView(
                                          pet: petList,
                                          catList: catList,
                                        )));
                          },
                          child: Text(
                            'Cats',
                            style: TextStyle(color: Colors.white, fontSize: 15),
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
    ]);
  }
}
