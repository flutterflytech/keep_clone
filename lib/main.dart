import 'package:flutter/material.dart';
import 'package:google_keep_advanced/router.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'classes/notes.dart';



void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(NotesAdapter());
  await Hive.openBox<Notes>('myNotes');
  await Hive.openBox<Notes>('deletedNotes');
  await Hive.openBox<Notes>('archivedNotes');
  //usePathUrlStrategy();
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
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(overlayColor: MaterialStateProperty.resolveWith<Color>(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.hovered)) {
                  return Colors.black12;
                }else{
                  return Colors.white;
                }

              }),
          )),
          cardColor: Colors.white,

          colorSchemeSeed:  Colors.yellow,
        highlightColor: Colors.white,
        navigationRailTheme: const NavigationRailThemeData(
          backgroundColor: Colors.white
        ),
        useMaterial3: true
      ),
      // darkTheme:ThemeData(
      //   //primaryColor: Colors.blue,
      //   //primarySwatch:  Colors.yellow,
      //     textButtonTheme: TextButtonThemeData(
      //         style: ButtonStyle(overlayColor: MaterialStateProperty.resolveWith<Color>(
      //                 (Set<MaterialState> states) {
      //               if (states.contains(MaterialState.hovered)) {
      //                 return Colors.black12;
      //               }else{
      //                 return Colors.white;
      //               }
      //
      //             }),
      //         )),
      //
      //     colorSchemeSeed:  Colors.yellow,
      //     highlightColor: Colors.grey,
      //     navigationRailTheme: const NavigationRailThemeData(
      //         backgroundColor: Colors.black
      //     ),
      //     useMaterial3: true
      // ) ,
      // themeMode: ThemeMode.light,

    );
  }
}

