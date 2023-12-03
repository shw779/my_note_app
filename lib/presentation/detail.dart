import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_note_app/domain/model/note.dart';
import 'package:my_note_app/domain/use_case/noteUseCase.dart';
import 'package:my_note_app/presentation/components/appBar.dart';
import 'package:my_note_app/presentation/components/button.dart';
import 'package:my_note_app/presentation/components/inputBox.dart';
import 'package:provider/provider.dart';

class DetailNoteScreen extends StatelessWidget {
  const DetailNoteScreen({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onTap: () {
          context.read<NoteUseCase>().readOnly = true;
          context.pop();
        },
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Consumer<NoteUseCase>(
              builder: (context, useCase, _) {
                Note? note = useCase.getNoteDetail(index);
                if (note == null) {
                  return Container();
                }
                return Column(
                  children: [
                    InputBox(
                      text: note.title,
                      readOnly: useCase.readOnly,
                      controller: useCase.titleController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: InputBox(
                        text: note.content,
                        expands: true,
                        readOnly: useCase.readOnly,
                        controller: useCase.contentController,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Button(
                            text: useCase.readOnly ? "edit" : "save",
                            onPressed: () {
                              if (!useCase.readOnly) {
                                note.title = useCase.titleController.text;
                                note.content = useCase.contentController.text;
                                useCase.putNote(index, note);
                              }
                              useCase.setEdit();
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: Button(
                            text: "delete",
                            onPressed: () {
                              useCase.deleteNote(index);
                              context.pop();
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
