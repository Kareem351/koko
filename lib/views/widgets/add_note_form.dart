import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:koko/add_note_cubit/add_note_cubit.dart';
import 'package:koko/add_note_cubit/add_notes_state.dart';
import 'package:koko/models/note_model.dart';

import 'color_list_view.dart';
import 'custom_buttom.dart';
import 'custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return  Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          SizedBox(height: 32,),
          CustomTextField(
            onSaved:(value){
              title = value;
            } ,
            hint: 'Task Title ',),
          SizedBox(height: 18,),
          CustomTextField(
            onSaved:(value){
              subTitle = value;
            } ,
            hint: 'Content',
            maxLines: 5,),
          SizedBox(height: 50,),
          ColorListView(),
          SizedBox(height: 50,),
          BlocBuilder<AddNotesCubit,AddNotesState>(
            builder: (context,state){
            return  CustomButton(
                isLoading: state is AddNotesLoading ? true : false,
                onTap: (){
                  if(formKey.currentState!.validate()){
                    formKey.currentState!.save();
                    var currentDate = DateTime.now();
                    var formattedCurrentDate =
                    DateFormat.yMd().format(currentDate);
                    var notModel = NoteModel(
                        title: title!,
                        subTitle: subTitle!,
                        date: formattedCurrentDate,
                        color: Colors.blue.value);
                    BlocProvider.of<AddNotesCubit>(context).addNote(notModel);
                  }else{
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                 },

                );

            }
          ),

          SizedBox(height: 50,),
        ],
      ),
    );
  }
}





