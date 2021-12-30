import 'package:flutter/material.dart';
import 'package:notesapp_gsheets/note_provider.dart';
import 'textbox.dart';
import 'package:provider/provider.dart';

class NotesGrid extends StatelessWidget {
  const NotesGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var noteProvider = context.watch<NoteProvider>();
    return Expanded(
      child: GridView.builder(
        itemCount: noteProvider.currentNotes.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return MyTextBox(text: noteProvider.currentNotes[index]);
        },
      ),
    );
  }
}
