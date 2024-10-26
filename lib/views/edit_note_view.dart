import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:koko/models/note_model.dart';
import 'package:koko/views/widgets/edit_view_body.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key, required this.note});

  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body:EditNoteViewBoday(
         note: note,
       ) ,

    );
  }
}
