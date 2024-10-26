import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:koko/constants.dart';
import 'package:koko/models/note_model.dart';

import 'add_notes_state.dart';


class AddNotesCubit extends Cubit<AddNotesState> {
  AddNotesCubit() : super(AddNotesInitial());


  addNote(NoteModel note) async {
    emit(AddNotesLoading());
    try {
      var notesBox = Hive.box<NoteModel>(kNotesBox);
      await notesBox.add(note);
      emit(AddNotesSuccess());
    } catch (e){
  emit(AddNotesFailure(e.toString()));
    }
  }
}
