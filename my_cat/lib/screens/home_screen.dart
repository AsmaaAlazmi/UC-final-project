import 'package:flutter/material.dart';
import 'package:my_cat/models/video_widget.dart';
import 'package:my_cat/screens/AddedPets.dart';
import '../models/infoClass.dart';
import 'chosePlace.dart';
import 'choseAdopte.dart';

class Home extends StatelessWidget {
  Home({super.key});

  List<Information> cat = [];
  List<Information> dog = [];
  List<Information> pet = [];

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      VideoWidget(),
      Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: IconButton(
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
              ),
            ],
          ),
          backgroundColor: Colors.transparent,
          body: Container(
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Material(
                  color: Colors.transparent,
                  child: Container(
                    margin: EdgeInsets.only(top: 70),
                    child: Text(
                      'Adopte | تبنى',
                      style: TextStyle(
                        fontSize: 25,
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  color: Colors.transparent,
                  margin: EdgeInsets.only(top: 250),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.transparent,
                      margin: EdgeInsets.only(top: 10),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Adopte(
                                      catList: cat,
                                      dogList: dog,
                                      petList: pet,
                                    )));
                      },
                      child: Text(
                        'Adopte',
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.all(15),
                        ),
                        foregroundColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.white))),
                      ),
                    ),
                  ],
                ),
                Container(
                  color: Colors.transparent,
                  margin: EdgeInsets.only(top: 65),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Add(
                                      dog: dog,
                                      pet: pet,
                                      cat: cat,
                                    )));
                      },
                      child: Text(
                        'Place For Adoption',
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.all(15),
                        ),
                        foregroundColor: MaterialStateProperty.all<Color>(
                            Colors.transparent),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.white))),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ))
    ]);
  }
}
