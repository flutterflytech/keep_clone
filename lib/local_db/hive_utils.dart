// import 'package:hive/hive.dart';
//
// import '../classes/notes.dart';
//
// class HiveUtils{
//
//
//   getAllNotes()async{
//     var box = await Hive.openBox<List<Notes>>('myNotes');
//     box.get(key)
//
//   }
// }
//
//
//
// import 'package:hive_flutter/hive_flutter.dart';
//
// void main() async {
//   await Hive.initFlutter();
//   var friends = await Hive.openBox('friends');
//   friends.clear();
//
//   friends.add('Lisa');            // index 0, key 0
//   friends.add('Dave');            // index 1, key 1
//   friends.put(123, 'Marco');      // index 2, key 123
//   friends.add('Paul');            // index 3, key 124
//
//   print(friends.getAt(0));
//   print(friends.get(0));
//
//   print(friends.getAt(1));
//   print(friends.get(1));
//
//   print(friends.getAt(2));
//   print(friends.get(123));
//
//   print(friends.getAt(3));
//   print(friends.get(124));
// }
//
