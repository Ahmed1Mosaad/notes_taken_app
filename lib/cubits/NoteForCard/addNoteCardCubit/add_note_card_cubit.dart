import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_application/constants.dart';
import 'package:notes_application/cubits/NoteForCard/addNoteCardCubit/add_note_card_states.dart';
import 'package:notes_application/models/container_item_model.dart';

class AddNoteCardCubit extends Cubit<AddNoteCardStates> {
  AddNoteCardCubit() : super(InitialAddNoteCardStates());
  Color color = Colors.blue;

  Future<void> addNoteCard(ContainerItemModel model) async {
    model.color = color.value;
    emit(LoadingAddNoteCardStates());
    try {
      final box = Hive.box<ContainerItemModel>(NoteBox2);
      await box.add(model);
      emit(SuccessAddNoteCardStates());
    } catch (e) {
      emit(FailureAddNoteCardStates(errMessage: e.toString()));
    }
  }
}
