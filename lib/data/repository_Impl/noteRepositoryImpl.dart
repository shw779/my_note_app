import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_note_app/data/source/localData.dart';
import 'package:my_note_app/domain/model/note.dart';
import 'package:my_note_app/domain/repository/noteRepository.dart';

class NoteRepositoryImpl implements NoteRepository {
  LocalDataSource dataSource;
  NoteRepositoryImpl(this.dataSource);

  @override
  List<Note> getNoteList(Box<Note> box, String name) {
    return dataSource.getNoteList(box, name) ?? [];
  }

  @override
  Note? getNoteDetail(Box<Note> box, int index) {
    return dataSource.getNoteDetail(box, index);
  }

  @override
  void deleteNote(Box<Note> box, int key) {
    dataSource.deleteNote(box, key);
  }

  @override
  void deleteNoteList(Box<Note> box, List<int> keys) {
    dataSource.deleteNoteList(box, keys);
  }

  @override
  void putNote(Box<Note> box, int index, Note obj) {
    dataSource.putNote(box, index, obj);
  }

  @override
  void addNote(Box<Note> box, String name, Note obj) {
    dataSource.addNote(box, name, obj);
  }

  int? getCounter(Box<int> counterBox) {
    return dataSource.getCounter(counterBox);
  }

  void increaseCounter(Box<int> counterBox) {
    dataSource.increaseCounter(counterBox);
  }
}
