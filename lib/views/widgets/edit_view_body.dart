import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koko/models/note_model.dart';
import 'package:koko/nots_cubit/notes_cubits.dart';
import 'package:koko/views/custom_app_bar.dart';
import 'package:koko/views/widgets/custom_text_field.dart';

class EditNoteViewBoday extends StatefulWidget {
  const EditNoteViewBoday({super.key, required this.note,});


  final NoteModel note;

  @override
  State<EditNoteViewBoday> createState() => _EditNoteViewBodayState();
}

class _EditNoteViewBodayState extends State<EditNoteViewBoday> {
 String? title, content;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          const SizedBox(height: 50,),
          CustomAppBar(
            onPressed: (){
           widget.note.title = title ?? widget.note.title;
           widget.note.subTitle = content ?? widget.note.subTitle;
           widget.note.save();
           BlocProvider.of<NotesCubit>(context).fetchAllNotes();
           Navigator.pop(context);

            },
            title: 'Edite Task',
            icon: Icons.check,),
      SizedBox(height: 50,),
          CustomTextField(
            onChanged: (value){
              title = value;
            },
              hint: widget.note.title ,
          ),
          SizedBox(height: 18,),
          CustomTextField
            (
            onChanged: (value){
              content = value;
            },
            hint: widget.note.subTitle,
            maxLines: 5,),
        ],
      ),
    );
  }
}
