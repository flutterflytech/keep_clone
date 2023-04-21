import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_keep_advanced/extensions/typography_extension.dart';
import '../../../classes/navigation_route.dart';

class DrawerItemWidget extends StatelessWidget {
  final NavigationRoutes destination;

  const DrawerItemWidget({Key? key, required this.destination})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selectedColor: Colors.amber,
      leading: SizedBox(
        height: 40,
        width: 40,
        child: Icon(
          destination.icon,
          size: 30,
          color: Colors.black,
        ),
      ),
      title: Text(
        destination.label,
        style: context.bodyLarge!.copyWith(color: Colors.black),
      ),
      onTap: () {
        GoRouter.of(context).go(destination.route);
        Navigator.pop(context);
      },
    );
  }
}
