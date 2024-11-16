import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_application/constants.dart';
import 'package:notes_application/cubits/NoteForCard/NotesCardCubit/notes_card_states.dart';
import 'package:notes_application/models/container_item_model.dart';

class NotesCardCubit extends Cubit<NotesCardStates> {
  NotesCardCubit() : super(InitialNotesCardCubit());
  List<ContainerItemModel>? modelList;
  fetchNotes() {
    final box = Hive.box<ContainerItemModel>(NoteBox2);
    modelList = box.values.toList();
    emit(SuccessNotesCardCubit());
  }

  
}
