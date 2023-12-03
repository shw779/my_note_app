import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_note_app/domain/use_case/noteUseCase.dart';
import 'package:my_note_app/presentation/components/appBar.dart';
import 'package:my_note_app/presentation/components/button.dart';
import 'package:my_note_app/presentation/components/inputBox.dart';
import 'package:provider/provider.dart';

class AddNoteScreen extends StatelessWidget {
  const AddNoteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onTap: () {
          context.pop();
        },
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Consumer<NoteUseCase>(
              builder: (context, useCase, _) {
                useCase.initAddSetting();
                return Column(
                  children: [
                    InputBox(
                      readOnly: false,
                      controller: useCase.titleController,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: InputBox(
                        expands: true,
                        readOnly: false,
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
                            text: "save",
                            onPressed: () {
                              useCase.addNote();
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
