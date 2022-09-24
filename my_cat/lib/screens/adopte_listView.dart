import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_cat/models/adopte_info.dart';
import 'package:my_cat/screens/adopte_screen.dart';
import 'package:my_cat/screens/animal_info_screen.dart';

// ignore: must_be_immutable
class CatsListView extends StatelessWidget {
  CatsListView({super.key});

  double maxWidth = 384;
  var mainColor = Color.fromARGB(130, 12, 10, 27);

  var animals = [
    Information(
        animal: 'cat',
        gender: 'female',
        age: 'two years',
        vac: 'yes',
        small_imageURL: 'images/whiteCatSml.png',
        big_imageURL: 'images/whiteCatBig2.png',
        breed: 'Mixed LongHair',
        image1: 'images/white1.png',
        image2: 'images/white2.png',
        rules:
            '1. Adopter must be older than 18yrs  \n2. Adopter must have no other cats \n3. Adopter must vaccinate the cat yearly',
        phone: 98920167),
    Information(
        animal: 'cat',
        gender: 'male',
        age: 'one year',
        vac: 'no',
        small_imageURL: 'images/russianBlue.png',
        big_imageURL: 'images/russianBlueBig.png',
        breed: 'Russian Blue',
        image1: 'images/russian1.png',
        image2: 'images/russian2.png',
        phone: 93424757,
        rules:
            '1. Adopter must be older than 18yrs  \n2. Adopter must have no other cats \n3. Adopter must vaccinate the cat yearly'),
  ];

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
          backgroundColor: Colors.transparent,
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(
              'Cats',
              style: TextStyle(color: mainColor),
            ),
            leading: BackButton(
              color: Color.fromARGB(255, 255, 255, 255),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Adopte()));
              },
            ),
            actions: [
              IconButton(
                onPressed: () {
                  print('favorite');
                },
                icon: Icon(Icons.favorite_border),
                color: Colors.white,
              ),
              IconButton(
                onPressed: () {
                  print('filter');
                },
                icon: Icon(Icons.filter_list),
                color: Colors.white,
              ),
              IconButton(
                onPressed: () {
                  print('profile');
                },
                icon: Icon(Icons.perm_identity_outlined),
                color: Colors.white,
              ),
            ],
          ),
          body: ListView.builder(
            itemCount: animals.length,
            itemBuilder: (context, index) {
              return Card(
                  child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              AdopteAnimalScreen(info: animals[index])));
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
                                  color: GenderColor(animals[index].gender))),
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
                                          '\nGender:   ${animals[index].gender}',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: GenderColor(
                                                  animals[index].gender),
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 130),
                                      child: Text(
                                          '\nAge:   ${animals[index].age}',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 130),
                                      child: Text(
                                          '\nBreed:   ${animals[index].breed}',
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
                                      border: Border.all(
                                          width: 2.5, color: mainColor)),
                                  child: Image.asset(
                                    animals[index].big_imageURL,
                                    fit: BoxFit.cover,
                                  )),
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
                                        color:
                                            Color.fromARGB(255, 253, 252, 252)),
                                    borderRadius: BorderRadius.circular(45)),
                                margin: EdgeInsets.only(left: 10, top: 80),
                                width: 120,
                                height: 150,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(45),
                                  child: Image.asset(
                                    animals[index].small_imageURL,
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
          ),
        ),
      ]),
    );
  }
}
