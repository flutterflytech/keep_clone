import 'package:flutter/material.dart';
import 'package:google_keep_advanced/classes/navigation_route.dart';
import 'package:google_keep_advanced/extensions/typography_extension.dart';
import 'package:google_keep_advanced/presentation/dashboard/drawer/drawer_header_widget.dart';
import 'package:google_keep_advanced/presentation/dashboard/drawer/drawer_item_widget.dart';

import '../../../app_constants.dart';

class DrawerWidget extends StatefulWidget {
  final List<NavigationRoutes> destinations;

  const DrawerWidget({Key? key, required this.destinations}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeaderWidget(),
          ...widget.destinations
              .map((destination) => DrawerItemWidget(destination: destination))
              .toList()
        ],
      ),
    );
  }
}
