import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:koko/add_note_cubit/add_note_cubit.dart';
import 'package:koko/constants.dart';
import 'package:koko/models/note_model.dart';
import 'package:koko/simple_bloc_observer.dart';
import 'package:koko/views/notes_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'nots_cubit/notes_cubits.dart';


void main()async {
  await Hive.initFlutter();
  Bloc.observer = SimpleBlocObserver();
  Hive.registerAdapter(NoteModelAdapter());

  await Hive.openBox<NoteModel>(kNotesBox);
  runApp( const NotesApp());
}
class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context) => NotesCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(brightness: Brightness.dark),
        home:NotesView(),
      ),
    );
  }
}

