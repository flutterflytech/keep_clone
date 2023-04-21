import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_keep_advanced/app_constants.dart';
import 'package:google_keep_advanced/presentation/archive/archive_page.dart';
import 'package:google_keep_advanced/presentation/bin/bin_page.dart';
import 'package:google_keep_advanced/presentation/dashboard/dashboard.dart';
import 'package:google_keep_advanced/presentation/remainders/remainders_page.dart';

import 'presentation/notes/notes_page.dart';

final _parentKey = GlobalKey<NavigatorState>();
final _shellKey = GlobalKey<NavigatorState>();


final appRouter = GoRouter(
  navigatorKey: _parentKey,
  initialLocation: RoutesName.home,

  routes: [
    ShellRoute(
        navigatorKey: _shellKey,
        routes: [
          GoRoute(
              path: RoutesName.home,
              pageBuilder: (context, state) {
                return NoTransitionPage(
                    key: state.pageKey, child: const NotesPage());
              }),
          GoRoute(
              path: RoutesName.remainder,
              pageBuilder: (context, state) {
                return NoTransitionPage(
                    key: state.pageKey, child: const RemainderPage());
              }),
          GoRoute(
              path: RoutesName.edit,
              pageBuilder: (context, state) {
                return NoTransitionPage(
                    key: state.pageKey, child: const NotesPage());
              }),
          GoRoute(
              path: RoutesName.archive,
              pageBuilder: (context, state) {
                return NoTransitionPage(
                    key: state.pageKey, child: const ArchivePage());
              }),
          GoRoute(
              path: RoutesName.bin,
              pageBuilder: (context, state) {
                return NoTransitionPage(
                    key: state.pageKey, child: const BinPage());
              }),
        ],
        builder: (context, state, child) {
          return DashboardPage(location: state.location,child: child,);
        }),
  ],
);
