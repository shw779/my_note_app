import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_note_app/domain/model/note.dart';
import 'package:my_note_app/domain/use_case/noteUseCase.dart';
import 'package:my_note_app/presentation/components/appBar.dart';
import 'package:provider/provider.dart';

class NoteListScreen extends StatelessWidget {
  const NoteListScreen({super.key});

  Widget noteLineWidget(
      void Function()? onTap, String title, BuildContext context, int index) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              context.push("/detail/$index");
            },
            child: Text(
              title,
              style: const TextStyle(fontSize: 30),
            ),
          ),
        ),
        InkWell(
          onTap: onTap,
          child: const Icon(Icons.delete),
        )
      ],
    );
  }

  Widget getNoteListWidget() {
    return Consumer<NoteUseCase>(
      builder: (context, useCase, _) {
        List<Note> list = useCase.getNoteList('memoList');
        return Column(
          children: [
            ...List.generate(
              list.length,
              (index) => noteLineWidget(
                () => useCase.deleteNote(index),
                list[index].title,
                context,
                index,
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        isExistLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              getNoteListWidget(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                            Colors.purple.withOpacity(0.4))),
                    onPressed: () {
                      context.push('/add');
                    },
                    child: const Icon(
                      Icons.add,
                      size: 50,
                      weight: 50,
                      color: Colors.white,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
