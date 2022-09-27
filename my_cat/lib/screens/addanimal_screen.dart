import 'package:flutter/material.dart';
import 'package:my_cat/main.dart';
import 'package:my_cat/screens/addCat_screen.dart';

class Add extends StatelessWidget {
  Add({super.key, required this.cat});

  var cat;

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
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MyApp()));
                },
              ),
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
                            onPressed: () {},
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
