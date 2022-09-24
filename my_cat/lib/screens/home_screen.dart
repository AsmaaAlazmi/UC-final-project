import 'dart:async';

import 'package:flutter/material.dart';
import 'package:my_cat/screens/video_widget.dart';

import 'adopte_screen.dart';

class Home extends StatelessWidget {
  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      //VideoWidget(),
      Scaffold(
          backgroundColor: Colors.transparent,
          body: Container(
            color: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 290, bottom: 20),
                      child: IconButton(
                        onPressed: () {
                          print('profile');
                        },
                        icon: Icon(Icons.perm_identity_outlined),
                        iconSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 290),
                      child: IconButton(
                        onPressed: () {
                          print('fav');
                        },
                        icon: Icon(Icons.favorite_border),
                        iconSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
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
                        style: TextStyle(color: Colors.white, fontSize: 14),
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
                  padding: EdgeInsets.only(top: 30),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Place For Adoption',
                        style: TextStyle(color: Colors.white, fontSize: 14),
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
