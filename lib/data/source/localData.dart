import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_note_app/domain/model/note.dart';

class LocalDataSource {
  //get list
  List<Note>? getNoteList(Box<Note> box, String name) {
    return box.values.toList();
  }

  //get
  Note? getNoteDetail(Box<Note> box, int index) {
    return box.getAt(index);
  }

  //delete
  void deleteNote(Box<Note> box, int index) {
    box.deleteAt(index);
  }

  //delete list
  void deleteNoteList(Box<Note> box, List<int> keys) {
    for (var key in keys) {
      box.deleteAt(key);
    }
  }

  void addNote(Box<Note> box, String name, Note obj) {
    box.add(obj);
  }

  //edit
  void putNote(Box<Note> box, int index, Note obj) {
    box.putAt(index, obj);
  }
}
