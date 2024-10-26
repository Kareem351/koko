import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koko/models/note_model.dart';
import 'package:koko/nots_cubit/notes_cubits.dart';
import 'package:koko/views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});

  final NoteModel note;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute
          (builder: (context){
      return EditNoteView(
        note: note,
      );
         }));
      },
      child: Container(
        padding: EdgeInsets.only(top: 24,bottom: 24,left: 13),
        decoration: BoxDecoration(
          color:Color(note.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
      
              title: Text(
                note.title,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 15,bottom: 15),
                child: Text(
                 note.subTitle ,
                  style: TextStyle(
                      color: Colors.black.withOpacity(.5),
                      fontSize: 18),),
              ),
              trailing: IconButton(onPressed: (){
                note.delete();
                BlocProvider.of<NotesCubit>(context).fetchAllNotes();
              },
                icon: Icon(Icons.delete,color: Colors.black,size: 32,),),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Text(
                note.date,
                style: TextStyle(
                    color: Colors.black.withOpacity(0.5)),),
            ),
          ],
        ),
      ),
    );
  }
}
