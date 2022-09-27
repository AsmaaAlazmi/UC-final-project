import 'package:flutter/material.dart';
import 'package:my_cat/main.dart';

import '../models/adopte_info.dart';
import 'addanimal_screen.dart';
import 'adopte_screen.dart';

class Home extends StatelessWidget {
  Home({super.key});

  List<Information> cat = [];

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      //VideoWidget(),
      Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
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
          backgroundColor: Colors.transparent,
          body: Container(
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.transparent,
                  padding: EdgeInsets.only(top: 300),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.transparent,
                      padding: EdgeInsets.only(top: 10),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Adopte()));
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
                  padding: EdgeInsets.only(top: 65),
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
