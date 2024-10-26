import 'package:flutter/cupertino.dart';


@immutable
abstract class AddNotesState {}
class AddNotesInitial extends AddNotesState {}

class AddNotesLoading extends AddNotesState {}

class AddNotesSuccess extends AddNotesState {}

class AddNotesFailure extends AddNotesState {
  final String errMessage;
  AddNotesFailure(this.errMessage);
}
