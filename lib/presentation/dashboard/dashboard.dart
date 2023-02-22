import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_keep_advanced/app_bar.dart';
import 'package:google_keep_advanced/extensions/typography_extension.dart';
import 'package:google_keep_advanced/presentation/dashboard/dashboard_cubit.dart';

import '../../app_constants.dart';

class DashboardPage extends StatefulWidget {
  final Widget child;
  final String location;

  const DashboardPage({Key? key, required this.child, required this.location})
      : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<NavigationDestination> destinations = [
    NavigationDestination(
        icon: const Icon(Icons.lightbulb_outline),
        selectedIcon: const Icon(Icons.lightbulb),
        label: 'Notes',
        route: RoutesName.home),
    NavigationDestination(
        icon: const Icon(Icons.notifications_none),
        selectedIcon: const Icon(Icons.notifications),
        label: 'Remainders',
        route: RoutesName.remainder),
    NavigationDestination(
        icon: const Icon(Icons.edit_outlined),
        selectedIcon: const Icon(Icons.edit),
        label: 'Edit labels',
        route: RoutesName.edit),
    NavigationDestination(
        icon: const Icon(Icons.archive_outlined),
        selectedIcon: const Icon(Icons.archive),
        label: 'Archive',
        route: RoutesName.archive),
    NavigationDestination(
        icon: const Icon(CupertinoIcons.trash),
        selectedIcon: const Icon(CupertinoIcons.trash_fill),
        label: 'Bin',
        route: RoutesName.bin),
  ];

  int getCurrentIndex() {
    switch (widget.location) {
      case RoutesName.remainder:
        return 1;
      case RoutesName.edit:
        return 2;
      case RoutesName.archive:
        return 3;
      case RoutesName.bin:
        return 4;
      default:
        return 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardCubit(),
      child: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
          return LayoutBuilder(
            builder: (context, dimens) {
              return Scaffold(
                backgroundColor: Colors.white,
                appBar: appBar,
                body: Row(
                  children: [
                    NavigationRail(
                        onDestinationSelected: (value) {
                          context
                              .read<DashboardCubit>()
                              .onDrawerItemSelected(value);

                          context.go(destinations[value].route);
                        },
                        extended: dimens.maxWidth >= 800,
                        destinations: destinations
                            .map((e) => NavigationRailDestination(
                                icon: e.icon,
                                selectedIcon: e.selectedIcon,
                                label: Text(
                                  e.label,
                                  style: context.titleSmall,
                                )))
                            .toList(),
                        selectedIndex: getCurrentIndex()),
                    Expanded(
                      child: widget.child,
                    )
                    //Expanded(child: widget.child),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}


class NavigationDestination {
  final Icon icon;
  final Icon selectedIcon;
  final String label;
  final String route;

  NavigationDestination(
      {required this.icon,
      required this.selectedIcon,
      required this.label,
      required this.route});
}
