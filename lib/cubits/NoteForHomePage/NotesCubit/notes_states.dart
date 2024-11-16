import 'package:flutter/widgets.dart';
import 'package:notes_application/models/container_item_model.dart';

abstract class NotesStates {}

class InitialNotesState extends NotesStates {}

class SuccessNotesState extends NotesStates {
  final List<ContainerItemModel> modelList;

  SuccessNotesState({required this.modelList});
}
