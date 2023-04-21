import 'package:flutter/material.dart';

class NavigationRoutes {
  final IconData icon;
  final IconData selectedIcon;
  final String label;
  final String route;

  NavigationRoutes(
      {required this.icon,
        required this.selectedIcon,
        required this.label,
        required this.route});
}