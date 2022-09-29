import 'dart:math';

import 'package:flutter/material.dart';

import 'package:my_cat/models/DrawerItem.dart';

import '../screens/AddedPets.dart';

class NavigationDrawer extends StatelessWidget {
  NavigationDrawer({super.key, this.dog, this.pet, this.cat});
  var cat;
  var dog;
  var pet;
  Random random = Random();

  var gifs = [
    'Vids/gif2.gif',
    'Vids/catgif.gif',
  ];

  @override
  Widget build(BuildContext context) {
    final isCollapsed = false;
    var mainColor = Color.fromARGB(130, 12, 10, 27);
    final safeArea =
        EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top);

    return Container(
      child: Drawer(
        child: Container(
          color: mainColor,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 24).add(safeArea),
                color: Colors.white12,
                width: double.infinity,
                child: buildHeader(isCollapsed),
              ),
              SizedBox(
                height: 24,
              ),
              buildList(items: itemFirst),
              const SizedBox(
                height: 24,
              ),
              Divider(color: mainColor),
              const SizedBox(
                height: 24,
              ),
              Text(
                'Help?',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Text(
                'Email: AsmaaAlaizmi907@gmail.com',
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.normal),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeader(bool isCollapsed) => Row(
        children: [
          SizedBox(
            width: 303,
            child: Stack(children: [
              Image.asset(
                (gifs..shuffle()).first,
                fit: BoxFit.fill,
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text(
                    'Adopte | تبنى',
                    style: TextStyle(
                      fontSize: 25,
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ),
              )
            ]),
          ),
        ],
      );

  Widget buildList({required List<DrawerItem> items}) => ListView.separated(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 20),
      primary: false,
      itemCount: items.length,
      separatorBuilder: (context, index) => SizedBox(
            height: 16,
          ),
      itemBuilder: ((context, index) {
        final item = items[index];
        return buildMenuItem(
          text: item.title,
          icon: item.icon,
          onClicked: () => selectItem(context, index),
        );
      }));

  void selectItem(BuildContext context, int index) {
    switch (index) {
      case 0:
        return Navigator.popUntil(
            context, (route) => route.settings.name == '/');
      case 1:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => AddedPets(
                      dog: dog,
                      cat: cat,
                      pet: pet,
                    )));
        break;
    }
  }

  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.white;
    final leading = Icon(icon, color: color);

    return Material(
      color: Colors.transparent,
      child: ListTile(
        leading: leading,
        title: Text(
          text,
          style: TextStyle(color: color, fontSize: 16),
        ),
        onTap: onClicked,
      ),
    );
  }
}
