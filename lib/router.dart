

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_keep_advanced/presentation/archive/archive_page.dart';
import 'package:google_keep_advanced/presentation/bin/bin_page.dart';
import 'package:google_keep_advanced/presentation/dashboard/dashboard.dart';
import 'package:google_keep_advanced/presentation/remainders/remainders_page.dart';

import 'presentation/notes/notes_page.dart';

final _parentKey = GlobalKey<NavigatorState>();
final _shellKey = GlobalKey<NavigatorState>();
final appRouter = GoRouter(
  navigatorKey: _parentKey,
  initialLocation: '/',
  routes: [

ShellRoute(
  navigatorKey: _shellKey,
  routes: [
    GoRoute(path: '/',pageBuilder: (context,state){return NoTransitionPage(
      key: state.pageKey,
        child: const NotesPage());}),
    GoRoute(path: '/remainders',pageBuilder: (context,state){return NoTransitionPage(
      key: state.pageKey,
        child: const RemainderPage());}),
     GoRoute(path: '/edit',pageBuilder: (context,state){return  NoTransitionPage(key:state.pageKey,child: const NotesPage());}),
     GoRoute(path: '/archive',pageBuilder: (context,state){return NoTransitionPage(
       key: state.pageKey,
         child: const ArchivePage());}),
    GoRoute(path: '/trash',pageBuilder: (context,state){return NoTransitionPage(
      key: state.pageKey,
        child:  const BinPage());}),

  ],
builder: (context,state,child){
  return DashboardPage(child: child);
}

),
  ],
);