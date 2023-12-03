import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_note_app/domain/model/note.dart';
import 'package:my_note_app/domain/repository/noteRepository.dart';

class NoteUseCase with ChangeNotifier {
  final NoteRepository repository;
  final Box<Note> box;
  NoteUseCase(this.repository, this.box);

  bool readOnly = true;
  late TextEditingController titleController;
  late TextEditingController contentController;

  void initAddSetting({Note? note}) {
    titleController = TextEditingController(text: note?.title);
    contentController = TextEditingController(text: note?.content);
  }

  void addNote() {
    final today = DateTime.now();
    repository.addNote(
      box,
      "memoList",
      Note(
        today.millisecondsSinceEpoch.toString(),
        titleController.text,
        contentController.text,
        today,
      ),
    );
    notifyListeners();
  }

  Note? getNoteDetail(int index) {
    Note? note = repository.getNoteDetail(box, index);
    initAddSetting(note: note);
    return note;
  }

  List<Note> getNoteList(String name) {
    return repository.getNoteList(box, name);
  }

  void putNote(int index, Note obj) {
    repository.putNote(box, index, obj);
    notifyListeners();
  }

  void deleteNote(int key) {
    repository.deleteNote(box, key);
    notifyListeners();
  }

  void deleteNoteList(List<int> keys) {
    repository.deleteNoteList(box, keys);
    notifyListeners();
  }

  void setEdit() {
    readOnly = !readOnly;
    notifyListeners();
  }
}
