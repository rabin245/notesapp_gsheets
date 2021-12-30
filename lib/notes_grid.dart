import 'package:flutter/material.dart';
import 'package:notesapp_gsheets/google_sheets_api.dart';
import 'textbox.dart';

class NotesGrid extends StatelessWidget {
  const NotesGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: GoogleSheetsApi.currentNotes.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        itemBuilder: (context, index) {
          return MyTextBox(text: GoogleSheetsApi.currentNotes[index]);
        },
      ),
    );
  }
}
