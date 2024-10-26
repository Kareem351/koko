import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koko/nots_cubit/notes_cubits.dart';
import 'package:koko/views/widgets/add_note_bottom_sheet.dart';
import 'package:koko/views/widgets/notes_view_body.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
                context: context,
                builder: (context){
            return AddNoteBottomSheet();

            });
          },
          backgroundColor: Colors.black.withOpacity(.9),
          child: const Icon(Icons.add,),),
        body: const NotesViewBody(),
      );
  }
}


