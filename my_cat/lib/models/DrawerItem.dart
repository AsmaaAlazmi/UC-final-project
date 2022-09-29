import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DrawerItem {
  final IconData icon;
  final String title;

  const DrawerItem({
    required this.title,
    required this.icon,
  });
}

final itemFirst = [
  DrawerItem(
    title: 'Home',
    icon: Icons.home,
  ),
  DrawerItem(
    title: 'My Pets',
    icon: Icons.pets,
  ),
];

final itemSecond = [
  DrawerItem(
    title: 'Help',
    icon: Icons.help_outline,
  ),
];
