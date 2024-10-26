import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:koko/nots_cubit/notes_cubits.dart';

import '../custom_app_bar.dart';
import 'custom_not_item.dart';
import 'notes_list_view.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {
  @override
  void initState(){
    super.initState();
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          SizedBox(height: 50,),
          CustomAppBar(
            title: 'ToDo List',
            icon: Icons.search,
          ),
          Expanded(
              child: NotosListView()),
        ],
      ),
    );
  }
}



