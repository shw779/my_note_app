import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_note_app/domain/model/note.dart';

abstract class NoteRepository {
  List<Note> getNoteList(Box<Note> box, String name);
  Note? getNoteDetail(Box<Note> box, int index);
  void deleteNote(Box<Note> box, int key);
  void deleteNoteList(Box<Note> box, List<int> keys);
  void putNote(Box<Note> box, int index, Note obj);
  void addNote(Box<Note> box, String name, Note obj);
}
