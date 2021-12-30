import 'package:flutter/material.dart';
import 'package:notesapp_gsheets/google_sheets_api.dart';
import 'package:notesapp_gsheets/note_provider.dart';
import 'homepage.dart';
import 'package:provider/provider.dart';
import 'note_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GoogleSheetsApi().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        // brightness: Brightness.dark,
      ),
      home: ChangeNotifierProvider<NoteProvider>(
        create: (context) => NoteProvider(worksheet: GoogleSheetsApi.worksheet),
        child: const HomePage(),
      ),
    );
  }
}
