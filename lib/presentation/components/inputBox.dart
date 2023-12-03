import 'package:flutter/material.dart';

class InputBox extends StatelessWidget {
  const InputBox(
      {super.key,
      this.text,
      this.expands,
      this.readOnly,
      required this.controller});
  final String? text;
  final bool? expands;
  final bool? readOnly;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      readOnly: readOnly ?? true,
      textAlignVertical: TextAlignVertical.top,
      minLines: expands != true ? 1 : null,
      maxLines: expands != true ? 1 : null,
      expands: expands ?? false,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(
            color: Colors.purple.withOpacity(0.4),
          ),
        ),
      ),
    );
  }
}
