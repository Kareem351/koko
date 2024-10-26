import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koko/models/note_model.dart';
import 'package:koko/nots_cubit/notes_cubits.dart';
import 'package:koko/nots_cubit/notes_state.dart';

import 'custom_not_item.dart';

class NotosListView extends StatelessWidget {
  const NotosListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotesCubit, NotesState>(
      builder: (context,state) {

        List<NoteModel> notes = BlocProvider.of<NotesCubit>(context).notes!;
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: ListView.builder(
              itemCount: notes.length ,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return   Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: NoteItem(
                    note: notes[index],

                  ),
                );
              }),
        );
      }
    );
  }
}
