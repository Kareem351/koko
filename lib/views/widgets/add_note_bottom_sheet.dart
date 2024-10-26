import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koko/add_note_cubit/add_note_cubit.dart';
import 'package:koko/add_note_cubit/add_notes_state.dart';
import 'package:koko/nots_cubit/notes_cubits.dart';
import 'add_note_form.dart';


class AddNoteBottomSheet extends StatelessWidget {
   AddNoteBottomSheet({super.key}) ;
   
  @override

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNotesCubit(),
      child: BlocConsumer<AddNotesCubit, AddNotesState>(
        listener: (context, state) {
          if(state is AddNotesFailure){

          }
          if (state is AddNotesSuccess){
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            Navigator.pop(context);
          }
        },
        builder: (context, state) {
          print('ui rebuild');
          return AbsorbPointer(
            absorbing: state is AddNotesLoading ? true : false,
            child: Padding(
                    padding:  EdgeInsets.only(
                      left: 16,
                      right: 16,
                      bottom: MediaQuery.of(context).viewInsets.bottom),
              child: const SingleChildScrollView(
                  child: const AddNoteForm()),
            ),
          );
        },

      ),
    );
  }
}

