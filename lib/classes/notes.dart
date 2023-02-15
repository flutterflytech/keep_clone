import 'package:hive/hive.dart';
part 'notes.g.dart';

@HiveType(typeId: 0)
class Notes extends HiveObject{
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String body;

  Notes(this.title, this.body);
}