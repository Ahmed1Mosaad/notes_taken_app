import 'package:flutter/material.dart';
import 'package:notes_application/models/container_item_model.dart';

@immutable
abstract class AddNoteStates {}

class InitialAddNoteState extends AddNoteStates {}

class LoadingAddNoteState extends AddNoteStates {}

class SuccessAddNoteState extends AddNoteStates {}

class FailureAddNoteState extends AddNoteStates {
  final String errMessage;

  FailureAddNoteState({required this.errMessage});
}
