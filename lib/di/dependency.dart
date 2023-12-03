import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_note_app/data/repository_Impl/noteRepositoryImpl.dart';
import 'package:my_note_app/data/source/localData.dart';
import 'package:my_note_app/domain/model/note.dart';
import 'package:my_note_app/domain/repository/noteRepository.dart';
import 'package:my_note_app/domain/use_case/noteUseCase.dart';
import 'package:provider/provider.dart';

Future getProviders() async {
  await Hive.initFlutter();
  Hive.registerAdapter(NoteAdapter());
  final box = await Hive.openBox<Note>('memoList');
  LocalDataSource dataSource = LocalDataSource();
  NoteRepository repository = NoteRepositoryImpl(dataSource);
  NoteUseCase noteUseCase = NoteUseCase(repository, box);

  return [
    ChangeNotifierProvider(create: (_) => noteUseCase),
  ];
}
