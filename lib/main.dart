import 'package:flutter/material.dart';
import 'package:google_keep_advanced/router.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'classes/notes.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(NotesAdapter());
  await Hive.openBox<Notes>('myNotes');
  await Hive.openBox<Notes>('deletedNotes');
  await Hive.openBox<Notes>('archivedNotes');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
     routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      title: 'Google Keep',
      theme: ThemeData(
        //primaryColor: Colors.blue,
        //primarySwatch:  Colors.yellow,

          colorSchemeSeed:  Colors.yellow,
        navigationRailTheme: const NavigationRailThemeData(
          backgroundColor: Colors.white
        ),
        useMaterial3: true
      ),

    );
  }
}

