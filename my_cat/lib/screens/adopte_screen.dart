import 'package:flutter/material.dart';
import 'package:my_cat/main.dart';
import 'package:my_cat/screens/adopte_listView.dart';

// ignore: must_be_immutable
class Adopte extends StatelessWidget {
  Adopte({Key? key, required this.catList}) : super(key: key);

  var catList;

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
                'Adopte',
                style: TextStyle(color: Colors.white),
              ),
              leading: BackButton(
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              actions: [
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
                                      builder: (context) => CatsListView(
                                            catList: catList,
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
