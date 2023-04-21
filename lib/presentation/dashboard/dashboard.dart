import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_keep_advanced/app_bar.dart';
import 'package:google_keep_advanced/extensions/breakpoints_extension.dart';
import 'package:google_keep_advanced/extensions/typography_extension.dart';
import 'package:google_keep_advanced/presentation/dashboard/dashboard_cubit.dart';
import 'package:google_keep_advanced/presentation/dashboard/drawer/drawer_widget.dart';
import 'package:provider/provider.dart';

import '../../app_constants.dart';
import '../../classes/navigation_route.dart';

class DashboardPage extends StatefulWidget {
  final Widget child;
  final String location;

  const DashboardPage({Key? key, required this.child, required this.location})
      : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  List<NavigationRoutes> destinations = [
    NavigationRoutes(
        icon: Icons.library_books_outlined,
        selectedIcon: Icons.library_books_rounded,
        label: 'Notes',
        route: RoutesName.home),
    NavigationRoutes(
        icon: Icons.notifications_none,
        selectedIcon: Icons.notifications,
        label: 'Remainders',
        route: RoutesName.remainder),
    NavigationRoutes(
        icon: Icons.edit_outlined,
        selectedIcon: Icons.edit,
        label: 'Edit labels',
        route: RoutesName.edit),
    NavigationRoutes(
        icon: Icons.archive_outlined,
        selectedIcon: Icons.archive,
        label: 'Archive',
        route: RoutesName.archive),
    NavigationRoutes(
        icon: CupertinoIcons.trash,
        selectedIcon: CupertinoIcons.trash_fill,
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

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardCubit(),
      child: BlocBuilder<DashboardCubit, DashboardState>(
        builder: (context, state) {
          return LayoutBuilder(
            builder: (context, dimens) {
              if (dimens.isMobile) {
                return Scaffold(
                  key: _scaffoldKey,
                  backgroundColor: Colors.white,
                  appBar: AppBar(
                    leadingWidth: 950,
                    leading: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        IconButton(
                            padding: const EdgeInsets.all(12),
                            onPressed: () =>
                                _scaffoldKey.currentState!.openDrawer(),
                            tooltip: 'Main menu',
                            icon: const Icon(
                              Icons.menu,
                              color: Colors.grey,
                              size: 24,
                            )),
                        Image.asset(
                          ImagePaths.appLogo,
                          fit: BoxFit.fill,
                          height: 24,
                          width: 24,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Notes',
                          style: GoogleFonts.roboto(
                              color: CLR.defaultTextColor, fontSize: 22),
                        ),
                        Flexible(flex: 1, child: SearchBar()),
                      ],
                    ),
                    backgroundColor: Colors.white,
                    bottom: PreferredSize(
                      preferredSize: const Size.fromHeight(1.0),
                      child: Container(
                        color: Colors.grey,
                        height: 1.0,
                      ),
                    ),
                  ),
                  body: widget.child,
                  drawer: Provider<GlobalKey<ScaffoldState>>(
                    create: (context) => _scaffoldKey,
                    child: DrawerWidget(destinations: destinations,),
                  ),
                );
              } else {
                return Scaffold(
                  backgroundColor: Colors.white,
                  appBar: AppBar(
                    leadingWidth: 950,
                    leading: Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        IconButton(
                            padding: const EdgeInsets.all(12),
                            onPressed: () {
                              Scaffold.of(context).openDrawer();
                            },
                            tooltip: 'Main menu',
                            icon: const Icon(
                              Icons.menu,
                              color: Colors.grey,
                              size: 24,
                            )),
                        Image.asset(
                          ImagePaths.appLogo,
                          fit: BoxFit.fill,
                          height: 24,
                          width: 24,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Notes',
                          style: GoogleFonts.roboto(
                              color: CLR.defaultTextColor, fontSize: 22),
                        ),
                        SearchBar(),
                      ],
                    ),
                    backgroundColor: Colors.white,
                    bottom: PreferredSize(
                      preferredSize: const Size.fromHeight(1.0),
                      child: Container(
                        color: Colors.grey,
                        height: 1.0,
                      ),
                    ),
                  ),
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
                              .map((e) =>
                              NavigationRailDestination(
                                  icon: Icon(e.icon),
                                  selectedIcon: Icon(e.selectedIcon),
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
              }
            },
          );
        },
      ),
    );
  }
}


