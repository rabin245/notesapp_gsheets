import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';

class NoteProvider with ChangeNotifier {
  NoteProvider({required this.worksheet});
  Worksheet? worksheet;
  int numberOfNotes = 0;
  List<String> currentNotes = [];
  bool loading = true;

  Future init() async {
    if (worksheet == null) {
      print('worksheet is null!');
    }
    await countRows();
  }

  // void printCheck() {
  //   print('printCheck');
  //   print(loading);
  //   print(numberOfNotes);
  //   print(currentNotes);
  // }

  bool checkLoading() {
    return loading ? true : false;
  }

  Future countRows() async {
    while ((await worksheet!.values.value(column: 1, row: numberOfNotes + 1)) !=
        '') {
      numberOfNotes++;
    }

    //  now we know how many notes to load, now load them
    loadNotes();
  }

  // load existing notes from the sheet
  Future loadNotes() async {
    if (worksheet == null) return;

    for (int i = 0; i < numberOfNotes; i++) {
      final String newNote =
          await worksheet!.values.value(column: 1, row: i + 1);
      if (currentNotes.length < numberOfNotes) {
        currentNotes.add(newNote);
      }
    }
    loading = false;
    notifyListeners();
  }

  // insert a new note
  Future insert(String note) async {
    if (worksheet == null) return;
    numberOfNotes++;
    currentNotes.add(note);
    await worksheet!.values.appendRow([note]);
    notifyListeners();
  }
}
