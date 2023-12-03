import 'package:hive/hive.dart';

part 'note.g.dart';

@HiveType(typeId: 1, adapterName: "NoteAdapter")
class Note extends HiveObject {
  Note(this.id, this.title, this.content, this.regDt);
  @HiveField(0)
  String id;
  @HiveField(1)
  String title;
  @HiveField(2)
  String content;
  @HiveField(3)
  DateTime regDt;
}
