import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_application/cubits/NoteForHomePage/addNoteCubit/add_note_state.dart';
import 'package:notes_application/models/container_item_model.dart';

class AddNoteCubit extends Cubit<AddNoteStates> {
  AddNoteCubit() : super(InitialAddNoteState());
  Color color = const Color.fromARGB(255, 199, 201, 254);

  Future<void> addNote(ContainerItemModel model, String boxName) async {
    emit(LoadingAddNoteState());
    try {
      model.color = color.value;
      final box = Hive.box<ContainerItemModel>(boxName);
      await box.add(model);
      emit(SuccessAddNoteState());
    } catch (e) {
      emit(FailureAddNoteState(errMessage: e.toString()));
      print(e.toString());
    }
  }
}
